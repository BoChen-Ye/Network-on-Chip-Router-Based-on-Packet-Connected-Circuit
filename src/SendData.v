`timescale 1ns / 10ps

//`define B		50
//`define T		10


module SendData
#(
parameter   B                =   8'd5,
parameter   T                 =   6'd10,
parameter   PACKAGE_LENGTH     =    16'd128,
parameter	PACKAGE_SEND_INTERVAL	=	4,
parameter	PACKAGE_NUM	=	3,
parameter	POTNUM		=	8'd1,
parameter	DOT_D7		=	8'h00,
parameter	DOT_D6		=	8'h00,
parameter	DOT_D5		=	8'h00,
parameter	DOT_D4		=	8'h00,
parameter	DOT_D3		=	8'h00,
parameter	DOT_D2		=	8'h00,
parameter	DOT_D1		=	8'h00,
            
parameter	DOT_SOR		=	8'h00,
parameter	DATAW 		= 	66
)
(
input						clk,
input						reset,

input            			PCC_op_fail_i,
input            			PCC_op_pack_i,
input         				PCC_op_suspend_i,
input          				PCC_op_cancel_i,


output	 reg	[DATAW-1:0] PCC_op_data_o,
output   reg		      	PCC_op_stb_o,
output   reg		       	PCC_op_fwd_o


  
);

//��������©Ͱģ��
reg		[5:0]				counter_up;
reg		[5:0]				token_counter_up;
reg		[5:0]				token_counter_down;
reg								packing_en;

wire		[31:0]				memory_data;
reg		[15:0]				small_packet_num;
//

wire			[DATAW-1:0]	sigle_package_time_o;
parameter	DATA_IDLE	=3'd0;
parameter	DATA_ROUT	=3'd1;
parameter	DATA_SET	=3'd2;
parameter	DATA_PLAYL	=3'd3;
parameter	DATA_END	=3'd4;
parameter	DATA_WAIT	=3'd5;
parameter	DATA_FINISH	=3'd6;

//��������
//parameter	PACKAGE_LENGTH	=	1024;//2048��
reg	[15:0]	package_length;
reg		package_length_sig;

