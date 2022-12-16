`timescale 1ns / 10ps

module Priority
#(parameter	PORTS=4)
(
//Inputs
input	[PORTS-1:0]	priority_request_i, //四个方向优先级请求信号的汇总

//Outputs
output	[PORTS-1:0]	priority_request_o// 有效比特位标志具有最高优先级的请求
 
);

wire	[PORTS-1:0]	priority_select;


//PRIORITY
assign	priority_select	=	priority_request_i[0]?	4'b0001:				//本地LOCAL
							priority_request_i[3]?	4'b1000:				//桥BRIDGE
							priority_request_i[1]?	4'b0010:				//逆时针ATCLKW
							priority_request_i[2]?	4'b0100:4'b0000;		//顺时针CLKW
							
//OUTPUT
assign	priority_request_o=priority_select;

endmodule
