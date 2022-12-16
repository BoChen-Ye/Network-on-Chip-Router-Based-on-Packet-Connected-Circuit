module uart_send
#(
parameter  WIDTH = 66,
parameter  CLK_FREQ = 50000000,            //系统时钟频率
parameter  UART_BPS = 9600,                //串口波特率
parameter  COUNT = 8,
parameter  DEPTH = 128
)
(
    input	      sys_clk,                  //系统时钟
    input         sys_rst_n,                //系统复位，低电平有效
    
    input         uart_en,                  //发送使能信号
    input  [WIDTH-1:0] uart_din,                 //待发送数据
    
    output  reg   tx_flag,                  //发送过程标志信号            
    output  reg [6:0] tx_cnt,              //发送数据计数器
	output	emptyp,
    output  reg   uart_txd                  //UART发送端口
    );
    
//parameter define

localparam  BPS_CNT  = CLK_FREQ/UART_BPS;   //为得到指定波特率，对系统时钟计数BPS_CNT次

//reg define
reg             	  emptyp;
reg             	  fullp;
reg	 [WIDTH-1:0]	  x;
reg					  rd_flag;
reg  [WIDTH-1:0] 	  tx_data;
reg	 [(COUNT-1):0]    tail;
reg	 [(COUNT-1):0]    head;  
reg  [15:0] 		  clk_cnt;                           //系统时钟计数器
reg	 [WIDTH-1:0]      fifomem[0:DEPTH];
//*****************************************************
//**                    main code
//*****************************************************
// dout被赋给tail指针指向的数值
always @(posedge sys_clk)  begin
  if(!sys_rst_n) begin
    tx_data <= 66'd0;       // 复位信号有效置0
  end
  else if(tx_flag)begin
    tx_data <= fifomem[tail];	//将fifomem中第tail个单元给dout
  end
  else if (emptyp == 1'b1)
	tx_data <= 66'd0;
  else 
	tx_data <= tx_data;
end
//tail指针递增
always @(posedge sys_clk) begin
    if(!sys_rst_n) begin
        tail<=8'd0;
    end
    else begin
        if(rd_flag==1'b1) 
        tail<=tail+1;
        else if (tail>DEPTH)
		tail<=8'd0;
    end
end

// 写入数据
always @(posedge sys_clk) begin
    if(sys_rst_n==1'b1 && uart_en==1'b1&& x!=uart_din ) begin
        fifomem[head]<=uart_din;      // 写入
    end
end
//x延迟一个周期
/*always@(posedge sys_clk)
begin
	if(!sys_rst_n)
		x_delay <= 1'b0;
	else
		x_delay <= x;
end*/
//检测每次din输入值是否相同
always @(posedge sys_clk) begin
	if (uart_en==1'b1)
		x <= uart_din;
	else if (x != uart_din)
		x <= uart_din;
	else
		x <= x;
end	
// head指针递增
always @(posedge sys_clk) begin
    if(!sys_rst_n) begin
        head<=8'd0;
    end
    else begin
        if(uart_en==1'b1&& x!=uart_din) 
        head<=head+1;
        else if (emptyp==1'b1)
		head<=8'd0;
    end
end
// empty指针
always @(posedge sys_clk) begin
   if (tail == DEPTH + 1)
      emptyp <= 1'b1;      //count为0时emptyp赋为1
   else
      emptyp <= 1'b0;
end

always @(posedge sys_clk) begin
   if (head == DEPTH)
      fullp <= 1'b1;                     //计数到最大时fullp赋为1
   else
      fullp <= 1'b0;
end

//当脉冲信号en_flag到达时,寄存待发送的数据，并进入发送过稿          
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin                                  
        tx_flag <= 1'b0;
		rd_flag <= 1'b0;
    end 
    else if (fullp) begin                //检测到fifomem装满                      
            rd_flag <= 1'b1;                //进入发送过程，标志位rd_flag拉高
	end 											
    else if ((tx_cnt == 7'd39) && (clk_cnt == BPS_CNT - (BPS_CNT/16)))begin //计数到停止位结束时，停止发送过程                                       
            rd_flag <= 1'b1;
			tx_flag <= 1'b0;			//发送过程结束，标志位tx_flag拉低
	end
	else if (emptyp == 1'b1) begin	
			tx_flag <= 1'b0;
			rd_flag <= 1'b0;                            
    end
	else if(rd_flag == 1'b1)begin                                     
            tx_flag <= 1'b1;                
            rd_flag	<=1'b0; 			
	end			
    else 
		tx_flag <= tx_flag;               
end

//进入发送过程后，启动系统时钟计数器
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n)                             
        clk_cnt <= 16'd0;                                  
    else if (tx_flag) begin                 //处于发送过程
        if (clk_cnt < BPS_CNT - 1)
            clk_cnt <= clk_cnt + 1'b1;
        else
            clk_cnt <= 16'd0;               //对系统时钟计数达一个波特率周期后清零
    end
    else                             
        clk_cnt <= 16'd0; 				    //发送过程结束
end

//进入发送过程后，启动发送数据计数器
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n)                             
        tx_cnt <= 7'd0;
    else if (tx_flag) begin                 //处于发送过程
        if (clk_cnt == BPS_CNT - 1)			//对系统时钟计数达一个波特率周期
            tx_cnt <= tx_cnt + 1'b1;		//此时发送数据计数器加1
        else
            tx_cnt <= tx_cnt;       
    end
    else                              
        tx_cnt  <= 7'd0;				    //发送过程结束
end

//根据发送数据计数器来给uart发送端口赋值
always @(posedge sys_clk or negedge sys_rst_n) begin        
    if (!sys_rst_n)  
        uart_txd <= 1'b1;        
    else if (tx_flag)
        case(tx_cnt)
            7'd0: uart_txd <= 1'b0;         //起始位 
            7'd1: uart_txd <= tx_data[0];   //数据位最低位
            7'd2: uart_txd <= tx_data[1];
            7'd3: uart_txd <= tx_data[2];
            7'd4: uart_txd <= tx_data[3];
            7'd5: uart_txd <= tx_data[4];
            7'd6: uart_txd <= tx_data[5];
			7'd7: uart_txd <= tx_data[6];
            7'd8: uart_txd <= tx_data[7];
			7'd9: uart_txd <= 1'b1;
			
			7'd10: uart_txd <= 1'b0;   
			7'd11: uart_txd <= tx_data[8];   
            7'd12: uart_txd <= tx_data[9];
            7'd13: uart_txd <= tx_data[10];
            7'd14: uart_txd <= tx_data[11];
			7'd15: uart_txd <= tx_data[12];
            7'd16: uart_txd <= tx_data[13];
            7'd17: uart_txd <= tx_data[14];
            7'd18: uart_txd <= tx_data[15];
			7'd19: uart_txd <= 1'b1;
			
			7'd20: uart_txd <= 1'b0;
			7'd21: uart_txd <= tx_data[16];
            7'd22: uart_txd <= tx_data[17];
			7'd23: uart_txd <= tx_data[18];
            7'd24: uart_txd <= tx_data[19];
            7'd25: uart_txd <= tx_data[20];
            7'd26: uart_txd <= tx_data[21];
			7'd27: uart_txd <= tx_data[22];
            7'd28: uart_txd <= tx_data[23];
			7'd29: uart_txd <= 1'b1;
			
			7'd30: uart_txd <= 1'b0;
            7'd31: uart_txd <= tx_data[24];
            7'd32: uart_txd <= tx_data[25];
			7'd33: uart_txd <= tx_data[26];
            7'd34: uart_txd <= tx_data[27];
            7'd35: uart_txd <= tx_data[28];
            7'd36: uart_txd <= tx_data[29];
			7'd37: uart_txd <= tx_data[30];
			7'd38: uart_txd <= tx_data[31];
			7'd39: uart_txd <= 1'b1;
			
			7'd40: uart_txd <= 1'b0;
			7'd41: uart_txd <= tx_data[32];
            7'd42: uart_txd <= tx_data[33];
            7'd43: uart_txd <= tx_data[34];
            7'd44: uart_txd <= tx_data[35];
			7'd45: uart_txd <= tx_data[36];
            7'd46: uart_txd <= tx_data[37];
            7'd47: uart_txd <= tx_data[38];
            7'd48: uart_txd <= tx_data[39];
			7'd49: uart_txd <= 1'b1;
			
			7'd50: uart_txd <= 1'b0;
            7'd51: uart_txd <= tx_data[40];
			7'd52: uart_txd <= tx_data[41];
			7'd53: uart_txd <= tx_data[42];
            7'd54: uart_txd <= tx_data[43];
            7'd55: uart_txd <= tx_data[44];
            7'd56: uart_txd <= tx_data[45];
			7'd57: uart_txd <= tx_data[46];
            7'd58: uart_txd <= tx_data[47];
			7'd59: uart_txd <= 1'b1;
			
			7'd60: uart_txd <= 1'b0;
            7'd61: uart_txd <= tx_data[48];
            7'd62: uart_txd <= tx_data[49];
            7'd63: uart_txd <= tx_data[50];
			7'd64: uart_txd <= tx_data[51];
			7'd65: uart_txd <= tx_data[52];
            7'd66: uart_txd <= tx_data[53];
			7'd67: uart_txd <= tx_data[54];
            7'd68: uart_txd <= tx_data[55];
			7'd69: uart_txd <= 1'b1;
			
			7'd70: uart_txd <= 1'b0;
			7'd71: uart_txd <= tx_data[56];
            7'd72: uart_txd <= tx_data[57];
            7'd73: uart_txd <= tx_data[58];
            7'd74: uart_txd <= tx_data[59];
			7'd75: uart_txd <= tx_data[60];
			7'd76: uart_txd <= tx_data[61];
			7'd77: uart_txd <= tx_data[62];
            7'd78: uart_txd <= tx_data[63];
			7'd79: uart_txd <= 1'b1;
			
			7'd80: uart_txd <= 1'b0;
            7'd81: uart_txd <= tx_data[64];
            7'd82: uart_txd <= tx_data[65];			//数据位最高位
            7'd83: uart_txd <= 1'b0;
			7'd84: uart_txd <= 1'b0;
			7'd85: uart_txd <= 1'b0;
			7'd86: uart_txd <= 1'b0;
			7'd87: uart_txd <= 1'b0;
			7'd88: uart_txd <= 1'b0;
			7'd89: uart_txd <= 1'b1;         //停止位
            default: ;
        endcase
    else 
        uart_txd <= 1'b1;                   //空闲时发送端口为高电平
end

endmodule