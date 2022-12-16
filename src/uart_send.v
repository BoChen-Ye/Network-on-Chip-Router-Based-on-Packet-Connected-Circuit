module uart_send
#(
parameter  WIDTH = 66,
parameter  CLK_FREQ = 50000000,            //ϵͳʱ��Ƶ��
parameter  UART_BPS = 9600,                //���ڲ�����
parameter  COUNT = 8,
parameter  DEPTH = 128
)
(
    input	      sys_clk,                  //ϵͳʱ��
    input         sys_rst_n,                //ϵͳ��λ���͵�ƽ��Ч
    
    input         uart_en,                  //����ʹ���ź�
    input  [WIDTH-1:0] uart_din,                 //����������
    
    output  reg   tx_flag,                  //���͹��̱�־�ź�            
    output  reg [6:0] tx_cnt,              //�������ݼ�����
	output	emptyp,
    output  reg   uart_txd                  //UART���Ͷ˿�
    );
    
//parameter define

localparam  BPS_CNT  = CLK_FREQ/UART_BPS;   //Ϊ�õ�ָ�������ʣ���ϵͳʱ�Ӽ���BPS_CNT��

//reg define
reg             	  emptyp;
reg             	  fullp;
reg	 [WIDTH-1:0]	  x;
reg					  rd_flag;
reg  [WIDTH-1:0] 	  tx_data;
reg	 [(COUNT-1):0]    tail;
reg	 [(COUNT-1):0]    head;  
reg  [15:0] 		  clk_cnt;                           //ϵͳʱ�Ӽ�����
reg	 [WIDTH-1:0]      fifomem[0:DEPTH];
//*****************************************************
//**                    main code
//*****************************************************
// dout������tailָ��ָ�����ֵ
always @(posedge sys_clk)  begin
  if(!sys_rst_n) begin
    tx_data <= 66'd0;       // ��λ�ź���Ч��0
  end
  else if(tx_flag)begin
    tx_data <= fifomem[tail];	//��fifomem�е�tail����Ԫ��dout
  end
  else if (emptyp == 1'b1)
	tx_data <= 66'd0;
  else 
	tx_data <= tx_data;
end
//tailָ�����
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

// д������
always @(posedge sys_clk) begin
    if(sys_rst_n==1'b1 && uart_en==1'b1&& x!=uart_din ) begin
        fifomem[head]<=uart_din;      // д��
    end
end
//x�ӳ�һ������
/*always@(posedge sys_clk)
begin
	if(!sys_rst_n)
		x_delay <= 1'b0;
	else
		x_delay <= x;
end*/
//���ÿ��din����ֵ�Ƿ���ͬ
always @(posedge sys_clk) begin
	if (uart_en==1'b1)
		x <= uart_din;
	else if (x != uart_din)
		x <= uart_din;
	else
		x <= x;
end	
// headָ�����
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
// emptyָ��
always @(posedge sys_clk) begin
   if (tail == DEPTH + 1)
      emptyp <= 1'b1;      //countΪ0ʱemptyp��Ϊ1
   else
      emptyp <= 1'b0;
end

always @(posedge sys_clk) begin
   if (head == DEPTH)
      fullp <= 1'b1;                     //���������ʱfullp��Ϊ1
   else
      fullp <= 1'b0;
end

//�������ź�en_flag����ʱ,�Ĵ�����͵����ݣ������뷢�͹���          
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin                                  
        tx_flag <= 1'b0;
		rd_flag <= 1'b0;
    end 
    else if (fullp) begin                //��⵽fifomemװ��                      
            rd_flag <= 1'b1;                //���뷢�͹��̣���־λrd_flag����
	end 											
    else if ((tx_cnt == 7'd39) && (clk_cnt == BPS_CNT - (BPS_CNT/16)))begin //������ֹͣλ����ʱ��ֹͣ���͹���                                       
            rd_flag <= 1'b1;
			tx_flag <= 1'b0;			//���͹��̽�������־λtx_flag����
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

//���뷢�͹��̺�����ϵͳʱ�Ӽ�����
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n)                             
        clk_cnt <= 16'd0;                                  
    else if (tx_flag) begin                 //���ڷ��͹���
        if (clk_cnt < BPS_CNT - 1)
            clk_cnt <= clk_cnt + 1'b1;
        else
            clk_cnt <= 16'd0;               //��ϵͳʱ�Ӽ�����һ�����������ں�����
    end
    else                             
        clk_cnt <= 16'd0; 				    //���͹��̽���
end

//���뷢�͹��̺������������ݼ�����
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n)                             
        tx_cnt <= 7'd0;
    else if (tx_flag) begin                 //���ڷ��͹���
        if (clk_cnt == BPS_CNT - 1)			//��ϵͳʱ�Ӽ�����һ������������
            tx_cnt <= tx_cnt + 1'b1;		//��ʱ�������ݼ�������1
        else
            tx_cnt <= tx_cnt;       
    end
    else                              
        tx_cnt  <= 7'd0;				    //���͹��̽���
end

//���ݷ������ݼ���������uart���Ͷ˿ڸ�ֵ
always @(posedge sys_clk or negedge sys_rst_n) begin        
    if (!sys_rst_n)  
        uart_txd <= 1'b1;        
    else if (tx_flag)
        case(tx_cnt)
            7'd0: uart_txd <= 1'b0;         //��ʼλ 
            7'd1: uart_txd <= tx_data[0];   //����λ���λ
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
            7'd82: uart_txd <= tx_data[65];			//����λ���λ
            7'd83: uart_txd <= 1'b0;
			7'd84: uart_txd <= 1'b0;
			7'd85: uart_txd <= 1'b0;
			7'd86: uart_txd <= 1'b0;
			7'd87: uart_txd <= 1'b0;
			7'd88: uart_txd <= 1'b0;
			7'd89: uart_txd <= 1'b1;         //ֹͣλ
            default: ;
        endcase
    else 
        uart_txd <= 1'b1;                   //����ʱ���Ͷ˿�Ϊ�ߵ�ƽ
end

endmodule