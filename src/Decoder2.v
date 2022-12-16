`timescale 1ns / 10ps
module Decoder
#(
parameter	LOCAL_Y		=	4'b0010,
parameter	LOCAL_X		=	4'b0010,
parameter	PORTS		=	4,

parameter	ADDRYX		=	8,
parameter	ADDRX		=	4,
parameter	ADDRY		=	4,

parameter	IPCOREPOS	=	0,
parameter	BRIDGEPOS	=	3,
parameter	CLKWPOS		=	2,
parameter	ATCLKWPOS	=	1

)
(
//Inputs
input						clk,
input						reset,
input	[PORTS-1:0]			decoder_select_i,   //输入通道选择信号 有效标志位标志需要处理的输入通道请求
input	[PORTS*ADDRYX-1:0]	decoder_address_i,	//	目标节点地址信号 五个方向输入通道目标节点地址的拼掿 范围涵盖五个方向的地坿

//Outputs
output	[PORTS-1:0]			decoder_src_o, //输入通道方向编号 有效比特位标识可以优先参与仲裁的输入通道编号
output	[PORTS-1:0]			decoder_dest_o // 输出通道方向 有效比特位标识参与仲裁的输入通道相对应的输出通道

);

reg		[PORTS-1:0]		src_r;
reg		[PORTS-1:0]		dest_r;
wire	[ADDRX-1:0]		addr_x_num;
wire	[ADDRY-1:0]		addr_y_num;
wire	[PORTS-1:0]		dest_num;
wire	[ADDRYX-1:0]    address_num;


//SELECT ADDRESS
assign	address_num	=	decoder_select_i[0]?	decoder_address_i[ADDRYX-1:0]: 
						decoder_select_i[1]?	decoder_address_i[2*ADDRYX-1:ADDRYX]:
						decoder_select_i[2]?	decoder_address_i[3*ADDRYX-1:2*ADDRYX]:
						decoder_select_i[3]?	decoder_address_i[4*ADDRYX-1:3*ADDRYX]:{ADDRYX{1'b0}};
												
//GET THE DEST ADDRESS
assign	addr_y_num	=	address_num[ADDRX+ADDRY-1:ADDRX];				
assign	addr_x_num	=	address_num[ADDRX-1:0];	

//algorithm
reg  CLKW= 1'b0;
reg  ATCLKW= 1'b0;
reg  BRIDGE= 1'b0;
reg [3:0] addr_y_bridge;
wire [3:0] abs;
reg [3:0] abs2;

assign abs=addr_y_num - LOCAL_Y ; 
always@(posedge clk )begin
	if(addr_x_num==LOCAL_X && (decoder_select_i[0]==1'b1||decoder_select_i[3]==1'b1))begin	
		if((addr_x_num == 4'd1 && abs <= 8 && abs!=0) || (addr_x_num == 4'd2 && abs <= 4 && abs!=0))begin
				CLKW <= 1'b1;
				ATCLKW <= 1'b0;
				BRIDGE <= 1'b0;
				end
		else begin
				ATCLKW <= 1'b1;
				CLKW <= 1'b0;
				BRIDGE <= 1'b0;
				end
	end
	else if(addr_x_num==LOCAL_X && decoder_select_i[1]==1'b1)begin
			CLKW <= 1'b1;
			ATCLKW <= 1'b0;
			BRIDGE <= 1'b0;
			end
	else if(addr_x_num==LOCAL_X && decoder_select_i[2]==1'b1)begin
			CLKW   <= 1'b0;
			ATCLKW <= 1'b1;
			BRIDGE <= 1'b0;
			end	
	else if(addr_x_num!=LOCAL_X && addr_x_num != 4'd0)begin
		if(LOCAL_X == 4'd2)begin
			case(addr_y_num)
			4'd0: addr_y_bridge <= 4'd1;
			4'd1: addr_y_bridge <= 4'd1;
			4'd2: addr_y_bridge <= 4'd1;
			4'd3: addr_y_bridge <= 4'd1;
			4'd4: addr_y_bridge <= 4'd3;
			4'd5: addr_y_bridge <= 4'd3;
			4'd6: addr_y_bridge <= 4'd3;
			4'd7: addr_y_bridge <= 4'd3;
			4'd8: addr_y_bridge <= 4'd5;
			4'd9: addr_y_bridge <= 4'd5;
			4'd10: addr_y_bridge <= 4'd5;
			4'd11: addr_y_bridge <= 4'd5;
			4'd12: addr_y_bridge <= 4'd7;
			4'd13: addr_y_bridge <= 4'd7;
			4'd14: addr_y_bridge <= 4'd7;
			4'd15: addr_y_bridge <= 4'd7;
			default:;
			endcase
			abs2=addr_y_bridge - LOCAL_Y ;
			if(addr_y_bridge == LOCAL_Y)begin
				BRIDGE <= 1'b1;
				ATCLKW <= 1'b0;
				CLKW <= 1'b0;
			end
			else if(abs2 <= 4 && abs2!=0)begin
				CLKW   <= 1'b1;
				BRIDGE <= 1'b0;
				ATCLKW <= 1'b0;
			end
			else
				begin
				ATCLKW <=1'b1;
				CLKW   <= 1'b0;
				BRIDGE <= 1'b0;
			end
		end
		else if(LOCAL_X == 4'd1)begin
			case(LOCAL_Y)
			4'd0: addr_y_bridge <= 4'd2;
			4'd1: addr_y_bridge <= 4'd2;
			4'd2: addr_y_bridge <= 4'd2;
			4'd3: addr_y_bridge <= 4'd2;
			4'd4: addr_y_bridge <= 4'd6;
			4'd5: addr_y_bridge <= 4'd6;
			4'd6: addr_y_bridge <= 4'd6;
			4'd7: addr_y_bridge <= 4'd6;
			4'd8: addr_y_bridge <= 4'd10;
			4'd9: addr_y_bridge <= 4'd10;
			4'd10: addr_y_bridge <= 4'd10;
			4'd11: addr_y_bridge <= 4'd10;
			4'd12: addr_y_bridge <= 4'd14;
			4'd13: addr_y_bridge <= 4'd14;
			4'd14: addr_y_bridge <= 4'd14;
			4'd15: addr_y_bridge <= 4'd14;
			default:;
			endcase		
			if(addr_y_bridge == LOCAL_Y)begin
				BRIDGE <= 1'b1;
				ATCLKW <= 1'b0;
				CLKW <= 1'b0;
			end
			else if(addr_y_bridge > LOCAL_Y)begin
				CLKW   <= 1'b1;
				BRIDGE <= 1'b0;
				ATCLKW <= 1'b0;
			end
			else if(addr_y_bridge < LOCAL_Y)begin
				ATCLKW <=1'b1;
				CLKW   <= 1'b0;
				BRIDGE <= 1'b0;
			end
		end
	end
end

//ROUTING                            |归约或
assign	dest_num[IPCOREPOS]		=	(|decoder_select_i && addr_x_num==LOCAL_X  &&  addr_y_num==LOCAL_Y)?	1'b1:1'b0;
assign	dest_num[BRIDGEPOS]		=	(|decoder_select_i && BRIDGE == 1'b1)?	1'b1:1'b0;
assign	dest_num[CLKWPOS]		=	(|decoder_select_i && CLKW	 == 1'b1)?	1'b1:1'b0;
assign	dest_num[ATCLKWPOS]		=	(|decoder_select_i && ATCLKW == 1'b1)?	1'b1:1'b0;

//REGISTER	DEST
always@(posedge clk)
	if(reset)
		dest_r<={PORTS{1'b0}};
	else
		dest_r<=dest_num;

//REGISTER	SRC

//delay src
always@(posedge clk)
	if(reset)
		src_r_delay<={PORTS{1'b0}};
	else
		src_r_delay<=decoder_select_i;

reg		[PORTS-1:0]		src_r_delay;
always@(posedge clk)
	if(reset)
		src_r<={PORTS{1'b0}};
	else
		src_r<=src_r_delay;	          	
//OUTPUT
assign	decoder_src_o	=	src_r;
assign	decoder_dest_o	=	dest_r;
	          


endmodule