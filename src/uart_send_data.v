module uart_data
#(
parameter  WIDTH = 66,
parameter  CLK_FREQ = 50000000,            //系统时钟频率
parameter  UART_BPS = 9600               //串口波特率

)(
    input	      sys_clk,                  //系统时钟
    input         sys_rst_n,                //系统复位，低电平有效
    
    input         uart_en,                  //发送使能信号
    input  [WIDTH-1:0]  uart_din,                 //待发送数据


	output	reg send_flag,
    output  reg [ 6:0] tx_cnt,              //发送数据计数器
    output  reg   uart_txd                  //UART发送端口
    );
    
//parameter define

localparam  BPS_CNT  = CLK_FREQ/UART_BPS;   //为得到指定波特率，对系统时钟计数BPS_CNT次

//reg define
reg        uart_en_d0; 
reg        uart_en_d1;  
reg [15:0] clk_cnt;                           //系统时钟计数器
reg  [WIDTH-1:0] 	  tx_data;
reg   tx_flag;

//wire define
wire       en_flag;

//*****************************************************
//**                    main code
//*****************************************************
//在串口发送过程中给出忙状态标志


//捕获uart_en上升沿，得到一个时钟周期的脉冲信号
assign en_flag = (~uart_en_d1) & uart_en_d0;
assign pos_flag = (~uart_en_d0) & uart_en_d1;
//对发送使能信号uart_en延迟两个时钟周期
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin
        uart_en_d0 <= 1'b0;                                  
        uart_en_d1 <= 1'b0;
    end                                                      
    else begin                                               
        uart_en_d0 <= uart_en;                               
        uart_en_d1 <= uart_en_d0;                            
    end
end

//当脉冲信号en_flag到达时,寄存待发送的数据，并进入发送过程          
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin                                  
        tx_flag <= 1'b0;
        tx_data <= 32'd0;
    end 
    else if (en_flag||pos_flag) begin                 //检测到发送使能上升沿                      
            tx_flag <= 1'b1;                //进入发送过程，标志位tx_flag拉高
            tx_data <= uart_din;            //寄存待发送的数据
			send_flag<=1'b0;
        end
                                            //计数到停止位结束时，停止发送过程
        else if ((tx_cnt == 6'd39) && (clk_cnt == BPS_CNT - (BPS_CNT/16))) begin                                       
            tx_flag <= 1'b0;                //发送过程结束，标志位tx_flag拉低
            tx_data <= 32'd0;
			send_flag<=1'b1;
        end
        else begin
            tx_flag <= tx_flag;
            tx_data <= tx_data;
			send_flag<=1'b0;
        end 
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
        tx_cnt <= 6'd0;
    else if (tx_flag) begin                 //处于发送过程
        if (clk_cnt == BPS_CNT - 1)			//对系统时钟计数达一个波特率周期
            tx_cnt <= tx_cnt + 1'b1;		//此时发送数据计数器加1
        else
            tx_cnt <= tx_cnt;       
    end
    else                              
        tx_cnt  <= 6'd0;				    //发送过程结束
end

//根据发送数据计数器来给uart发送端口赋值
always @(posedge sys_clk or negedge sys_rst_n) begin        
    if (!sys_rst_n)  
        uart_txd <= 1'b1;        
    else if (tx_flag)
        case(tx_cnt)
            6'd0: uart_txd <= 1'b0;         //起始位 
            6'd1: uart_txd <= tx_data[0];   //数据位最低位
            6'd2: uart_txd <= tx_data[1];
            6'd3: uart_txd <= tx_data[2];
            6'd4: uart_txd <= tx_data[3];
            6'd5: uart_txd <= tx_data[4];
            6'd6: uart_txd <= tx_data[5];
            6'd7: uart_txd <= tx_data[6];
            6'd8: uart_txd <= tx_data[7];   //数据位最高位
            6'd9: uart_txd <= 1'b1;         //停止位
			
			6'd10: uart_txd <= 1'b0;   
			6'd11: uart_txd <= tx_data[8];   
            6'd12: uart_txd <= tx_data[9];
            6'd13: uart_txd <= tx_data[10];
            6'd14: uart_txd <= tx_data[11];
			6'd15: uart_txd <= tx_data[12];
            6'd16: uart_txd <= tx_data[13];
            6'd17: uart_txd <= tx_data[14];
            6'd18: uart_txd <= tx_data[15];
			6'd19: uart_txd <= 1'b1;
			
			6'd20: uart_txd <= 1'b0;
			6'd21: uart_txd <= tx_data[16];
            6'd22: uart_txd <= tx_data[17];
			6'd23: uart_txd <= tx_data[18];
            6'd24: uart_txd <= tx_data[19];
            6'd25: uart_txd <= tx_data[20];
            6'd26: uart_txd <= tx_data[21];
			6'd27: uart_txd <= tx_data[22];
            6'd28: uart_txd <= tx_data[23];
			6'd29: uart_txd <= 1'b1;
			
			6'd30: uart_txd <= 1'b0;
            6'd31: uart_txd <= tx_data[24];
            6'd32: uart_txd <= tx_data[25];
			6'd33: uart_txd <= tx_data[26];
            6'd34: uart_txd <= tx_data[27];
            6'd35: uart_txd <= tx_data[28];
            6'd36: uart_txd <= tx_data[29];
			6'd37: uart_txd <= tx_data[30];
			6'd38: uart_txd <= tx_data[31];
			6'd39: uart_txd <= 1'b1;
            default: ;
        endcase
    else 
        uart_txd <= 1'b1;                   //空闲时发送端口为高电平
end

endmodule	          