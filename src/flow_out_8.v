module	flow_output_8
#(
parameter  num = 16'd127
)(	
	input	wire			sys_clk,
	input					sys_rst_n,
	input	wire	[65:0]	data_din_1,
	input	wire	[65:0]	data_din_2,
	input	wire	[65:0]	data_din_3,
	input	wire	[65:0]	data_din_4,
	input	wire	[65:0]	data_din_5,
	input	wire	[65:0]	data_din_6,
	input	wire	[65:0]	data_din_7,
	input	wire	[65:0]	data_din_8,	
	input	wire	[15:0]	clk_counter,
	input 					en_1,
	input 					en_2,
	input 					en_3,
	input 					en_4,
	input 					en_5,
	input 					en_6,
	input 					en_7,
	input 					en_8,
	input	wire			packing_1,
	input	wire			packing_2,
	input	wire			packing_3,
	input	wire			packing_4,
	input	wire			packing_5,
	input	wire			packing_6,
	input	wire			packing_7,
	input	wire			packing_8,
	output	uart_txd
);
parameter  CLK_FREQ = 50000000;         
parameter  UART_BPS = 115200; 
parameter  BUSW = 32; 

reg	en_reg=1'd0;
reg [31:0] data=32'd0;
reg [31:0] data_1=32'd0;
reg [31:0] data_2=32'd0;
reg [31:0] data_3=32'd0;
reg [31:0] data_4=32'd0;
reg [31:0] data_5=32'd0;
reg [31:0] data_6=32'd0;
reg [31:0] data_7=32'd0;
reg [31:0] data_8=32'd0;
wire en;
wire [15:0] counter;
wire uart_en;
wire send_flag;

assign	 uart_en=en_reg;
assign   counter=clk_counter;
assign	 en=en_1|en_2|en_3|en_4|en_5|en_6|en_7|en_8;

always@(*)begin	
	if(!sys_rst_n) 
		data_1<=32'd0;
	else if(data_din_1[63:48]==num)	
		data_1[15:0]<=counter;
	else if(packing_1)
		data_1[31:16]<=counter;	
	else 
		data_1<=data_1;
end
always@(*)begin	
	if(!sys_rst_n) 
		data_2<=32'd0;
	else if(data_din_2[63:48]==num)
		data_2[15:0]<=counter;		
	else if(packing_2)
		data_2[31:16]<=counter;	
	else 
		data_2<=data_2;			
end
always@(*)begin	
	if(!sys_rst_n) 
		data_3<=32'd0;
	else if(data_din_3[63:48]==num)	
		data_3[15:0]<=counter;
	else if(packing_3)
		data_3[31:16]<=counter;	
	else 
		data_3<=data_3;
end
always@(*)begin	
	if(!sys_rst_n) 
		data_4<=32'd0;
	else if(data_din_4[63:48]==num)
		data_4[15:0]<=counter;		
	else if(packing_4)
		data_4[31:16]<=counter;	
	else 
		data_4<=data_4;		
end
always@(*)begin	
	if(!sys_rst_n) 
		data_5<=32'd0;
	else if(data_din_5[63:48]==num)
		data_5[15:0]<=counter;		
	else if(packing_5)
		data_5[31:16]<=counter;	
	else 
		data_5<=data_5;			
end
always@(*)begin	
	if(!sys_rst_n) 
		data_6<=32'd0;
	else if(data_din_6[63:48]==num)	
		data_6[15:0]<=counter;
	else if(packing_6)
		data_6[31:16]<=counter;	
	else 
		data_6<=data_6;
end
always@(*)begin	
	if(!sys_rst_n) 
		data_7<=32'd0;
	else if(data_din_7[63:48]==num)	
		data_7[15:0]<=counter;
	else if(packing_7)
		data_7[31:16]<=counter;	
	else 
		data_7<=data_7;
end
always@(*)begin	
	if(!sys_rst_n) 
		data_8<=32'd0;
	else if(data_din_8[63:48]==num)	
		data_8[15:0]<=counter;
	else if(packing_8)
		data_8[31:16]<=counter;	
	else 
		data_8<=data_8;
end
reg en_reg0=1'd0;
always@(posedge sys_clk)begin
	if(neg_edge==1'd1)begin
		data<=data_1;
		en_reg<=1'b1;	
	end
	else begin
	case(flag_count)
		3'd0:begin
				data<=data;
				en_reg<=en_reg;
			 end
		3'd1:begin
				data<=data_2;
				en_reg<=1'b0;
			 end			
		3'd2:begin
				data<=data_3;
				en_reg<=1'b1;
			 end
		3'd3:begin
				data<=data_4;
				en_reg<=1'b0;
			 end
		3'd4:begin
				data<=data_5;
				en_reg<=1'b1;
			 end
		3'd5:begin
				data<=data_6;
				en_reg<=1'b0;
			 end
		3'd6:begin
				data<=data_7;
				en_reg<=1'b1;
			 end
		3'd7:begin
				data<=data_8;
				en_reg<=1'b0;
			 end
		default:begin
				data<=32'd0;
				en_reg<=1'b0;
			 end
	endcase
	end
end	
//发送计数器
reg [3:0]flag_count=3'b0;
always@(posedge sys_clk)begin	
	if(!sys_rst_n)
		flag_count<=3'b0;
	else if(send_flag==1'b1)
		flag_count<=flag_count+3'b1;
	else 
		flag_count<=flag_count;
end
//下降沿检测
reg sig_r0,sig_r1;//状态寄存器
always @(posedge sys_clk)
  begin
      if(!sys_rst_n)
	    begin
		   sig_r0 <= 1'b0;
		   sig_r1 <= 1'b0;
		end
	  else
	    begin
		   sig_r0 <= en;
		   sig_r1 <= sig_r0;
		end
  end
wire neg_edge;
assign neg_edge = sig_r1 & ~sig_r0;


uart_data#(BUSW,CLK_FREQ,UART_BPS) 
u_uart(
	.sys_clk	(sys_clk),                  //系统时钟
    .sys_rst_n	(sys_rst_n),                //系统复位，低电平有效
    
    .uart_en	(uart_en),                  //发送使能信号
    .uart_din	(data),                 //待发送数据		
	.send_flag	(send_flag),
    .uart_txd	(uart_txd)	
);
endmodule
				
				

	