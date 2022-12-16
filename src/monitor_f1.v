module monitor_f1(
	
input	wire			clk,
input	wire			reset,
input	wire	[65:0]	data,
input	wire	[15:0]	clk_counter

);

integer				fp				;
wire	[1:0]		title			;
wire	[15:0]		packet_num		;
wire	[15:0]		small_packet_num;
wire	[31:0]		real_data		;
wire    [15:0]      counter			;

assign  counter     		=   clk_counter;
assign	title				=	data[65:64];
assign	packet_num			=	data[63:48];
assign	small_packet_num	=	data[47:32];
assign	real_data			=	data[31:0] ;

always@(*)
	begin
		fp=$fopen("f1_data_flow.txt");
		$fdisplay(fp,"%d %d",title,counter);
	end

endmodule
/*monitor_f1 u_m_f1(
	.clk(clk),
	.reset(reset_n),
	.data(PCC_ip_data_0_1_i0),
	.clk_counter(clk_counter)			
); 	*/