`timescale 1ns / 10ps

module OutputFSM
#(
parameter	LOCAL_Y		=	4'b0010,
parameter	LOCAL_X		=	4'b0100,
parameter	DATAW		=	66,
parameter	OFSMNUM		=	0,
parameter	ADDRYX		=	8,
parameter	BWCTRLW		=	3
)

(
/* input */
input		clk,
input		reset,

input					output_fwd_i,//crossbar传入的传输控制信号
input					output_occupied_i,//由arbiter模块传入的状态控制新哈品牌，表示此输出端口是否被占用
input					output_cancel_i,//
input					output_suspend_i,
input					output_pack_i,
input					output_fail_i,//传给arbiter模块的失败信号
input	[DATAW-1:0]		output_data_i,//由交叉开关模块传入的数据信号

/* output */
output	[BWCTRLW-1:0]	output_bwctrl_o,
output					output_fail_o,
output					output_cancel_o,
output					output_fwd_o,       //传输控制信号
output					output_stb_o,       //链路建立信号
output	[DATAW-1:0]		output_data_o

);


parameter	F_IDLE		=	2'b01;
parameter	F_LOCK		=	2'b10;


reg	[1:0]	output_cs;
reg	[1:0]	output_ns;

always@(posedge clk)	begin
	if(reset)
		output_cs<=F_IDLE;
	else
		output_cs<=output_ns;
end

always@(output_cs,output_occupied_i) begin
	case(output_cs)
	F_IDLE	:	begin
					if(output_occupied_i)
						output_ns=F_LOCK;
					else
						output_ns=F_IDLE;
				end
	F_LOCK	:	begin
					if(!output_occupied_i)
						output_ns=F_IDLE;
					else
						output_ns=F_LOCK;
				end
	default	:	output_ns=F_IDLE;
	endcase
end

reg				stb_r;
reg				fwd_r;
reg	[DATAW-1:0]	data_r;

reg				fail_r;
reg				cancel_r;
reg				suspend_r;
reg				pack_r;

always@(posedge clk)	begin
	if(reset)
		stb_r<=1'b0;
	else if(output_ns==F_LOCK)
		stb_r<=1'b1;
	else
		stb_r<=1'b0;
end

always@(posedge clk)	begin
	if(reset)
		fwd_r<=1'b0;
	else
		fwd_r<=output_fwd_i;
end

always@(posedge clk)	begin
	if(reset)
		data_r<={DATAW{1'b0}};

	// else if(OFSMNUM!=1'd0 && output_data_i[DATAW-1:DATAW-2]==2'd10 && output_data_i[ADDRYX+3:ADDRYX]==LOCAL_Y && (|output_data_i[3*ADDRYX-1:ADDRYX*2]))
		// data_r<={output_data_i[DATAW-1:DATAW-8],8'h00,output_data_i[DATAW-9:ADDRYX+4],output_data_i[ADDRYX-1:0]};

	else
		data_r<=output_data_i;
end

always@(posedge clk)	begin
	if(reset)
		fail_r<=1'b0;
	else
		fail_r<=output_fail_i;
end

always@(posedge clk)	begin
	if(reset)
		cancel_r<=1'b0;
	else if(output_data_i[DATAW-1:DATAW-2]==2'b01)
		cancel_r<=output_cancel_i;
	else
		cancel_r<=1'b0;
end

always@(posedge clk)	begin
	if(reset)
		suspend_r<=1'b0;
	else
		suspend_r<=output_suspend_i;
end

always@(posedge clk)	begin
	if(reset)
		pack_r<=1'b0;
	else
		pack_r<=output_pack_i;
end

assign	output_data_o		=	data_r;
assign	output_fwd_o		=	fwd_r;
assign	output_stb_o		=	stb_r;
assign	output_bwctrl_o		=	{cancel_r,suspend_r,pack_r};
assign	output_cancel_o		=	cancel_r;
assign	output_fail_o		=	fail_r;


endmodule