module	flow_output_2(	
	input	wire			sys_clk,
	input					sys_rst_n,
	input	wire	[65:0]	data_din_1,
	input	wire	[65:0]	data_din_2,
	input	wire	[15:0]	clk_counter,
	input 					en_1,
	input 					en_2,
	input	wire			packing_1,
	input	wire			packing_2,
	output	uart_txd
);
parameter  CLK_FREQ = 50000000;         
parameter  UART_BPS = 115200; 
parameter  BUSW = 32; 

reg	en_reg=1'd0;
reg [31:0] data=32'd0;
reg [31:0] data_2=32'd0;
reg [31:0] data_1=32'd0;


wire en;
wire [15:0] counter;
wire uart_en;
wire send_flag;

assign	 uart_en=en_reg;
assign   counter=clk_counter;
assign	 en=en_1|en_2;

always@(*)begin	
	if(!sys_rst_n) 
		data_1<=32'd0;
	else if(data_din_1[63:48]==16'd127)	
		data_1[15:0]<=counter;
	else if(packing_1)
		data_1[31:16]<=counter;	
	else 
		data_1<=data_1;
end
always@(*)begin	
	if(!sys_rst_n) 
		data_2<=32'd0;
	else if(data_din_2[63:48]==16'd127)
		data_2[15:0]<=counter;		
	else if(packing_2)
		data_2[31:16]<=counter;	
	else 
		data_2<=data_2;			
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
//		3'd2:
//		3'd3:
//		3'd4:
//		3'd5:
//		3'd6:
//		3'd7:
		default:begin
				data<=32'd0;
				en_reg<=1'b0;
			 end
	endcase
	end
end	
reg [3:0]flag_count=3'b0;
always@(posedge sys_clk)begin	
	if(!sys_rst_n)
		flag_count<=3'b0;
	else if(send_flag==1'b1)
		flag_count<=flag_count+3'b1;
	else 
		flag_count<=flag_count;
end
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
/*
uart_send#(BUSW,CLK_FREQ,UART_BPS,8,1) 
u_uart(
	.sys_clk	(sys_clk),                  //系统时钟
    .sys_rst_n	(sys_rst_n),                //系统复位，低电平有效
    
    .uart_en	(uart_en),                  //发送使能信号
    .uart_din	(data),                 //待发送数据		
	.emptyp		(send_flag),
    .uart_txd	(uart_txd)	
);
*/
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
				
				

	