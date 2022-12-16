`timescale 1ns / 10ps

module Priority_3op
#(parameter	PORTS=3)
(
//Inputs
input	[PORTS-1:0]	priority_request_i, //四个方向优先级请求信号的汇总

//Outputs
output	[PORTS-1:0]	priority_request_o// 有效比特位标志具有最高优先级的请求
 
);

wire	[PORTS-1:0]	priority_select;


//PRIORIT
assign	priority_select	=	priority_request_i[0]?	3'b001:				//本地LOCAL
							priority_request_i[1]?	3'b010:				//FSM1
							priority_request_i[2]?	3'b100:5'b0000;		//FSM2
							
							
//OUTPUT
assign	priority_request_o=priority_select;

endmodule
