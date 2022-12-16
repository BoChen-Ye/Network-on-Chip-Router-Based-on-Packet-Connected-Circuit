module	flow_output(	
	input	wire			sys_clk,
	input	wire			sys_rst_n,
	input	wire	[65:0]	data_din_r,
	input	wire	[15:0]	clk_counter,
	input 					en_r,
	input	wire			packen_ing,
	output	uart_txd
);
parameter  CLK_FREQ = 50000000;         
parameter  UART_BPS = 115200; 
parameter  BUSW = 32; 

reg [31:0] data=32'd0;

wire [15:0] counter;
wire uart_en;

assign	 uart_en=en_r;
assign   counter     =   clk_counter;

always@(*)begin	
	if(!sys_rst_n) 
		data<=32'd0;
	else if(data_din_r[63:48]==16'd127)	
		data[15:0]<=counter;
	else if(packen_ing)
		data[31:16]<=counter;
	else 
		data<=data;
end

uart_send#(BUSW,CLK_FREQ,UART_BPS,8,1) 
u_uart(
	.sys_clk(sys_clk),                  //系统时钟
    .sys_rst_n(sys_rst_n),                //系统复位，低电平有效
    
    .uart_en(uart_en),                  //发送使能信号
    .uart_din(data),                 //待发送数据
    .uart_txd(uart_txd)
);

endmodule
				
				

	