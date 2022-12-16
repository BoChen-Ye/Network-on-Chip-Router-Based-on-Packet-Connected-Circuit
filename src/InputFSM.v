`timescale 1ns / 10ps

module InputFSM
#(
parameter	LOCAL_Y		=	4'b0010,
parameter	LOCAL_X		=	4'b0010,
parameter	DATAW		=	66,
parameter	ADDRYX		=	8,
parameter	BWCTRLW		=	3
)
(
/* input */
input		clk,
input		reset,

input					input_stb_i,//链路建立信号
input					input_fwd_i,//传输控制信号
input					input_grant_i,//arbiter 模块传入的确认信�?
input	[BWCTRLW-1:0]	input_bwctrl_i,//crossbar 模块传回�? pack�? suspend �? cancel 信号
input					input_deny_i,//arbiter 模块传入的否认信�?
input	[DATAW-1:0]		input_data_i,//输入

/* output */
output					input_fwd_o,
output					input_stb_o,
output	[DATAW-1:0]		input_data_o,

output					input_request_o,
output					input_cancel_o,

output					input_suspend_o,
output					input_pack_o,
output					input_fail_o,
output	[ADDRYX-1:0]	input_address_o

);



parameter	PACKPOS		=	0;
parameter	SUSPENDPOS	=	1;
parameter	CANCELPOS	=	2;

parameter	F_IDLE		=	3'b000;
parameter	F_REQ1		=	3'b001;
parameter	F_REQ2		=	3'b010;
parameter	F_PRELOCK	=	3'b011;
parameter	F_LOCK		=	3'b100;
parameter	F_FALL		=	3'b101;

wire	  	 check_pot;
wire[1:0]    multicast;
wire[1:0]	 channel;
reg		     skip_pack_r;
 
reg	[ADDRYX-1:0]	address_r;



reg					fail_r;
reg					request_r;
reg					pack_r;
reg					suspend_r;
reg					cancel_r;

reg	[2:0]		input_cs;
reg	[2:0]		input_ns;

assign  multicast=(reset)?2'd0:((input_data_i[DATAW-3]==1'b0)?2'd1:(input_data_i[DATAW-3]==1'b1)?2'd2:2'd0);
//assign  channel=(reset)?2'd0:((input_data_i[DATAW-4]==1'b0)?2'd1:(input_data_i[DATAW-4]==1'b1)?2'd2:2'd0);


always@(posedge clk)	begin
	if(reset)
		input_cs<=F_IDLE;
	else
		input_cs<=input_ns;
end	

always@(input_stb_i,input_data_i,input_grant_i,input_bwctrl_i,input_deny_i,input_cs)	begin
	input_ns=input_cs;
	case(input_cs)
		F_IDLE	:	begin
						if(input_stb_i && input_data_i[DATAW-1])
							input_ns=F_REQ1;
						else
							input_ns=F_IDLE;		
					end
		F_REQ1	:	begin
						if(!input_stb_i)
							input_ns=F_IDLE;
						else if(input_deny_i)
							input_ns=F_FALL;
						else if(input_grant_i)
							input_ns=F_PRELOCK;
						else
							input_ns=F_REQ1;
					end
		F_REQ2	:	begin
						if(!input_stb_i)
							input_ns=F_IDLE;
						else if(input_deny_i)
							input_ns=F_FALL;
						else if(input_grant_i)
							input_ns=F_PRELOCK;
						else
							input_ns=F_REQ2;
					end
		F_PRELOCK:	begin
						if(!input_stb_i)
							input_ns=F_IDLE;
						else if(input_deny_i)
							input_ns=F_FALL;
						// else if(input_bwctrl_i[PACKPOS] && (req_two_time_r || !check_pot))
							// input_ns=F_LOCK;
						// else if(input_bwctrl_i[PACKPOS] && !req_two_time_r && check_pot)
							// input_ns=F_REQ2;
						else if(input_bwctrl_i[PACKPOS] && (!check_pot || skip_pack_r))
							input_ns=F_LOCK;
						else if(input_bwctrl_i[PACKPOS] && check_pot)
							input_ns=F_REQ2;
						else
							input_ns=F_PRELOCK;
					end
		F_LOCK	:	begin
						if(!input_stb_i)
							input_ns=F_IDLE;
 						else if(input_deny_i)//
							input_ns=F_FALL;// 
						else if(input_bwctrl_i[CANCELPOS])
							input_ns=F_IDLE;
						else
							input_ns=F_LOCK;
					end
		F_FALL	:	begin
						if(!input_stb_i)
							input_ns=F_IDLE;
						else
							input_ns=F_FALL;
					end
		default	:	input_ns=F_IDLE;			
	endcase
end

always@(posedge clk)	begin
	if(reset)
		address_r<=8'd0;
		
	else if(multicast==2'd1)
	  begin
		if(input_ns==F_REQ1 && input_stb_i)
			address_r<=input_data_i[2*ADDRYX-1:ADDRYX];
		
		else if(input_ns==F_REQ2 && input_stb_i)
			address_r<=input_data_i[3*ADDRYX-1:ADDRYX*2];

		else
			address_r<=8'd0;
	  end
	else if(multicast==2'd2)
	  begin
		if(input_ns==F_REQ1 && input_stb_i)
			address_r[7:4]<=input_data_i[ADDRYX+3:ADDRYX];
		
		else if(input_ns==F_REQ2 && input_stb_i)
			address_r[7:4]<=input_data_i[2*ADDRYX-1:ADDRYX+4];

		else
			address_r<=8'd0;
	  end  
end

always@(posedge clk)	begin
	if(reset)
		skip_pack_r<=1'd0;
	else if(!input_stb_i)
		skip_pack_r<=1'd0;
	else if(input_ns==F_REQ2 && input_stb_i)
		skip_pack_r<=1'd1;
	else
		skip_pack_r<=skip_pack_r;
end




assign	check_pot	=	input_data_i[DATAW-1:DATAW-2]==2'b10 && ( (multicast==2'd2 && input_data_i[ADDRYX+3:ADDRYX]==LOCAL_Y && |input_data_i[2*ADDRYX-1:ADDRYX+4]) || (multicast==2'd1 && input_data_i[ADDRYX+3:ADDRYX]==LOCAL_X && input_data_i[2*ADDRYX-1:ADDRYX+4]==LOCAL_Y && |input_data_i[3*ADDRYX-1:ADDRYX*2]));

/* always@(posedge clk)	begin
	if(reset)
		req_two_time_r<=1'd0;
	else if(input_ns==F_REQ2 && input_stb_i && check_pot)
		req_two_time_r<=1'd1;
	else if(!input_stb_i)
		req_two_time_r<=1'd0;
	else
		req_two_time_r<=req_two_time_r;
end */



always@(posedge clk)	begin
	if(reset)
		fail_r<=1'b0;
	else if(input_cs!=F_FALL &&	input_ns==F_FALL && input_stb_i)
		fail_r<=1'b1;
	else
		fail_r<=1'b0;
end

always@(posedge clk)	begin
	if(reset)
		request_r<=1'b0;
	else if((input_ns==F_REQ1 || input_ns==F_REQ2)&& input_stb_i)
		request_r<=1'b1;
	else
		request_r<=1'b0;
end

always@(posedge clk)	begin
	if(reset)
		pack_r<=1'b0;
	else
		pack_r<=input_bwctrl_i[PACKPOS];
end

always@(posedge clk)	begin
	if(reset)
		suspend_r<=1'b0;
	else
		suspend_r<=input_bwctrl_i[SUSPENDPOS];
end

always@(posedge clk)	begin
	if(reset)
		cancel_r<=1'b0;
	else
		cancel_r<=input_bwctrl_i[CANCELPOS];
end

assign	input_data_o	=	input_data_i;
assign	input_stb_o		=	input_stb_i;
assign	input_fwd_o		=	input_fwd_i;

assign	input_request_o	=	request_r;
assign	input_address_o	=	address_r;

assign	input_fail_o    = 	fail_r;                              
assign	input_pack_o    = 	pack_r;                              
assign	input_suspend_o = 	suspend_r;                           
assign	input_cancel_o  = 	cancel_r;


endmodule