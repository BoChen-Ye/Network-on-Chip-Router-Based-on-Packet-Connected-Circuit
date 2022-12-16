`timescale 1ns / 10ps
 
module Arbiter_3op
#(parameter	CONNECTIONW=9,PORTS=3)
(
//Inputs
input						clk,
input						reset,
input	[PORTS-1:0]			arbiter_stb_i,//前向传输控制
input	[PORTS-1:0]			arbiter_src_i,//输入通道的方向编号 有效比特位标识参与仲裁的输入通道号
input	[PORTS-1:0]			arbiter_dest_i,//有效比特位标识参与仲裁的输入通道申请占用的输出通道标号
input	[PORTS-1:0]			arbiter_fail_i,//来自于五个方向输出状态机失败标志的拼接
input	[PORTS-1:0]			arbiter_cancel_i,//取消链路标志 来自于五个方向输出状态机取消链路标志的拼接
//Outputs
output	[PORTS-1:0]			arbiter_grant_o, //准许信号 有效比特维护标识仲裁器准许相应的输入通道请求
output	[PORTS-1:0]			arbiter_deny_o, // 有效比特无标识仲裁器拒绝相应的输入通道请求
output	[CONNECTIONW-1:0]	arbiter_connections_o,  //输入通道与输出通道相连接的关系 给出输出通道和输出通道之间的对应关系 指示交叉开关的数据传输
output	[PORTS-1:0]			arbiter_occupied_o // 有效比特位标识占用相应的输入通道请求

);

reg		[PORTS-1:0]			src_r;
reg		[CONNECTIONW-1:0]	connections_r;

wire	[PORTS-1:0]			grant_int;
wire	[PORTS-1:0]			deny_src_int;
wire	[PORTS-1:0]			deny_int;
wire	[PORTS-1:0]			occupied_int;
wire						src_change_int;


//GET SRC_R
always@(posedge clk)
	if(reset)
		src_r<={PORTS{1'b0}};
	else
		src_r<=arbiter_src_i;

		
//GENETATE CONNECTIONS_R

always@(posedge clk)
	if(reset)
		connections_r<={CONNECTIONW{1'b0}};
	else
		begin
			//取消或失败，会对相应连接置为零
			if((|arbiter_cancel_i)||(|arbiter_fail_i))
				begin
					if(arbiter_cancel_i[0]||arbiter_fail_i[0])//0端口取消链路或者0端口建立链路失败 输入与输出对应连接关系的0-4位为0
						connections_r[2:0]<=3'b0;
					if(arbiter_cancel_i[1]||arbiter_fail_i[1])
						connections_r[5:3]<=3'b0;
					if(arbiter_cancel_i[2]||arbiter_fail_i[2])
						connections_r[8:6]<=3'b0;					
				end 
			
			//src_change_int
			if(src_change_int)
				begin
					if(arbiter_src_i[0])//0输入通道参与仲裁
						begin
							if(arbiter_dest_i[0]&&!occupied_int[0])//0输入通道参与仲裁申请占用0号输出并且0号输出端口未被占用那么connection 0位 为1
								connections_r[0]<=1'b1;
							else if(arbiter_dest_i[1]&&!occupied_int[1])//0输入通道参与仲裁申请占用1号输出并且1号输出端口未被占用那么connection 1位 为1
								connections_r[3]<=1'b1;
							else if(arbiter_dest_i[2]&&!occupied_int[2])
								connections_r[6]<=1'b1;						
						end
						
					if(arbiter_src_i[1])
						begin
							if(arbiter_dest_i[0]&&!occupied_int[0])
								connections_r[1]<=1'b1;
							else if(arbiter_dest_i[1]&&!occupied_int[1])
								connections_r[4]<=1'b1;
							else if(arbiter_dest_i[2]&&!occupied_int[2])
								connections_r[7]<=1'b1;							
						end
					
					if(arbiter_src_i[2])
						begin
							if(arbiter_dest_i[0]&&!occupied_int[0])
								connections_r[2]<=1'b1;
							else if(arbiter_dest_i[1]&&!occupied_int[1])
								connections_r[5]<=1'b1;
							else if(arbiter_dest_i[2]&&!occupied_int[2])
								connections_r[8]<=1'b1;
						end															
				end
			
			//arbiter_stb_i
			if(!arbiter_stb_i[0])
				begin
					connections_r[0]<=1'b0;
					connections_r[3]<=1'b0;
					connections_r[6]<=1'b0;			
				end
			
			if(!arbiter_stb_i[1])
				begin
					connections_r[1]<=1'b0;
					connections_r[4]<=1'b0;
					connections_r[7]<=1'b0;
				end
				
			if(!arbiter_stb_i[2])
				begin
					connections_r[2]<=1'b0;
					connections_r[5]<=1'b0;
					connections_r[8]<=1'b0;
				end						
		end

//GENETATE	src_change_int
assign	src_change_int	=	(src_r != arbiter_src_i)?	1'b1:1'b0;

//GENETATE	occupied_int

assign	occupied_int	=	{	|{connections_r[8:6]},
								|{connections_r[5:3]},
								|{connections_r[2:0]}//申请0号输出端口中有一位为1那么occupied_int的0位就为1 说明该端口被占用，只有全为0时该端口未被占用
							};

//GENETATE	grant_int（5位）
assign	grant_int	=	(src_change_int && |((~occupied_int) & arbiter_dest_i))?	arbiter_src_i:{PORTS{1'b0}};
                                           //   未被占用       申请占用的通道        参与仲裁的输入
//GENETATE	deny_src_int
assign	deny_src_int	=	(src_change_int && !(|((~occupied_int) & arbiter_dest_i)))?	arbiter_src_i:{PORTS{1'b0}};

//GENETATE deny_int
assign	deny_int	=	deny_src_int	|(arbiter_fail_i[0]?	connections_r[2:0]		:3'd0)
										|(arbiter_fail_i[1]?	connections_r[5:3]		:3'd0)
										|(arbiter_fail_i[2]?	connections_r[8:6]		:3'd0);
										
//GENETATE	Outputs
assign	arbiter_grant_o			=	grant_int;
assign	arbiter_deny_o			=	deny_int;
assign	arbiter_connections_o	=	connections_r;
assign	arbiter_occupied_o		=	occupied_int;

endmodule


