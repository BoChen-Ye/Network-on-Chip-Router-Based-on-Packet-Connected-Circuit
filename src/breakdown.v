`timescale 1ns / 10ps

module breakdown
#(
parameter	breakdown_num		=	16'd50
)
(
	input clk,
	input rst_n,
	input wire [65:0] data,
	output wire rst
);

reg rst_r;
reg [15:0]count=16'd0;
wire	[15:0]		packet_num	;
assign	packet_num	=	data[63:48];

always@(packet_num)
	if(packet_num)
		count<=count+1;
	else
		count<=count;



always@(posedge clk)begin
	
	if(count>=breakdown_num)
		rst_r<=1'b1;
	else
		rst_r<=rst_n;
end

assign rst=rst_r;
endmodule
/*
breakdown #(16'd50)U_bresk(
	.clk(clk),
	.rst_n(!reset_n),
	.data(PCC_ip_data_0_1_i0),
	.rst(rst)

);*/