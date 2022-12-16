module uart_data
#(
parameter  WIDTH = 66,
parameter  CLK_FREQ = 50000000,            //ϵͳʱ��Ƶ��
parameter  UART_BPS = 9600               //���ڲ�����

)(
    input	      sys_clk,                  //ϵͳʱ��
    input         sys_rst_n,                //ϵͳ��λ���͵�ƽ��Ч
    
    input         uart_en,                  //����ʹ���ź�
    input  [WIDTH-1:0]  uart_din,                 //����������


	output	reg send_flag,
    output  reg [ 6:0] tx_cnt,              //�������ݼ�����
    output  reg   uart_txd                  //UART���Ͷ˿�
    );
    
//parameter define

localparam  BPS_CNT  = CLK_FREQ/UART_BPS;   //Ϊ�õ�ָ�������ʣ���ϵͳʱ�Ӽ���BPS_CNT��

//reg define
reg        uart_en_d0; 
reg        uart_en_d1;  
reg [15:0] clk_cnt;                           //ϵͳʱ�Ӽ�����
reg  [WIDTH-1:0] 	  tx_data;
reg   tx_flag;

//wire define
wire       en_flag;

//*****************************************************
//**                    main code
//*****************************************************
//�ڴ��ڷ��͹����и���æ״̬��־


//����uart_en�����أ��õ�һ��ʱ�����ڵ������ź�
assign en_flag = (~uart_en_d1) & uart_en_d0;
assign pos_flag = (~uart_en_d0) & uart_en_d1;
//�Է���ʹ���ź�uart_en�ӳ�����ʱ������
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

//�������ź�en_flag����ʱ,�Ĵ�����͵����ݣ������뷢�͹���          
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin                                  
        tx_flag <= 1'b0;
        tx_data <= 32'd0;
    end 
    else if (en_flag||pos_flag) begin                 //��⵽����ʹ��������                      
            tx_flag <= 1'b1;                //���뷢�͹��̣���־λtx_flag����
            tx_data <= uart_din;            //�Ĵ�����͵�����
			send_flag<=1'b0;
        end
                                            //������ֹͣλ����ʱ��ֹͣ���͹���
        else if ((tx_cnt == 6'd39) && (clk_cnt == BPS_CNT - (BPS_CNT/16))) begin                                       
            tx_flag <= 1'b0;                //���͹��̽�������־λtx_flag����
            tx_data <= 32'd0;
			send_flag<=1'b1;
        end
        else begin
            tx_flag <= tx_flag;
            tx_data <= tx_data;
			send_flag<=1'b0;
        end 
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
        tx_cnt <= 6'd0;
    else if (tx_flag) begin                 //���ڷ��͹���
        if (clk_cnt == BPS_CNT - 1)			//��ϵͳʱ�Ӽ�����һ������������
            tx_cnt <= tx_cnt + 1'b1;		//��ʱ�������ݼ�������1
        else
            tx_cnt <= tx_cnt;       
    end
    else                              
        tx_cnt  <= 6'd0;				    //���͹��̽���
end

//���ݷ������ݼ���������uart���Ͷ˿ڸ�ֵ
always @(posedge sys_clk or negedge sys_rst_n) begin        
    if (!sys_rst_n)  
        uart_txd <= 1'b1;        
    else if (tx_flag)
        case(tx_cnt)
            6'd0: uart_txd <= 1'b0;         //��ʼλ 
            6'd1: uart_txd <= tx_data[0];   //����λ���λ
            6'd2: uart_txd <= tx_data[1];
            6'd3: uart_txd <= tx_data[2];
            6'd4: uart_txd <= tx_data[3];
            6'd5: uart_txd <= tx_data[4];
            6'd6: uart_txd <= tx_data[5];
            6'd7: uart_txd <= tx_data[6];
            6'd8: uart_txd <= tx_data[7];   //����λ���λ
            6'd9: uart_txd <= 1'b1;         //ֹͣλ
			
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
        uart_txd <= 1'b1;                   //����ʱ���Ͷ˿�Ϊ�ߵ�ƽ
end

endmodule	          