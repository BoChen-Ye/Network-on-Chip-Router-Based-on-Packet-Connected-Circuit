`timescale 1ns / 10ps
 
module Crossbar_3op
#(
parameter	DATAW			=	66,
parameter	PORTS			=	3,
parameter	CONNECTIONW		=	9,
parameter	FWCTRLW			=	1,
parameter	BWCTRLW			=	3
)
(
//Inputs
input	[CONNECTIONW-1:0]		crossbar_connections_i,//输入通道与输出�?�道的连接关�? 控制各个输入通道的数据走�?
input	[PORTS*FWCTRLW-1:0]		crossbar_fw_ctrl_i,//输入状�?�机传入的传输控制信�?
input	[PORTS*BWCTRLW-1:0]		crossbar_bw_ctrl_i,//传给输入状�?�机的pack suspend cancel信号
input	[PORTS*DATAW-1:0]		crossbar_data_i,//数据信息 来自于五个输入状态机
//Outputs
output	[PORTS*FWCTRLW-1:0]		crossbar_fw_ctrl_o,//传给输出状�?�机的传输控制信�?
output	[PORTS*BWCTRLW-1:0]		crossbar_bw_ctrl_o,//输出状�?�机传入�? pack suspend cancel信号
output	[PORTS*DATAW-1:0]		crossbar_data_o//数据信息�?330位） 输出到五个输出状态机

);

//FSM0 output
assign	crossbar_data_o[DATAW-1:0]			=	crossbar_connections_i[0]?crossbar_data_i[DATAW-1:0]			://如果0输入申请0输出条件成立那么输出数据0-65位输入数据的0-65�?
												crossbar_connections_i[1]?crossbar_data_i[DATAW*2-1:DATAW]	    ://如果1输入申请0输出条件成立那么输出数据0-65位输入数据的66-129�?
												crossbar_connections_i[2]?crossbar_data_i[DATAW*3-1:DATAW*2]	:	{DATAW{1'b0}};
																										
//FSM1 output											
assign	crossbar_data_o[DATAW*2-1:DATAW]	=	crossbar_connections_i[3]?crossbar_data_i[DATAW-1:0]			:
												crossbar_connections_i[4]?crossbar_data_i[DATAW*2-1:DATAW]	    :
												crossbar_connections_i[5]?crossbar_data_i[DATAW*3-1:DATAW*2]	:	{DATAW{1'b0}};
																									
//FSM2 ouput
assign	crossbar_data_o[DATAW*3-1:DATAW*2]	=	crossbar_connections_i[6]?crossbar_data_i[DATAW-1:0]			:
												crossbar_connections_i[7]?crossbar_data_i[DATAW*2-1:DATAW]		:
												crossbar_connections_i[8]?crossbar_data_i[DATAW*3-1:DATAW*2]	:	{DATAW{1'b0}};
										

//OUTPUT OF CROSSBAR_FW_CTRL_O
assign	crossbar_fw_ctrl_o[0]	=	crossbar_connections_i[0]	?	crossbar_fw_ctrl_i[0]	://0
									crossbar_connections_i[1]	?	crossbar_fw_ctrl_i[1]	:
									crossbar_connections_i[2]	?	crossbar_fw_ctrl_i[2]	:	1'b0;
																			
								
assign	crossbar_fw_ctrl_o[1]	=	crossbar_connections_i[3]	?	crossbar_fw_ctrl_i[0]	:
									crossbar_connections_i[4]	?	crossbar_fw_ctrl_i[1]	:
									crossbar_connections_i[5]	?	crossbar_fw_ctrl_i[2]	:	1'b0;
																				

assign	crossbar_fw_ctrl_o[2]	=	crossbar_connections_i[6]	?	crossbar_fw_ctrl_i[0]	:
									crossbar_connections_i[7]	?	crossbar_fw_ctrl_i[1]	:
									crossbar_connections_i[8]	?	crossbar_fw_ctrl_i[2]	:	1'b0;
																			

									
//OUTPUT OF CROSSBAR_BW_CTRL_O
assign	crossbar_bw_ctrl_o[BWCTRLW-1:0]				=	 (crossbar_connections_i[0]		?   crossbar_bw_ctrl_i[BWCTRLW-1:0]				:{BWCTRLW{1'b0}})
														|(crossbar_connections_i[3]		?   crossbar_bw_ctrl_i[BWCTRLW*2-1:BWCTRLW]		:{BWCTRLW{1'b0}})
														|(crossbar_connections_i[6]		?   crossbar_bw_ctrl_i[BWCTRLW*3-1:BWCTRLW*2]	:{BWCTRLW{1'b0}});
														
													
assign	crossbar_bw_ctrl_o[BWCTRLW*2-1:BWCTRLW]		=	 (crossbar_connections_i[1]	 	?	crossbar_bw_ctrl_i[BWCTRLW-1:0]				:{BWCTRLW{1'b0}})
														|(crossbar_connections_i[4]		?	crossbar_bw_ctrl_i[BWCTRLW*2-1:BWCTRLW]		:{BWCTRLW{1'b0}})
														|(crossbar_connections_i[7]		?	crossbar_bw_ctrl_i[BWCTRLW*3-1:BWCTRLW*2]	:{BWCTRLW{1'b0}});
														
                                                       
assign	crossbar_bw_ctrl_o[BWCTRLW*3-1:BWCTRLW*2]	=	 (crossbar_connections_i[2]		?	crossbar_bw_ctrl_i[BWCTRLW-1:0]				:{BWCTRLW{1'b0}})
														|(crossbar_connections_i[5]		?	crossbar_bw_ctrl_i[BWCTRLW*2-1:BWCTRLW]		:{BWCTRLW{1'b0}})
														|(crossbar_connections_i[8]		?	crossbar_bw_ctrl_i[BWCTRLW*3-1:BWCTRLW*2]	:{BWCTRLW{1'b0}});
														
 
					 
endmodule
