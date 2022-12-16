`timescale 1ns / 10ps
module PCC_4op
#(
//LOCAL ADDRESS
parameter	LOCAL_Y	=	4'b0001,
parameter	LOCAL_X	=	4'b0001,
//PARAMETER
parameter	DATAW		=	66,
parameter	PORTS		=	4,
parameter   OUT_PORTS	=	4,
parameter	CONNECTIONW	=	16,
parameter	ADDRYX		=	8,
parameter	FWCTRLW		=	1,
parameter	BWCTRLW		=	3
)
(
//Inputs
input				clk,
input				reset,
input	[DATAW-1:0]	PCC_ip_data_i0,		PCC_ip_data_i1,		PCC_ip_data_i2,		PCC_ip_data_i3,	 
                                                                                                                        
input				PCC_ip_stb_i0,		PCC_ip_stb_i1,		PCC_ip_stb_i2,		PCC_ip_stb_i3,	
input				PCC_ip_fwd_i0,		PCC_ip_fwd_i1,		PCC_ip_fwd_i2,		PCC_ip_fwd_i3,	    	
                                                                                                                        
input				PCC_op_fail_i0,		PCC_op_fail_i1,		PCC_op_fail_i2,		PCC_op_fail_i3,	
input				PCC_op_pack_i0,		PCC_op_pack_i1,		PCC_op_pack_i2,		PCC_op_pack_i3,	
input				PCC_op_suspend_i0,	PCC_op_suspend_i1,	PCC_op_suspend_i2,	PCC_op_suspend_i3,	
input				PCC_op_cancel_i0,	PCC_op_cancel_i1,	PCC_op_cancel_i2,	PCC_op_cancel_i3,	

//Outputs
output	[DATAW-1:0]	PCC_op_data_o0,		PCC_op_data_o1,		PCC_op_data_o2,		PCC_op_data_o3,	

output				PCC_op_stb_o0,		PCC_op_stb_o1,		PCC_op_stb_o2,		PCC_op_stb_o3,	
output				PCC_op_fwd_o0,		PCC_op_fwd_o1,		PCC_op_fwd_o2,		PCC_op_fwd_o3,	
                                                                                                                        
output				PCC_ip_fail_o0,		PCC_ip_fail_o1,		PCC_ip_fail_o2,		PCC_ip_fail_o3,	 
output				PCC_ip_pack_o0,		PCC_ip_pack_o1,		PCC_ip_pack_o2,		PCC_ip_pack_o3,	
output				PCC_ip_suspend_o0,	PCC_ip_suspend_o1,	PCC_ip_suspend_o2,	PCC_ip_suspend_o3,	
output				PCC_ip_cancel_o0,	PCC_ip_cancel_o1,	PCC_ip_cancel_o2,	PCC_ip_cancel_o3

);

//Internal wire
wire	[PORTS-1:0]			if_pe_request;
wire	[DATAW*PORTS-1:0]	if_cb_data;
wire	[PORTS-1:0]			if_arb_stb;
wire	[PORTS-1:0]			if_cb_fwd;
wire	[ADDRYX*PORTS-1:0]	if_de_address;

wire	[PORTS-1:0]			pe_de_sel;

wire	[PORTS-1:0]			de_arb_src;
wire	[OUT_PORTS-1:0]		de_arb_dest;

wire	[PORTS-1:0]			arb_if_grant;
wire	[PORTS-1:0]			arb_if_deny;
wire	[CONNECTIONW-1:0]	arb_cb_connections;
wire	[OUT_PORTS-1:0]		arb_of_occupied;

wire	[BWCTRLW*PORTS-1:0]		cb_if_bw;
wire	[DATAW*OUT_PORTS-1:0]	cb_of_data;
wire	[FWCTRLW*OUT_PORTS-1:0]	cb_of_fwd;

wire	[OUT_PORTS-1:0]			of_arb_fail;
wire	[OUT_PORTS-1:0]			of_arb_cancel;
wire	[BWCTRLW*OUT_PORTS-1:0]	of_cb_bw;



//INTERFACE

InputFSM #(LOCAL_Y,LOCAL_X,DATAW)	InputFSM_IPCORE (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .input_stb_i(PCC_ip_stb_i0), 
    .input_fwd_i(PCC_ip_fwd_i0), 
    .input_grant_i(arb_if_grant[0]), 
    .input_bwctrl_i(cb_if_bw[BWCTRLW-1:0]), 
    .input_deny_i(arb_if_deny[0]), 
    .input_data_i(PCC_ip_data_i0), 
	//OUTPUTS
    .input_fwd_o(if_cb_fwd[0]), 
    .input_stb_o(if_arb_stb[0]), 
    .input_data_o(if_cb_data[DATAW-1:0]), 
    .input_request_o(if_pe_request[0]), 
    .input_cancel_o(PCC_ip_cancel_o0), 
    .input_suspend_o(PCC_ip_suspend_o0), 
    .input_pack_o(PCC_ip_pack_o0), 
    .input_fail_o(PCC_ip_fail_o0), 
    .input_address_o(if_de_address[ADDRYX-1:0])
	
    );

InputFSM #(LOCAL_Y,LOCAL_X,DATAW)	InputFSM_1 (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .input_stb_i(PCC_ip_stb_i1), 
    .input_fwd_i(PCC_ip_fwd_i1), 
    .input_grant_i(arb_if_grant[1]), 
    .input_bwctrl_i(cb_if_bw[BWCTRLW*2-1:BWCTRLW]), 
    .input_deny_i(arb_if_deny[1]), 
    .input_data_i(PCC_ip_data_i1), 
	//OUTPUTS
    .input_fwd_o(if_cb_fwd[1]), 
    .input_stb_o(if_arb_stb[1]), 
    .input_data_o(if_cb_data[DATAW*2-1:DATAW]), 
    .input_request_o(if_pe_request[1]), 
    .input_cancel_o(PCC_ip_cancel_o1), 
    .input_suspend_o(PCC_ip_suspend_o1), 
    .input_pack_o(PCC_ip_pack_o1), 
    .input_fail_o(PCC_ip_fail_o1), 
    .input_address_o(if_de_address[ADDRYX*2-1:ADDRYX])
	
    );

InputFSM #(LOCAL_Y,LOCAL_X,DATAW)	InputFSM_2 (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .input_stb_i(PCC_ip_stb_i2), 
    .input_fwd_i(PCC_ip_fwd_i2), 
    .input_grant_i(arb_if_grant[2]), 
    .input_bwctrl_i(cb_if_bw[BWCTRLW*3-1:BWCTRLW*2]), 
    .input_deny_i(arb_if_deny[2]), 
    .input_data_i(PCC_ip_data_i2), 
	//OUTPUTS
    .input_fwd_o(if_cb_fwd[2]), 
    .input_stb_o(if_arb_stb[2]), 
    .input_data_o(if_cb_data[DATAW*3-1:DATAW*2]), 
    .input_request_o(if_pe_request[2]), 
    .input_cancel_o(PCC_ip_cancel_o2), 
    .input_suspend_o(PCC_ip_suspend_o2), 
    .input_pack_o(PCC_ip_pack_o2), 
    .input_fail_o(PCC_ip_fail_o2), 
    .input_address_o(if_de_address[ADDRYX*3-1:ADDRYX*2])
	
    );

InputFSM #(LOCAL_Y,LOCAL_X,DATAW)	InputFSM_BRIDGE (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .input_stb_i(PCC_ip_stb_i3), 
    .input_fwd_i(PCC_ip_fwd_i3), 
    .input_grant_i(arb_if_grant[3]), 
    .input_bwctrl_i(cb_if_bw[BWCTRLW*4-1:BWCTRLW*3]), 
    .input_deny_i(arb_if_deny[3]), 
    .input_data_i(PCC_ip_data_i3), 
	//OUTPUTS
    .input_fwd_o(if_cb_fwd[3]), 
    .input_stb_o(if_arb_stb[3]), 
    .input_data_o(if_cb_data[DATAW*4-1:DATAW*3]), 
    .input_request_o(if_pe_request[3]), 
    .input_cancel_o(PCC_ip_cancel_o3), 
    .input_suspend_o(PCC_ip_suspend_o3), 
    .input_pack_o(PCC_ip_pack_o3), 
    .input_fail_o(PCC_ip_fail_o3), 
    .input_address_o(if_de_address[ADDRYX*4-1:ADDRYX*3])
	
	
    );

Priority Priority (
	//INPUTS
    .priority_request_i(if_pe_request), 
	//OUTPUTS
    .priority_request_o(pe_de_sel)
    );
	
Decoder #(LOCAL_Y,LOCAL_X,PORTS)	Decoder (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .decoder_select_i(pe_de_sel), 
    .decoder_address_i(if_de_address),
	//OUTPUTS
    .decoder_src_o(de_arb_src), 
    .decoder_dest_o(de_arb_dest)
    );	

Arbiter Arbiter (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .arbiter_stb_i(if_arb_stb), 
    .arbiter_src_i(de_arb_src), 
    .arbiter_dest_i(de_arb_dest), 
    .arbiter_fail_i(of_arb_fail), 
    .arbiter_cancel_i(of_arb_cancel),
	//OUTPUTS
    .arbiter_grant_o(arb_if_grant), 
    .arbiter_deny_o(arb_if_deny), 
    .arbiter_connections_o(arb_cb_connections), 
    .arbiter_occupied_o(arb_of_occupied)
    );

Crossbar #(DATAW)	Crossbar (
	//INPUTS
    .crossbar_connections_i(arb_cb_connections), 
    .crossbar_fw_ctrl_i(if_cb_fwd), 
    .crossbar_bw_ctrl_i(of_cb_bw), 
    .crossbar_data_i(if_cb_data), 
	//OUTPUTS
    .crossbar_fw_ctrl_o(cb_of_fwd), 
    .crossbar_bw_ctrl_o(cb_if_bw), 
    .crossbar_data_o(cb_of_data)
    );


OutputFSM #(LOCAL_Y,LOCAL_X,DATAW,3'd0)	OutputFSM_IPCORE (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .output_fwd_i(cb_of_fwd[0]), 
    .output_occupied_i(arb_of_occupied[0]), 
    .output_cancel_i(PCC_op_cancel_i0), 
    .output_suspend_i(PCC_op_suspend_i0), 
    .output_pack_i(PCC_op_pack_i0), 
    .output_fail_i(PCC_op_fail_i0), 
    .output_data_i(cb_of_data[DATAW-1:0]), 
	//OUTPUTS
    .output_bwctrl_o(of_cb_bw[BWCTRLW-1:0]), 
    .output_fail_o(of_arb_fail[0]), 
    .output_cancel_o(of_arb_cancel[0]), 
    .output_fwd_o(PCC_op_fwd_o0), 
    .output_stb_o(PCC_op_stb_o0), 
    .output_data_o(PCC_op_data_o0)
    );

OutputFSM #(LOCAL_Y,LOCAL_X,DATAW,3'd1)	OutputFSM_1 (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .output_fwd_i(cb_of_fwd[1]), 
    .output_occupied_i(arb_of_occupied[1]), 
    .output_cancel_i(PCC_op_cancel_i1), 
    .output_suspend_i(PCC_op_suspend_i1), 
    .output_pack_i(PCC_op_pack_i1), 
    .output_fail_i(PCC_op_fail_i1), 
    .output_data_i(cb_of_data[DATAW*2-1:DATAW]), 
	//OUTPUTS
    .output_bwctrl_o(of_cb_bw[BWCTRLW*2-1:BWCTRLW]), 
    .output_fail_o(of_arb_fail[1]), 
    .output_cancel_o(of_arb_cancel[1]), 
    .output_fwd_o(PCC_op_fwd_o1), 
    .output_stb_o(PCC_op_stb_o1), 
    .output_data_o(PCC_op_data_o1)
    );

OutputFSM #(LOCAL_Y,LOCAL_X,DATAW,3'd2)	OutputFSM_2 (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .output_fwd_i(cb_of_fwd[2]), 
    .output_occupied_i(arb_of_occupied[2]), 
    .output_cancel_i(PCC_op_cancel_i2), 
    .output_suspend_i(PCC_op_suspend_i2), 
    .output_pack_i(PCC_op_pack_i2), 
    .output_fail_i(PCC_op_fail_i2), 
    .output_data_i(cb_of_data[DATAW*3-1:DATAW*2]), 
	//OUTPUTS
    .output_bwctrl_o(of_cb_bw[BWCTRLW*3-1:BWCTRLW*2]), 
    .output_fail_o(of_arb_fail[2]), 
    .output_cancel_o(of_arb_cancel[2]), 
    .output_fwd_o(PCC_op_fwd_o2), 
    .output_stb_o(PCC_op_stb_o2), 
    .output_data_o(PCC_op_data_o2)
    );

OutputFSM #(LOCAL_Y,LOCAL_X,DATAW,3'd3)	OutputFSM_BRIDGE (
	//INPUTS
    .clk(clk), 
    .reset(reset), 
    .output_fwd_i(cb_of_fwd[3]), 
    .output_occupied_i(arb_of_occupied[3]), 
    .output_cancel_i(PCC_op_cancel_i3), 
    .output_suspend_i(PCC_op_suspend_i3), 
    .output_pack_i(PCC_op_pack_i3), 
    .output_fail_i(PCC_op_fail_i3), 
    .output_data_i(cb_of_data[DATAW*4-1:DATAW*3]),
	//OUTPUTS
    .output_bwctrl_o(of_cb_bw[BWCTRLW*4-1:BWCTRLW*3]), 
    .output_fail_o(of_arb_fail[3]), 
    .output_cancel_o(of_arb_cancel[3]), 
    .output_fwd_o(PCC_op_fwd_o3), 
    .output_stb_o(PCC_op_stb_o3), 
    .output_data_o(PCC_op_data_o3)
    );

endmodule