wire	[DATAW-1:0]	HEAD_PACKAGE_RAND;
assign	HEAD_PACKAGE_RAND	=	{2'b10,DOT_D7,DOT_D6,DOT_D5,DOT_D4,DOT_D3,DOT_D2,DOT_D1,DOT_SOR};

//����������
//parameter	PACKAGE_NUM	=	3;//100��
reg	[15:0]	package_cnt;

//�����
//parameter	PACKAGE_SEND_INTERVAL	=	4;//10��
reg	[23:0]	package_send_interval;
reg			package_send_interval_sig;
reg			next_start;

reg[2:0]       data_cs;                   
reg[2:0]       data_ns; 


reg	PCC_op_stb_o_delay1;
reg	PCC_op_stb_o_delay2;
always@(posedge clk)
		if(reset)
			PCC_op_stb_o_delay1<=0;
		else 
			PCC_op_stb_o_delay1<=1;
always@(posedge clk)
		if(reset)
			PCC_op_stb_o_delay2<=0;
		else 
			PCC_op_stb_o_delay2<=PCC_op_stb_o_delay1;			
			
wire	PCC_op_stb_o_delay;
assign	PCC_op_stb_o_delay=PCC_op_stb_o_delay1&&(~PCC_op_stb_o_delay2);			
			
			
reg		PCC_op_fail_i_delay;	
always@(posedge clk)
		if(reset)
			PCC_op_fail_i_delay<=0;
		else 
			PCC_op_fail_i_delay<=PCC_op_fail_i;

reg [7:0]	potnum;

always@(posedge clk)	begin
	if(reset)
		potnum<=8'd0;
	else if(potnum==POTNUM)
		potnum<=8'd0;
	else if(PCC_op_fail_i)
		potnum<=8'd0;
	else if(PCC_op_pack_i)
		potnum<=potnum+1;
	else
		potnum<=potnum;
end

reg	PCC_op_pack_ii;

always@(posedge clk)	begin
	if(reset)
		PCC_op_pack_ii<=0;
	else if(potnum==POTNUM)
		PCC_op_pack_ii<=1;
	else
		PCC_op_pack_ii<=0;
end
			
			
//����������
wire	package_send_start;
assign	package_send_start	=	PCC_op_stb_o_delay||PCC_op_fail_i_delay||next_start;
always@(posedge clk)
	begin
		if(reset)
			PCC_op_stb_o<=0;
		else if(package_send_start)
			PCC_op_stb_o<=1;
		else if(PCC_op_cancel_i||PCC_op_fail_i)
			PCC_op_stb_o<=0;
		else
			PCC_op_stb_o<=PCC_op_stb_o;
	end


always@(posedge clk)
		if(reset)
			PCC_op_fwd_o<=0;
		else if(package_send_start)
		
		
		
		
		
			PCC_op_fwd_o<=1;
		else if(PCC_op_pack_ii)
			PCC_op_fwd_o<=1;
		else if(data_cs==DATA_ROUT)
			PCC_op_fwd_o<=0;
		else if(data_cs==DATA_END)
			PCC_op_fwd_o<=0;
		else
			PCC_op_fwd_o<=PCC_op_fwd_o;
	
	

always@(posedge clk)
	if(reset)
		data_cs<=DATA_IDLE;
	else
		data_cs<=data_ns;
		
always@(*)
	begin
	data_ns=data_cs;
	
	case(data_cs)
		DATA_IDLE:	if(package_send_start)
						begin
						data_ns=DATA_ROUT;
						package_length_sig=0;
						package_send_interval_sig=0;
						end 
					else
						begin
						data_ns=DATA_IDLE;
						package_length_sig=0;
						package_send_interval_sig=0;
						end
		
		DATA_ROUT:	if(PCC_op_pack_ii)
						data_ns=DATA_SET;
					else if(PCC_op_fail_i)
						data_ns=DATA_IDLE;
					else
						data_ns=DATA_ROUT;
						
		DATA_SET:	if(PCC_op_fwd_o)
						begin
						data_ns=DATA_PLAYL;
						package_length_sig=1;
						end
					else
						data_ns=DATA_SET;
		
		DATA_PLAYL:	if(PCC_op_fwd_o&&package_length==PACKAGE_LENGTH)
						begin
						data_ns=DATA_END;
						package_length_sig=0;
						end
					else
					    begin
						data_ns=DATA_PLAYL;
						end
		
		DATA_END:	if(PCC_op_cancel_i)
						begin
						data_ns=DATA_WAIT;
						package_send_interval_sig=1;
						end
					else
						data_ns=DATA_END;
		
		DATA_WAIT:	if(package_send_interval==PACKAGE_SEND_INTERVAL)
						begin
						data_ns=DATA_IDLE;
						package_send_interval_sig=0;
						end
					else
						data_ns=DATA_WAIT;
		//DATA_FINISH:	data_ns=DATA_IDLE;
		default	:	data_ns=DATA_IDLE;
	endcase
	end
always@(posedge clk)
begin
    if(reset)
        package_length  <=0;
      else if(package_length==PACKAGE_LENGTH)
            package_length  <=0;
      else if((data_cs==DATA_PLAYL)&&(data_ns!=DATA_END)&&(packing_en==1'b1))
           package_length   <=  package_length+1;
      else 
            package_length  <=  package_length;

              
end
               
reg	[12:0]		address;//���Լ�����16384����

always@(posedge clk)
	if(reset)
		PCC_op_data_o<=66'd0;
	else if(package_send_start)
		PCC_op_data_o<=HEAD_PACKAGE_RAND;//10
	else if(data_cs==DATA_PLAYL&&packing_en==1'b1)begin
	           PCC_op_data_o<={2'b00,package_length,small_packet_num,memory_data};
				
				end
	else if(data_cs==DATA_END)
				PCC_op_data_o<=66'h1_80_00_00_00_00_00_00_00;
	else
		PCC_op_data_o<=PCC_op_data_o;
		

always@(posedge clk)
	if(reset)
		address<=0;
	else case(data_cs)
		DATA_PLAYL:
			if(packing_en)
				address<=address+1;
		default:address=0;
		endcase

//��������
/**
always@(posedge clk)
	if(reset)
		package_length<=0;
	else if(package_length_sig)
		package_length<=package_length+1;
	else if(data_cs==DATA_END&&data_ns==DATA_WAIT)
		package_length<=0;
	else
		package_length<=package_length;
**/
//������
always@(posedge clk)
	if(reset)
		package_send_interval<=0;
	else if(package_send_interval_sig)
		package_send_interval<=package_send_interval+1;
	else if(data_cs==DATA_WAIT&&data_ns==DATA_IDLE)
		package_send_interval<=0;
	else
		package_send_interval<=package_send_interval;


always@(posedge clk)
	if(reset)
		next_start<=0;
	else if(package_cnt==PACKAGE_NUM)
		next_start<=0;
	else if(package_cnt!=PACKAGE_NUM&&data_cs==DATA_WAIT&&data_ns==DATA_IDLE)
		next_start<=1;
	else if(data_cs==DATA_IDLE)
		next_start<=0;
	else
		next_start<=next_start;
		
//�����ͽ���ʱ  ��־
reg			keep_sig;
always@(posedge clk)
	if(reset)
		keep_sig<=0;
	//else if(PCC_op_stb_o_delay||PCC_op_cancel_i_delay)
	else if(PCC_op_stb_o_delay||next_start)
		keep_sig<=1;
	else if(PCC_op_cancel_i)
		keep_sig<=0;
	else
		keep_sig<=keep_sig;
		
//�������������ͼƔ�
reg	[63:0]	sigle_package_time;		
always@(posedge clk)
	if(reset)
		sigle_package_time<=0;//�������ӳ�һ�����ڣ�����ӡǡ�õ����������WҪ�費
	//else if(keep_sig||next_start)
	else if(keep_sig)
		sigle_package_time<=sigle_package_time+1;
	else
		sigle_package_time<=sigle_package_time;

assign	sigle_package_time_o=sigle_package_time;


//�������Ɣ�
always@(posedge clk)
	if(reset)
		package_cnt<=0;
	else if(package_cnt==PACKAGE_NUM)
		package_cnt<=package_cnt;
	else if(PCC_op_cancel_i)
		package_cnt<=package_cnt+1;
	else
		package_cnt<=package_cnt;

//���Ҫ����һ��small_packet_num���ɖw??�����������һ��С�X��������

reg	[2:0]		cnt;
always@(posedge clk)
	if(reset)
		cnt	<=0;
	else if(data_cs==DATA_PLAYL)	begin
				if(packing_en)
					if(cnt==4)
						cnt<=0;
					else
						cnt<=cnt+1;
				else
					cnt<=cnt;
		end
		
always@(posedge clk)begin
	if(reset)
		small_packet_num<=0;
	else if(cnt==4)
		small_packet_num<=small_packet_num+1;
end

//------------------------------------------------------------------------------------------------
//--	Packing Enable	����token_counter_up�൱�ڼӷ���������ރtoken_counter_down�൱�ڼ���������
//------------------------------------------------------------------------------------------------
	always @ (posedge clk ) begin
		if (reset)
			counter_up <= 0;
		else begin
			if(counter_up == T-1)
				counter_up <= 0; 
			else
				counter_up <= counter_up+1; 

		end
	end
	
	always @ (posedge clk ) begin
		if (reset)
			token_counter_up <= 0;
		else begin
			if(counter_up == T-1 && token_counter_up < B-1)
				token_counter_up <= token_counter_up+1;
			if(counter_up == T-1 && token_counter_up == B-1)   
				token_counter_up <= 0;
		end
	end
	
	always @ (posedge clk ) begin
		if (reset)
			token_counter_down <= 0;
		else begin
			if(token_counter_up == B-1)//����د����token_counter_up��ʱ����ô��د����token_counter_down���÷�
				token_counter_down <= B-1;
			if(token_counter_down > 0 && token_counter_down < B)
				token_counter_down <= token_counter_down-1;
		end
	end

//���ﵱ���ƻ��۵�49�Ժ󣬿�ʼ����΢Ƭ����ÿ��?د��΢Ƭ����������د��ֱ����ۻ
	always @ (posedge clk ) begin
		if (reset)
			packing_en <= 1'b0;
		else if(token_counter_down > 0 && token_counter_down < B)
			packing_en <= 1'b1;
		else
			packing_en <= 1'b0;
	end
	
rom uut(
  .clka(clk), // input clka
  .addra(address), // input [12 : 0] addra
  .douta(memory_data) // output [31 : 0] douta
);	

	
	

endmodule
