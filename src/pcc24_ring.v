module	pcc24_ring
#(parameter	BUSW	=	66)
(input				clk,reset_n,
 
 output 			uart_txd
);
//clock counter
reg     [15:0]      clk_counter;
always@(posedge clk )
begin
    if(!reset_n)
        clk_counter <=  20'd0;
    else
        clk_counter <=clk_counter+20'd1;
 end
//CLUSTER(0 1) 
wire	[BUSW-1:0]	PCC_ip_data_0_1_i0;
wire				PCC_ip_stb_0_1_i0;
wire				PCC_ip_fwd_0_1_i0;
wire				PCC_op_fail_0_1_i0;
wire				PCC_op_pack_0_1_i0;
wire				PCC_op_suspend_0_1_i0;
wire				PCC_op_cancel_0_1_i0;

wire	[BUSW-1:0]	PCC_op_data_0_1_o0;
wire				PCC_op_stb_0_1_o0;
wire				PCC_op_fwd_0_1_o0;
wire				PCC_ip_fail_0_1_o0;
wire				PCC_ip_pack_0_1_o0;
wire				PCC_ip_suspend_0_1_o0;
wire				PCC_ip_cancel_0_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_0_1_o2;
wire 				PCC_op_stb_0_1_o2;
wire 				PCC_op_fwd_0_1_o2;
wire 				PCC_ip_fail_0_1_o2;
wire 				PCC_ip_pack_0_1_o2;
wire 				PCC_ip_suspend_0_1_o2;
wire 				PCC_ip_cancel_0_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_0_1_o1;
wire 				PCC_op_stb_0_1_o1;
wire 				PCC_op_fwd_0_1_o1;
wire 				PCC_ip_fail_0_1_o1;
wire 				PCC_ip_pack_0_1_o1;
wire 				PCC_ip_suspend_0_1_o1;
wire 				PCC_ip_cancel_0_1_o1;
//CLUSTER(1 1)
wire	[BUSW-1:0]	PCC_ip_data_1_1_i0;
wire				PCC_ip_stb_1_1_i0;
wire				PCC_ip_fwd_1_1_i0;
wire				PCC_op_fail_1_1_i0;
wire				PCC_op_pack_1_1_i0;
wire				PCC_op_suspend_1_1_i0;
wire				PCC_op_cancel_1_1_i0;

wire	[BUSW-1:0]	PCC_op_data_1_1_o0;
wire				PCC_op_stb_1_1_o0;
wire				PCC_op_fwd_1_1_o0;
wire				PCC_ip_fail_1_1_o0;
wire				PCC_ip_pack_1_1_o0;
wire				PCC_ip_suspend_1_1_o0;
wire				PCC_ip_cancel_1_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_1_1_o2;
wire 				PCC_op_stb_1_1_o2;
wire 				PCC_op_fwd_1_1_o2;
wire 				PCC_ip_fail_1_1_o2;
wire 				PCC_ip_pack_1_1_o2;
wire 				PCC_ip_suspend_1_1_o2;
wire 				PCC_ip_cancel_1_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_1_1_o1;
wire 				PCC_op_stb_1_1_o1;
wire 				PCC_op_fwd_1_1_o1;
wire 				PCC_ip_fail_1_1_o1;
wire 				PCC_ip_pack_1_1_o1;
wire 				PCC_ip_suspend_1_1_o1;
wire 				PCC_ip_cancel_1_1_o1;
//CLUSTER(2 1)BRIDGE
wire	[BUSW-1:0]	PCC_ip_data_2_1_i0;
wire				PCC_ip_stb_2_1_i0;
wire				PCC_ip_fwd_2_1_i0;
wire				PCC_op_fail_2_1_i0;
wire				PCC_op_pack_2_1_i0;
wire				PCC_op_suspend_2_1_i0;
wire				PCC_op_cancel_2_1_i0;

wire	[BUSW-1:0]	PCC_op_data_2_1_o0;
wire				PCC_op_stb_2_1_o0;
wire				PCC_op_fwd_2_1_o0;
wire				PCC_ip_fail_2_1_o0;
wire				PCC_ip_pack_2_1_o0;
wire				PCC_ip_suspend_2_1_o0;
wire				PCC_ip_cancel_2_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_2_1_o2;
wire 				PCC_op_stb_2_1_o2;
wire 				PCC_op_fwd_2_1_o2;
wire 				PCC_ip_fail_2_1_o2;
wire 				PCC_ip_pack_2_1_o2;
wire 				PCC_ip_suspend_2_1_o2;
wire 				PCC_ip_cancel_2_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_2_1_o1;
wire 				PCC_op_stb_2_1_o1;
wire 				PCC_op_fwd_2_1_o1;
wire 				PCC_ip_fail_2_1_o1;
wire 				PCC_ip_pack_2_1_o1;
wire 				PCC_ip_suspend_2_1_o1;
wire 				PCC_ip_cancel_2_1_o1;

wire 	[BUSW-1:0]	PCC_op_data_2_1_o3;
wire 				PCC_op_stb_2_1_o3;
wire 				PCC_op_fwd_2_1_o3;
wire 				PCC_ip_fail_2_1_o3;
wire 				PCC_ip_pack_2_1_o3;
wire 				PCC_ip_suspend_2_1_o3;
wire 				PCC_ip_cancel_2_1_o3;
//CLUSTER(3 1)
wire	[BUSW-1:0]	PCC_ip_data_3_1_i0;
wire				PCC_ip_stb_3_1_i0;
wire				PCC_ip_fwd_3_1_i0;
wire				PCC_op_fail_3_1_i0;
wire				PCC_op_pack_3_1_i0;
wire				PCC_op_suspend_3_1_i0;
wire				PCC_op_cancel_3_1_i0;

wire	[BUSW-1:0]	PCC_op_data_3_1_o0;
wire				PCC_op_stb_3_1_o0;
wire				PCC_op_fwd_3_1_o0;
wire				PCC_ip_fail_3_1_o0;
wire				PCC_ip_pack_3_1_o0;
wire				PCC_ip_suspend_3_1_o0;
wire				PCC_ip_cancel_3_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_3_1_o2;
wire 				PCC_op_stb_3_1_o2;
wire 				PCC_op_fwd_3_1_o2;
wire 				PCC_ip_fail_3_1_o2;
wire 				PCC_ip_pack_3_1_o2;
wire 				PCC_ip_suspend_3_1_o2;
wire 				PCC_ip_cancel_3_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_3_1_o1;
wire 				PCC_op_stb_3_1_o1;
wire 				PCC_op_fwd_3_1_o1;
wire 				PCC_ip_fail_3_1_o1;
wire 				PCC_ip_pack_3_1_o1;
wire 				PCC_ip_suspend_3_1_o1;
wire 				PCC_ip_cancel_3_1_o1;
//CLUSTER(4 1)
wire	[BUSW-1:0]	PCC_ip_data_4_1_i0;
wire				PCC_ip_stb_4_1_i0;
wire				PCC_ip_fwd_4_1_i0;
wire				PCC_op_fail_4_1_i0;
wire				PCC_op_pack_4_1_i0;
wire				PCC_op_suspend_4_1_i0;
wire				PCC_op_cancel_4_1_i0;

wire	[BUSW-1:0]	PCC_op_data_4_1_o0;
wire				PCC_op_stb_4_1_o0;
wire				PCC_op_fwd_4_1_o0;
wire				PCC_ip_fail_4_1_o0;
wire				PCC_ip_pack_4_1_o0;
wire				PCC_ip_suspend_4_1_o0;
wire				PCC_ip_cancel_4_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_4_1_o2;
wire 				PCC_op_stb_4_1_o2;
wire 				PCC_op_fwd_4_1_o2;
wire 				PCC_ip_fail_4_1_o2;
wire 				PCC_ip_pack_4_1_o2;
wire 				PCC_ip_suspend_4_1_o2;
wire 				PCC_ip_cancel_4_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_4_1_o1;
wire 				PCC_op_stb_4_1_o1;
wire 				PCC_op_fwd_4_1_o1;
wire 				PCC_ip_fail_4_1_o1;
wire 				PCC_ip_pack_4_1_o1;
wire 				PCC_ip_suspend_4_1_o1;
wire 				PCC_ip_cancel_4_1_o1;
//CLUSTER(5 1)
wire	[BUSW-1:0]	PCC_ip_data_5_1_i0;
wire				PCC_ip_stb_5_1_i0;
wire				PCC_ip_fwd_5_1_i0;
wire				PCC_op_fail_5_1_i0;
wire				PCC_op_pack_5_1_i0;
wire				PCC_op_suspend_5_1_i0;
wire				PCC_op_cancel_5_1_i0;

wire	[BUSW-1:0]	PCC_op_data_5_1_o0;
wire				PCC_op_stb_5_1_o0;
wire				PCC_op_fwd_5_1_o0;
wire				PCC_ip_fail_5_1_o0;
wire				PCC_ip_pack_5_1_o0;
wire				PCC_ip_suspend_5_1_o0;
wire				PCC_ip_cancel_5_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_5_1_o2;
wire 				PCC_op_stb_5_1_o2;
wire 				PCC_op_fwd_5_1_o2;
wire 				PCC_ip_fail_5_1_o2;
wire 				PCC_ip_pack_5_1_o2;
wire 				PCC_ip_suspend_5_1_o2;
wire 				PCC_ip_cancel_5_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_5_1_o1;
wire 				PCC_op_stb_5_1_o1;
wire 				PCC_op_fwd_5_1_o1;
wire 				PCC_ip_fail_5_1_o1;
wire 				PCC_ip_pack_5_1_o1;
wire 				PCC_ip_suspend_5_1_o1;
wire 				PCC_ip_cancel_5_1_o1;
//CLUSTER(6 1)BRIDGE
wire	[BUSW-1:0]	PCC_ip_data_6_1_i0;
wire				PCC_ip_stb_6_1_i0;
wire				PCC_ip_fwd_6_1_i0;
wire				PCC_op_fail_6_1_i0;
wire				PCC_op_pack_6_1_i0;
wire				PCC_op_suspend_6_1_i0;
wire				PCC_op_cancel_6_1_i0;

wire	[BUSW-1:0]	PCC_op_data_6_1_o0;
wire				PCC_op_stb_6_1_o0;
wire				PCC_op_fwd_6_1_o0;
wire				PCC_ip_fail_6_1_o0;
wire				PCC_ip_pack_6_1_o0;
wire				PCC_ip_suspend_6_1_o0;
wire				PCC_ip_cancel_6_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_6_1_o2;
wire 				PCC_op_stb_6_1_o2;
wire 				PCC_op_fwd_6_1_o2;
wire 				PCC_ip_fail_6_1_o2;
wire 				PCC_ip_pack_6_1_o2;
wire 				PCC_ip_suspend_6_1_o2;
wire 				PCC_ip_cancel_6_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_6_1_o3;
wire 				PCC_op_stb_6_1_o3;
wire 				PCC_op_fwd_6_1_o3;
wire 				PCC_ip_fail_6_1_o3;
wire 				PCC_ip_pack_6_1_o3;
wire 				PCC_ip_suspend_6_1_o3;
wire 				PCC_ip_cancel_6_1_o3;

wire 	[BUSW-1:0]	PCC_op_data_6_1_o1;
wire 				PCC_op_stb_6_1_o1;
wire 				PCC_op_fwd_6_1_o1;
wire 				PCC_ip_fail_6_1_o1;
wire 				PCC_ip_pack_6_1_o1;
wire 				PCC_ip_suspend_6_1_o1;
wire 				PCC_ip_cancel_6_1_o1;
//CLUSTER(7 1)
wire	[BUSW-1:0]	PCC_ip_data_7_1_i0;
wire				PCC_ip_stb_7_1_i0;
wire				PCC_ip_fwd_7_1_i0;
wire				PCC_op_fail_7_1_i0;
wire				PCC_op_pack_7_1_i0;
wire				PCC_op_suspend_7_1_i0;
wire				PCC_op_cancel_7_1_i0;

wire	[BUSW-1:0]	PCC_op_data_7_1_o0;
wire				PCC_op_stb_7_1_o0;
wire				PCC_op_fwd_7_1_o0;
wire				PCC_ip_fail_7_1_o0;
wire				PCC_ip_pack_7_1_o0;
wire				PCC_ip_suspend_7_1_o0;
wire				PCC_ip_cancel_7_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_7_1_o2;
wire 				PCC_op_stb_7_1_o2;
wire 				PCC_op_fwd_7_1_o2;
wire 				PCC_ip_fail_7_1_o2;
wire 				PCC_ip_pack_7_1_o2;
wire 				PCC_ip_suspend_7_1_o2;
wire 				PCC_ip_cancel_7_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_7_1_o1;
wire 				PCC_op_stb_7_1_o1;
wire 				PCC_op_fwd_7_1_o1;
wire 				PCC_ip_fail_7_1_o1;
wire 				PCC_ip_pack_7_1_o1;
wire 				PCC_ip_suspend_7_1_o1;
wire 				PCC_ip_cancel_7_1_o1;
//CLUSTER(8 1)
wire	[BUSW-1:0]	PCC_ip_data_8_1_i0;
wire				PCC_ip_stb_8_1_i0;
wire				PCC_ip_fwd_8_1_i0;
wire				PCC_op_fail_8_1_i0;
wire				PCC_op_pack_8_1_i0;
wire				PCC_op_suspend_8_1_i0;
wire				PCC_op_cancel_8_1_i0;

wire	[BUSW-1:0]	PCC_op_data_8_1_o0;
wire				PCC_op_stb_8_1_o0;
wire				PCC_op_fwd_8_1_o0;
wire				PCC_ip_fail_8_1_o0;
wire				PCC_ip_pack_8_1_o0;
wire				PCC_ip_suspend_8_1_o0;
wire				PCC_ip_cancel_8_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_8_1_o2;
wire 				PCC_op_stb_8_1_o2;
wire 				PCC_op_fwd_8_1_o2;
wire 				PCC_ip_fail_8_1_o2;
wire 				PCC_ip_pack_8_1_o2;
wire 				PCC_ip_suspend_8_1_o2;
wire 				PCC_ip_cancel_8_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_8_1_o1;
wire 				PCC_op_stb_8_1_o1;
wire 				PCC_op_fwd_8_1_o1;
wire 				PCC_ip_fail_8_1_o1;
wire 				PCC_ip_pack_8_1_o1;
wire 				PCC_ip_suspend_8_1_o1;
wire 				PCC_ip_cancel_8_1_o1;
//CLUSTER(9 1)
wire	[BUSW-1:0]	PCC_ip_data_9_1_i0;
wire				PCC_ip_stb_9_1_i0;
wire				PCC_ip_fwd_9_1_i0;
wire				PCC_op_fail_9_1_i0;
wire				PCC_op_pack_9_1_i0;
wire				PCC_op_suspend_9_1_i0;
wire				PCC_op_cancel_9_1_i0;

wire	[BUSW-1:0]	PCC_op_data_9_1_o0;
wire				PCC_op_stb_9_1_o0;
wire				PCC_op_fwd_9_1_o0;
wire				PCC_ip_fail_9_1_o0;
wire				PCC_ip_pack_9_1_o0;
wire				PCC_ip_suspend_9_1_o0;
wire				PCC_ip_cancel_9_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_9_1_o2;
wire 				PCC_op_stb_9_1_o2;
wire 				PCC_op_fwd_9_1_o2;
wire 				PCC_ip_fail_9_1_o2;
wire 				PCC_ip_pack_9_1_o2;
wire 				PCC_ip_suspend_9_1_o2;
wire 				PCC_ip_cancel_9_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_9_1_o1;
wire 				PCC_op_stb_9_1_o1;
wire 				PCC_op_fwd_9_1_o1;
wire 				PCC_ip_fail_9_1_o1;
wire 				PCC_ip_pack_9_1_o1;
wire 				PCC_ip_suspend_9_1_o1;
wire 				PCC_ip_cancel_9_1_o1;
//CLUSTER(10 1)BRIDGE
wire	[BUSW-1:0]	PCC_ip_data_10_1_i0;
wire				PCC_ip_stb_10_1_i0;
wire				PCC_ip_fwd_10_1_i0;
wire				PCC_op_fail_10_1_i0;
wire				PCC_op_pack_10_1_i0;
wire				PCC_op_suspend_10_1_i0;
wire				PCC_op_cancel_10_1_i0;

wire	[BUSW-1:0]	PCC_op_data_10_1_o0;
wire				PCC_op_stb_10_1_o0;
wire				PCC_op_fwd_10_1_o0;
wire				PCC_ip_fail_10_1_o0;
wire				PCC_ip_pack_10_1_o0;
wire				PCC_ip_suspend_10_1_o0;
wire				PCC_ip_cancel_10_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_10_1_o2;
wire 				PCC_op_stb_10_1_o2;
wire 				PCC_op_fwd_10_1_o2;
wire 				PCC_ip_fail_10_1_o2;
wire 				PCC_ip_pack_10_1_o2;
wire 				PCC_ip_suspend_10_1_o2;
wire 				PCC_ip_cancel_10_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_10_1_o3;
wire 				PCC_op_stb_10_1_o3;
wire 				PCC_op_fwd_10_1_o3;
wire 				PCC_ip_fail_10_1_o3;
wire 				PCC_ip_pack_10_1_o3;
wire 				PCC_ip_suspend_10_1_o3;
wire 				PCC_ip_cancel_10_1_o3;

wire 	[BUSW-1:0]	PCC_op_data_10_1_o1;
wire 				PCC_op_stb_10_1_o1;
wire 				PCC_op_fwd_10_1_o1;
wire 				PCC_ip_fail_10_1_o1;
wire 				PCC_ip_pack_10_1_o1;
wire 				PCC_ip_suspend_10_1_o1;
wire 				PCC_ip_cancel_10_1_o1;
//CLUSTER(11 1)
wire	[BUSW-1:0]	PCC_ip_data_11_1_i0;
wire				PCC_ip_stb_11_1_i0;
wire				PCC_ip_fwd_11_1_i0;
wire				PCC_op_fail_11_1_i0;
wire				PCC_op_pack_11_1_i0;
wire				PCC_op_suspend_11_1_i0;
wire				PCC_op_cancel_11_1_i0;

wire	[BUSW-1:0]	PCC_op_data_11_1_o0;
wire				PCC_op_stb_11_1_o0;
wire				PCC_op_fwd_11_1_o0;
wire				PCC_ip_fail_11_1_o0;
wire				PCC_ip_pack_11_1_o0;
wire				PCC_ip_suspend_11_1_o0;
wire				PCC_ip_cancel_11_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_11_1_o2;
wire 				PCC_op_stb_11_1_o2;
wire 				PCC_op_fwd_11_1_o2;
wire 				PCC_ip_fail_11_1_o2;
wire 				PCC_ip_pack_11_1_o2;
wire 				PCC_ip_suspend_11_1_o2;
wire 				PCC_ip_cancel_11_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_11_1_o1;
wire 				PCC_op_stb_11_1_o1;
wire 				PCC_op_fwd_11_1_o1;
wire 				PCC_ip_fail_11_1_o1;
wire 				PCC_ip_pack_11_1_o1;
wire 				PCC_ip_suspend_11_1_o1;
wire 				PCC_ip_cancel_11_1_o1;
//CLUSTER(12 1)
wire	[BUSW-1:0]	PCC_ip_data_12_1_i0;
wire				PCC_ip_stb_12_1_i0;
wire				PCC_ip_fwd_12_1_i0;
wire				PCC_op_fail_12_1_i0;
wire				PCC_op_pack_12_1_i0;
wire				PCC_op_suspend_12_1_i0;
wire				PCC_op_cancel_12_1_i0;

wire	[BUSW-1:0]	PCC_op_data_12_1_o0;
wire				PCC_op_stb_12_1_o0;
wire				PCC_op_fwd_12_1_o0;
wire				PCC_ip_fail_12_1_o0;
wire				PCC_ip_pack_12_1_o0;
wire				PCC_ip_suspend_12_1_o0;
wire				PCC_ip_cancel_12_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_12_1_o2;
wire 				PCC_op_stb_12_1_o2;
wire 				PCC_op_fwd_12_1_o2;
wire 				PCC_ip_fail_12_1_o2;
wire 				PCC_ip_pack_12_1_o2;
wire 				PCC_ip_suspend_12_1_o2;
wire 				PCC_ip_cancel_12_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_12_1_o1;
wire 				PCC_op_stb_12_1_o1;
wire 				PCC_op_fwd_12_1_o1;
wire 				PCC_ip_fail_12_1_o1;
wire 				PCC_ip_pack_12_1_o1;
wire 				PCC_ip_suspend_12_1_o1;
wire 				PCC_ip_cancel_12_1_o1;
//CLUSTER(13 1)
wire	[BUSW-1:0]	PCC_ip_data_13_1_i0;
wire				PCC_ip_stb_13_1_i0;
wire				PCC_ip_fwd_13_1_i0;
wire				PCC_op_fail_13_1_i0;
wire				PCC_op_pack_13_1_i0;
wire				PCC_op_suspend_13_1_i0;
wire				PCC_op_cancel_13_1_i0;

wire	[BUSW-1:0]	PCC_op_data_13_1_o0;
wire				PCC_op_stb_13_1_o0;
wire				PCC_op_fwd_13_1_o0;
wire				PCC_ip_fail_13_1_o0;
wire				PCC_ip_pack_13_1_o0;
wire				PCC_ip_suspend_13_1_o0;
wire				PCC_ip_cancel_13_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_13_1_o2;
wire 				PCC_op_stb_13_1_o2;
wire 				PCC_op_fwd_13_1_o2;
wire 				PCC_ip_fail_13_1_o2;
wire 				PCC_ip_pack_13_1_o2;
wire 				PCC_ip_suspend_13_1_o2;
wire 				PCC_ip_cancel_13_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_13_1_o1;
wire 				PCC_op_stb_13_1_o1;
wire 				PCC_op_fwd_13_1_o1;
wire 				PCC_ip_fail_13_1_o1;
wire 				PCC_ip_pack_13_1_o1;
wire 				PCC_ip_suspend_13_1_o1;
wire 				PCC_ip_cancel_13_1_o1;
//CLUSTER(14 1)BRIDGE
wire	[BUSW-1:0]	PCC_ip_data_14_1_i0;
wire				PCC_ip_stb_14_1_i0;
wire				PCC_ip_fwd_14_1_i0;
wire				PCC_op_fail_14_1_i0;
wire				PCC_op_pack_14_1_i0;
wire				PCC_op_suspend_14_1_i0;
wire				PCC_op_cancel_14_1_i0;

wire	[BUSW-1:0]	PCC_op_data_14_1_o0;
wire				PCC_op_stb_14_1_o0;
wire				PCC_op_fwd_14_1_o0;
wire				PCC_ip_fail_14_1_o0;
wire				PCC_ip_pack_14_1_o0;
wire				PCC_ip_suspend_14_1_o0;
wire				PCC_ip_cancel_14_1_o0;

wire 	[BUSW-1:0]	PCC_op_data_14_1_o2;
wire 				PCC_op_stb_14_1_o2;
wire 				PCC_op_fwd_14_1_o2;
wire 				PCC_ip_fail_14_1_o2;
wire 				PCC_ip_pack_14_1_o2;
wire 				PCC_ip_suspend_14_1_o2;
wire 				PCC_ip_cancel_14_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_14_1_o3;
wire 				PCC_op_stb_14_1_o3;
wire 				PCC_op_fwd_14_1_o3;
wire 				PCC_ip_fail_14_1_o3;
wire 				PCC_ip_pack_14_1_o3;
wire 				PCC_ip_suspend_14_1_o3;
wire 				PCC_ip_cancel_14_1_o3;

wire 	[BUSW-1:0]	PCC_op_data_14_1_o1;
wire 				PCC_op_stb_14_1_o1;
wire 				PCC_op_fwd_14_1_o1;
wire 				PCC_ip_fail_14_1_o1;
wire 				PCC_ip_pack_14_1_o1;
wire 				PCC_ip_suspend_14_1_o1;
wire 				PCC_ip_cancel_14_1_o1;
//CLUSTER(15 1)
wire	[BUSW-1:0]	PCC_ip_data_15_1_i0;
wire				PCC_ip_stb_15_1_i0;
wire				PCC_ip_fwd_15_1_i0;
wire				PCC_op_fail_15_1_i0;
wire				PCC_op_pack_15_1_i0;
wire				PCC_op_suspend_15_1_i0;
wire				PCC_op_cancel_15_1_i0;

wire	[BUSW-1:0]	PCC_op_data_15_1_o0;
wire				PCC_op_stb_15_1_o0;
wire				PCC_op_fwd_15_1_o0;
wire				PCC_ip_fail_15_1_o0;
wire				PCC_ip_pack_15_1_o0;
wire				PCC_ip_suspend_15_1_o0;
wire				PCC_ip_cancel1_15_o0;

wire 	[BUSW-1:0]	PCC_op_data_15_1_o2;
wire 				PCC_op_stb_15_1_o2;
wire 				PCC_op_fwd_15_1_o2;
wire 				PCC_ip_fail_15_1_o2;
wire 				PCC_ip_pack_15_1_o2;
wire 				PCC_ip_suspend_15_1_o2;
wire 				PCC_ip_cancel_15_1_o2;

wire 	[BUSW-1:0]	PCC_op_data_15_1_o1;
wire 				PCC_op_stb_15_1_o1;
wire 				PCC_op_fwd_15_1_o1;
wire 				PCC_ip_fail_15_1_o1;
wire 				PCC_ip_pack_15_1_o1;
wire 				PCC_ip_suspend_15_1_o1;
wire 				PCC_ip_cancel_15_1_o1;
//CLUSTER(0 2)
wire	[BUSW-1:0]	PCC_ip_data_0_2_i0;
wire				PCC_ip_stb_0_2_i0;
wire				PCC_ip_fwd_0_2_i0;
wire				PCC_op_fail_0_2_i0;
wire				PCC_op_pack_0_2_i0;
wire				PCC_op_suspend_0_2_i0;
wire				PCC_op_cancel_0_2_i0;
wire	[BUSW-1:0]	PCC_op_data_0_2_o0;
wire				PCC_op_stb_0_2_o0;
wire				PCC_op_fwd_0_2_o0;
wire				PCC_ip_fail_0_2_o0;
wire				PCC_ip_pack_0_2_o0;
wire				PCC_ip_suspend_0_2_o0;
wire				PCC_ip_cancel_0_2_o0;

wire	[BUSW-1:0]	PCC_op_data_0_2_o2;
wire				PCC_op_stb_0_2_o2;
wire				PCC_op_fwd_0_2_o2;
wire				PCC_ip_fail_0_2_o2;
wire				PCC_ip_pack_0_2_o2;
wire				PCC_ip_suspend_0_2_o2;
wire				PCC_ip_cancel_0_2_o2;

wire	[BUSW-1:0]	PCC_op_data_0_2_o1;
wire				PCC_op_stb_0_2_o1;
wire				PCC_op_fwd_0_2_o1;
wire				PCC_ip_fail_0_2_o1;
wire				PCC_ip_pack_0_2_o1;
wire				PCC_ip_suspend_0_2_o1;
wire				PCC_ip_cancel_0_2_o1;

//CLUSTER(1 2)BRIDGE
wire	[BUSW-1:0]	PCC_ip_data_1_2_i0;
wire				PCC_ip_stb_1_2_i0;
wire				PCC_ip_fwd_1_2_i0;
wire				PCC_op_fail_1_2_i0;
wire				PCC_op_pack_1_2_i0;
wire				PCC_op_suspend_1_2_i0;
wire				PCC_op_cancel_1_2_i0;
wire	[BUSW-1:0]	PCC_op_data_1_2_o0;
wire				PCC_op_stb_1_2_o0;
wire				PCC_op_fwd_1_2_o0;
wire				PCC_ip_fail_1_2_o0;
wire				PCC_ip_pack_1_2_o0;
wire				PCC_ip_suspend_1_2_o0;
wire				PCC_ip_cancel_1_2_o0;

wire	[BUSW-1:0]	PCC_op_data_1_2_o1;
wire				PCC_op_stb_1_2_o1;
wire				PCC_op_fwd_1_2_o1;
wire				PCC_ip_fail_1_2_o1;
wire				PCC_ip_pack_1_2_o1;
wire				PCC_ip_suspend_1_2_o1;
wire				PCC_ip_cancel_1_2_o1;

wire	[BUSW-1:0]	PCC_op_data_1_2_o2;
wire				PCC_op_stb_1_2_o2;
wire				PCC_op_fwd_1_2_o2;
wire				PCC_ip_fail_1_2_o2;
wire				PCC_ip_pack_1_2_o2;
wire				PCC_ip_suspend_1_2_o2;
wire				PCC_ip_cancel_1_2_o2;

wire	[BUSW-1:0]	PCC_op_data_1_2_o3;
wire				PCC_op_stb_1_2_o3;
wire				PCC_op_fwd_1_2_o3;
wire				PCC_ip_fail_1_2_o3;
wire				PCC_ip_pack_1_2_o3;
wire				PCC_ip_suspend_1_2_o3;
wire				PCC_ip_cancel_1_2_o3;

//CLUSTER(2 2)
wire	[BUSW-1:0]	PCC_ip_data_2_2_i0;
wire				PCC_ip_stb_2_2_i0;
wire				PCC_ip_fwd_2_2_i0;
wire				PCC_op_fail_2_2_i0;
wire				PCC_op_pack_2_2_i0;
wire				PCC_op_suspend_2_2_i0;
wire				PCC_op_cancel_2_2_i0;
wire	[BUSW-1:0]	PCC_op_data_2_2_o0;
wire				PCC_op_stb_2_2_o0;
wire				PCC_op_fwd_2_2_o0;
wire				PCC_ip_fail_2_2_o0;
wire				PCC_ip_pack_2_2_o0;
wire				PCC_ip_suspend_2_2_o0;
wire				PCC_ip_cancel_2_2_o0;

wire	[BUSW-1:0]	PCC_op_data_2_2_o2;
wire				PCC_op_stb_2_2_o2;
wire				PCC_op_fwd_2_2_o2;
wire				PCC_ip_fail_2_2_o2;
wire				PCC_ip_pack_2_2_o2;
wire				PCC_ip_suspend_2_2_o2;
wire				PCC_ip_cancel_2_2_o2;

wire	[BUSW-1:0]	PCC_op_data_2_2_o1;
wire				PCC_op_stb_2_2_o1;
wire				PCC_op_fwd_2_2_o1;
wire				PCC_ip_fail_2_2_o1;
wire				PCC_ip_pack_2_2_o1;
wire				PCC_ip_suspend_2_2_o1;
wire				PCC_ip_cancel_2_2_o1;

//CLUSTER(3 2)BRIDGE
wire	[BUSW-1:0]	PCC_ip_data_3_2_i0;
wire				PCC_ip_stb_3_2_i0;
wire				PCC_ip_fwd_3_2_i0;
wire				PCC_op_fail_3_2_i0;
wire				PCC_op_pack_3_2_i0;
wire				PCC_op_suspend_3_2_i0;
wire				PCC_op_cancel_3_2_i0;
wire	[BUSW-1:0]	PCC_op_data_3_2_o0;
wire				PCC_op_stb_3_2_o0;
wire				PCC_op_fwd_3_2_o0;
wire				PCC_ip_fail_3_2_o0;
wire				PCC_ip_pack_3_2_o0;
wire				PCC_ip_suspend_3_2_o0;
wire				PCC_ip_cancel_3_2_o0;

wire	[BUSW-1:0]	PCC_op_data_3_2_o1;
wire				PCC_op_stb_3_2_o1;
wire				PCC_op_fwd_3_2_o1;
wire				PCC_ip_fail_3_2_o1;
wire				PCC_ip_pack_3_2_o1;
wire				PCC_ip_suspend_3_2_o1;
wire				PCC_ip_cancel_3_2_o1;

wire	[BUSW-1:0]	PCC_op_data_3_2_o2;
wire				PCC_op_stb_3_2_o2;
wire				PCC_op_fwd_3_2_o2;
wire				PCC_ip_fail_3_2_o2;
wire				PCC_ip_pack_3_2_o2;
wire				PCC_ip_suspend_3_2_o2;
wire				PCC_ip_cancel_3_2_o2;

wire	[BUSW-1:0]	PCC_op_data_3_2_o3;
wire				PCC_op_stb_3_2_o3;
wire				PCC_op_fwd_3_2_o3;
wire				PCC_ip_fail_3_2_o3;
wire				PCC_ip_pack_3_2_o3;
wire				PCC_ip_suspend_3_2_o3;
wire				PCC_ip_cancel_3_2_o3;

//CLUSTER(4 2)
wire	[BUSW-1:0]	PCC_ip_data_4_2_i0;
wire				PCC_ip_stb_4_2_i0;
wire				PCC_ip_fwd_4_2_i0;
wire				PCC_op_fail_4_2_i0;
wire				PCC_op_pack_4_2_i0;
wire				PCC_op_suspend_4_2_i0;
wire				PCC_op_cancel_4_2_i0;
wire	[BUSW-1:0]	PCC_op_data_4_2_o0;
wire				PCC_op_stb_4_2_o0;
wire				PCC_op_fwd_4_2_o0;
wire				PCC_ip_fail_4_2_o0;
wire				PCC_ip_pack_4_2_o0;
wire				PCC_ip_suspend_4_2_o0;
wire				PCC_ip_cancel_4_2_o0;

wire	[BUSW-1:0]	PCC_op_data_4_2_o2;
wire				PCC_op_stb_4_2_o2;
wire				PCC_op_fwd_4_2_o2;
wire				PCC_ip_fail_4_2_o2;
wire				PCC_ip_pack_4_2_o2;
wire				PCC_ip_suspend_4_2_o2;
wire				PCC_ip_cancel_4_2_o2;

wire	[BUSW-1:0]	PCC_op_data_4_2_o1;
wire				PCC_op_stb_4_2_o1;
wire				PCC_op_fwd_4_2_o1;
wire				PCC_ip_fail_4_2_o1;
wire				PCC_ip_pack_4_2_o1;
wire				PCC_ip_suspend_4_2_o1;
wire				PCC_ip_cancel_4_2_o1;

//CLUSTER(5 2)BRIDGE
wire	[BUSW-1:0]	PCC_ip_data_5_2_i0;
wire				PCC_ip_stb_5_2_i0;
wire				PCC_ip_fwd_5_2_i0;
wire				PCC_op_fail_5_2_i0;
wire				PCC_op_pack_5_2_i0;
wire				PCC_op_suspend_5_2_i0;
wire				PCC_op_cancel_5_2_i0;
wire	[BUSW-1:0]	PCC_op_data_5_2_o0;
wire				PCC_op_stb_5_2_o0;
wire				PCC_op_fwd_5_2_o0;
wire				PCC_ip_fail_5_2_o0;
wire				PCC_ip_pack_5_2_o0;
wire				PCC_ip_suspend_5_2_o0;
wire				PCC_ip_cancel_5_2_o0;

wire	[BUSW-1:0]	PCC_op_data_5_2_o1;
wire				PCC_op_stb_5_2_o1;
wire				PCC_op_fwd_5_2_o1;
wire				PCC_ip_fail_5_2_o1;
wire				PCC_ip_pack_5_2_o1;
wire				PCC_ip_suspend_5_2_o1;
wire				PCC_ip_cancel_5_2_o1;

wire	[BUSW-1:0]	PCC_op_data_5_2_o2;
wire				PCC_op_stb_5_2_o2;
wire				PCC_op_fwd_5_2_o2;
wire				PCC_ip_fail_5_2_o2;
wire				PCC_ip_pack_5_2_o2;
wire				PCC_ip_suspend_5_2_o2;
wire				PCC_ip_cancel_5_2_o2;

wire	[BUSW-1:0]	PCC_op_data_5_2_o3;
wire				PCC_op_stb_5_2_o3;
wire				PCC_op_fwd_5_2_o3;
wire				PCC_ip_fail_5_2_o3;
wire				PCC_ip_pack_5_2_o3;
wire				PCC_ip_suspend_5_2_o3;
wire				PCC_ip_cancel_5_2_o3;

//CLUSTER(6 2)
wire	[BUSW-1:0]	PCC_ip_data_6_2_i0;
wire				PCC_ip_stb_6_2_i0;
wire				PCC_ip_fwd_6_2_i0;
wire				PCC_op_fail_6_2_i0;
wire				PCC_op_pack_6_2_i0;
wire				PCC_op_suspend_6_2_i0;
wire				PCC_op_cancel_6_2_i0;
wire	[BUSW-1:0]	PCC_op_data_6_2_o0;
wire				PCC_op_stb_6_2_o0;
wire				PCC_op_fwd_6_2_o0;
wire				PCC_ip_fail_6_2_o0;
wire				PCC_ip_pack_6_2_o0;
wire				PCC_ip_suspend_6_2_o0;
wire				PCC_ip_cancel_6_2_o0;

wire	[BUSW-1:0]	PCC_op_data_6_2_o2;
wire				PCC_op_stb_6_2_o2;
wire				PCC_op_fwd_6_2_o2;
wire				PCC_ip_fail_6_2_o2;
wire				PCC_ip_pack_6_2_o2;
wire				PCC_ip_suspend_6_2_o2;
wire				PCC_ip_cancel_6_2_o2;

wire	[BUSW-1:0]	PCC_op_data_6_2_o1;
wire				PCC_op_stb_6_2_o1;
wire				PCC_op_fwd_6_2_o1;
wire				PCC_ip_fail_6_2_o1;
wire				PCC_ip_pack_6_2_o1;
wire				PCC_ip_suspend_6_2_o1;
wire				PCC_ip_cancel_6_2_o1;

//CLUSTER(7 2)BRIDGE
wire	[BUSW-1:0]	PCC_ip_data_7_2_i0;
wire				PCC_ip_stb_7_2_i0;
wire				PCC_ip_fwd_7_2_i0;
wire				PCC_op_fail_7_2_i0;
wire				PCC_op_pack_7_2_i0;
wire				PCC_op_suspend_7_2_i0;
wire				PCC_op_cancel_7_2_i0;
wire	[BUSW-1:0]	PCC_op_data_7_2_o0;
wire				PCC_op_stb_7_2_o0;
wire				PCC_op_fwd_7_2_o0;
wire				PCC_ip_fail_7_2_o0;
wire				PCC_ip_pack_7_2_o0;
wire				PCC_ip_suspend_7_2_o0;
wire				PCC_ip_cancel_7_2_o0;

wire	[BUSW-1:0]	PCC_op_data_7_2_o1;
wire				PCC_op_stb_7_2_o1;
wire				PCC_op_fwd_7_2_o1;
wire				PCC_ip_fail_7_2_o1;
wire				PCC_ip_pack_7_2_o1;
wire				PCC_ip_suspend_7_2_o1;
wire				PCC_ip_cancel_7_2_o1;

wire	[BUSW-1:0]	PCC_op_data_7_2_o2;
wire				PCC_op_stb_7_2_o2;
wire				PCC_op_fwd_7_2_o2;
wire				PCC_ip_fail_7_2_o2;
wire				PCC_ip_pack_7_2_o2;
wire				PCC_ip_suspend_7_2_o2;
wire				PCC_ip_cancel_7_2_o2;

wire	[BUSW-1:0]	PCC_op_data_7_2_o3;
wire				PCC_op_stb_7_2_o3;
wire				PCC_op_fwd_7_2_o3;
wire				PCC_ip_fail_7_2_o3;
wire				PCC_ip_pack_7_2_o3;
wire				PCC_ip_suspend_7_2_o3;
wire				PCC_ip_cancel_7_2_o3;
//CLUSTER (Y,X)
//Y 一环中第几个节点
//X 第几环
PCC_3op	#(0,1,BUSW)	pcc0_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_0_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_15_1_o2),
	.PCC_ip_data_i2(PCC_op_data_1_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_0_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_15_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_1_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_0_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_15_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_1_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_0_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_15_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_1_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_0_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_15_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_1_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_0_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_15_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_1_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_0_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_15_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_1_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_0_1_o0),	
	.PCC_op_data_o1(PCC_op_data_0_1_o1),
	.PCC_op_data_o2(PCC_op_data_0_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_0_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_0_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_0_1_o2),

	.PCC_op_fwd_o0(PCC_op_fwd_0_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_0_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_0_1_o2),

	.PCC_ip_fail_o0(PCC_ip_fail_0_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_0_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_0_1_o2),

	.PCC_ip_pack_o0(PCC_ip_pack_0_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_0_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_0_1_o2),

	.PCC_ip_suspend_o0(PCC_ip_suspend_0_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_0_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_0_1_o2),

	.PCC_ip_cancel_o0(PCC_ip_cancel_0_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_0_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_0_1_o2)
	
);

PCC_3op	#(1,1,BUSW)	pcc1_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_1_1_i0),
	.PCC_ip_data_i1(PCC_op_data_0_1_o2),
	.PCC_ip_data_i2(PCC_op_data_2_1_o1),

	.PCC_ip_stb_i0(PCC_ip_stb_1_1_i0),
	.PCC_ip_stb_i1(PCC_op_stb_0_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_2_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_1_1_i0),
	.PCC_ip_fwd_i1(PCC_op_fwd_0_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_2_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_1_1_i0),
	.PCC_op_fail_i1(PCC_ip_fail_0_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_2_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_1_1_i0),
	.PCC_op_pack_i1(PCC_ip_pack_0_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_2_1_o1),

	
	.PCC_op_suspend_i0(PCC_op_suspend_1_1_i0),
	.PCC_op_suspend_i1(PCC_ip_suspend_0_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_2_1_o1),
	
	.PCC_op_cancel_i0(PCC_op_cancel_1_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_0_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_2_1_o1),

	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_1_1_o0),
	.PCC_op_data_o1(PCC_op_data_1_1_o1),
	.PCC_op_data_o2(PCC_op_data_1_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_1_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_1_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_1_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_1_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_1_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_1_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_1_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_1_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_1_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_1_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_1_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_1_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_1_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_1_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_1_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_1_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_1_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_1_1_o2)
	
);

//bridge(2,1)
PCC_4op	#(2,1,BUSW)	pcc2_1(

    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_2_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_1_1_o2),
	.PCC_ip_data_i2(PCC_op_data_3_1_o1),
	.PCC_ip_data_i3(PCC_op_data_1_2_o3),
	
	.PCC_ip_stb_i0(PCC_ip_stb_2_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_1_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_3_1_o1),
	.PCC_ip_stb_i3(PCC_op_stb_1_2_o3),

	
	.PCC_ip_fwd_i0(PCC_ip_fwd_2_1_i0),
	.PCC_ip_fwd_i1(PCC_op_fwd_1_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_3_1_o1),
	.PCC_ip_fwd_i3(PCC_op_fwd_1_2_o3),

	.PCC_op_fail_i0(PCC_op_fail_2_1_i0),
	.PCC_op_fail_i1(PCC_ip_fail_1_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_3_1_o1),
	.PCC_op_fail_i3(PCC_ip_fail_1_2_o3),

	.PCC_op_pack_i0(PCC_op_pack_2_1_i0),
	.PCC_op_pack_i1(PCC_ip_pack_1_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_3_1_o1),
	.PCC_op_pack_i3(PCC_ip_pack_1_2_o3),

	.PCC_op_suspend_i0(PCC_op_suspend_2_1_i0),
	.PCC_op_suspend_i1(PCC_ip_suspend_1_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_3_1_o1),
	.PCC_op_suspend_i3(PCC_ip_suspend_1_2_o3),

	.PCC_op_cancel_i0(PCC_op_cancel_2_1_i0),	
	.PCC_op_cancel_i1(PCC_ip_cancel_1_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_3_1_o1),
	.PCC_op_cancel_i3(PCC_ip_cancel_1_2_o3),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_2_1_o0),
	.PCC_op_data_o1(PCC_op_data_2_1_o1),
	.PCC_op_data_o2(PCC_op_data_2_1_o2),
	.PCC_op_data_o3(PCC_op_data_2_1_o3),

	.PCC_op_stb_o0(PCC_op_stb_2_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_2_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_2_1_o2),
	.PCC_op_stb_o3(PCC_op_stb_2_1_o3),

	.PCC_op_fwd_o0(PCC_op_fwd_2_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_2_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_2_1_o2),
	.PCC_op_fwd_o3(PCC_op_fwd_2_1_o3),

	.PCC_ip_fail_o0(PCC_ip_fail_2_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_2_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_2_1_o2),
	.PCC_ip_fail_o3(PCC_ip_fail_2_1_o3),

	.PCC_ip_pack_o0(PCC_ip_pack_2_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_2_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_2_1_o2),
	.PCC_ip_pack_o3(PCC_ip_pack_2_1_o3),

	.PCC_ip_suspend_o0(PCC_ip_suspend_2_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_2_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_2_1_o2),
	.PCC_ip_suspend_o3(PCC_ip_suspend_2_1_o3),

	.PCC_ip_cancel_o0(PCC_ip_cancel_2_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_2_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_2_1_o2),
	.PCC_ip_cancel_o3(PCC_ip_cancel_2_1_o3)

);

PCC_3op	#(3,1,BUSW)	pcc3_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_3_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_2_1_o2),
	.PCC_ip_data_i2(PCC_op_data_4_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_3_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_2_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_4_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_3_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_2_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_4_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_3_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_2_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_4_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_3_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_2_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_4_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_3_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_2_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_4_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_3_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_2_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_4_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_3_1_o0),
	.PCC_op_data_o1(PCC_op_data_3_1_o1),
	.PCC_op_data_o2(PCC_op_data_3_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_3_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_3_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_3_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_3_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_3_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_3_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_3_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_3_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_3_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_3_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_3_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_3_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_3_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_3_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_3_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_3_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_3_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_3_1_o2)
	
);

PCC_3op	#(4,1,BUSW)	pcc4_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_4_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_3_1_o2),
	.PCC_ip_data_i2(PCC_op_data_5_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_4_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_3_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_5_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_4_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_3_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_5_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_4_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_3_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_5_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_4_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_3_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_5_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_4_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_3_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_5_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_4_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_3_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_5_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_4_1_o0),
	.PCC_op_data_o1(PCC_op_data_4_1_o1),
	.PCC_op_data_o2(PCC_op_data_4_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_4_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_4_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_4_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_4_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_4_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_4_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_4_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_4_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_4_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_4_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_4_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_4_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_4_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_4_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_4_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_4_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_4_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_4_1_o2)
	
);

PCC_3op	#(5,1,BUSW)	pcc5_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_5_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_4_1_o2),
	.PCC_ip_data_i2(PCC_op_data_6_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_5_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_4_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_6_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_5_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_4_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_6_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_5_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_4_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_6_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_5_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_4_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_6_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_5_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_4_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_6_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_5_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_4_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_6_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_5_1_o0),
	.PCC_op_data_o1(PCC_op_data_5_1_o1),
	.PCC_op_data_o2(PCC_op_data_5_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_5_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_5_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_5_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_5_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_5_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_5_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_5_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_5_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_5_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_5_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_5_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_5_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_5_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_5_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_5_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_5_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_5_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_5_1_o2)
	
);

//bridge(6,1)
PCC_4op	#(6,1,BUSW)	pcc6_1(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_6_1_i0),
	.PCC_ip_data_i1(PCC_op_data_5_1_o2),
	.PCC_ip_data_i2(PCC_op_data_7_1_o1),
	.PCC_ip_data_i3(PCC_op_data_3_2_o3),

	.PCC_ip_stb_i0(PCC_ip_stb_6_1_i0),
	.PCC_ip_stb_i1(PCC_op_stb_5_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_7_1_o1),
	.PCC_ip_stb_i3(PCC_op_stb_3_2_o3),

	.PCC_ip_fwd_i0(PCC_ip_fwd_6_1_i0),
	.PCC_ip_fwd_i1(PCC_op_fwd_5_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_7_1_o1),
	.PCC_ip_fwd_i3(PCC_op_fwd_3_2_o3),

	.PCC_op_fail_i0(PCC_op_fail_6_1_i0),
	.PCC_op_fail_i1(PCC_ip_fail_5_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_7_1_o1),
	.PCC_op_fail_i3(PCC_ip_fail_3_2_o3),

	.PCC_op_pack_i0(PCC_op_pack_6_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_5_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_7_1_o1),
	.PCC_op_pack_i3(PCC_ip_pack_3_2_o3),

	.PCC_op_suspend_i0(PCC_op_suspend_6_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_5_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_7_1_o1),
	.PCC_op_suspend_i3(PCC_ip_suspend_3_2_o3),

	.PCC_op_cancel_i0(PCC_op_cancel_6_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_5_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_7_1_o1),
	.PCC_op_cancel_i3(PCC_ip_cancel_3_2_o3),

	//outputs
	.PCC_op_data_o0(PCC_op_data_6_1_o0),
	.PCC_op_data_o1(PCC_op_data_6_1_o1),
	.PCC_op_data_o2(PCC_op_data_6_1_o2),
	.PCC_op_data_o3(PCC_op_data_6_1_o3),

	.PCC_op_stb_o0(PCC_op_stb_6_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_6_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_6_1_o2),
	.PCC_op_stb_o3(PCC_op_stb_6_1_o3),

	.PCC_op_fwd_o0(PCC_op_fwd_6_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_6_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_6_1_o2),
	.PCC_op_fwd_o3(PCC_op_fwd_6_1_o3),

	.PCC_ip_fail_o0(PCC_ip_fail_6_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_6_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_6_1_o2),
	.PCC_ip_fail_o3(PCC_ip_fail_6_1_o3),

	.PCC_ip_pack_o0(PCC_ip_pack_6_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_6_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_6_1_o2),
	.PCC_ip_pack_o3(PCC_ip_pack_6_1_o3),

	.PCC_ip_suspend_o0(PCC_ip_suspend_6_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_6_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_6_1_o2),
	.PCC_ip_suspend_o3(PCC_ip_suspend_6_1_o3),

	.PCC_ip_cancel_o0(PCC_ip_cancel_6_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_6_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_6_1_o2),
	.PCC_ip_cancel_o3(PCC_ip_cancel_6_1_o3)
	
);

PCC_3op	#(7,1,BUSW)	pcc7_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_7_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_6_1_o2),
	.PCC_ip_data_i2(PCC_op_data_8_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_7_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_6_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_8_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_7_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_6_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_8_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_7_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_6_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_8_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_7_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_6_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_8_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_7_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_6_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_8_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_7_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_6_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_8_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_7_1_o0),
	.PCC_op_data_o1(PCC_op_data_7_1_o1),
	.PCC_op_data_o2(PCC_op_data_7_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_7_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_7_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_7_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_7_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_7_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_7_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_7_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_7_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_7_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_7_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_7_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_7_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_7_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_7_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_7_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_7_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_7_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_7_1_o2)
	
);

PCC_3op	#(8,1,BUSW)	pcc8_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_8_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_7_1_o2),
	.PCC_ip_data_i2(PCC_op_data_9_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_8_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_7_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_9_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_8_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_7_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_9_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_8_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_7_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_9_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_8_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_7_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_9_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_8_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_7_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_9_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_8_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_7_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_9_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_8_1_o0),
	.PCC_op_data_o1(PCC_op_data_8_1_o1),
	.PCC_op_data_o2(PCC_op_data_8_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_8_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_8_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_8_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_8_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_8_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_8_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_8_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_8_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_8_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_8_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_8_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_8_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_8_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_8_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_8_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_8_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_8_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_8_1_o2)
	
);

PCC_3op	#(9,1,BUSW)	pcc9_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_9_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_8_1_o2),
	.PCC_ip_data_i2(PCC_op_data_10_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_9_1_i0 ),	
	.PCC_ip_stb_i1(PCC_op_stb_8_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_10_1_o1 ),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_9_1_i0 ),	
	.PCC_ip_fwd_i1(PCC_op_fwd_8_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_10_1_o1 ),
	
	.PCC_op_fail_i0(PCC_op_fail_9_1_i0 ),	
	.PCC_op_fail_i1(PCC_ip_fail_8_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_10_1_o1 ),
	
	.PCC_op_pack_i0(PCC_op_pack_9_1_i0 ),	
	.PCC_op_pack_i1(PCC_ip_pack_8_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_10_1_o1 ),
	
	.PCC_op_suspend_i0(PCC_op_suspend_9_1_i0 ),	
	.PCC_op_suspend_i1(PCC_ip_suspend_8_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_10_1_o1 ),

	.PCC_op_cancel_i0(PCC_op_cancel_9_1_i0 ),
	.PCC_op_cancel_i1(PCC_ip_cancel_8_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_10_1_o1 ),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_9_1_o0),
	.PCC_op_data_o1(PCC_op_data_9_1_o1),
	.PCC_op_data_o2(PCC_op_data_9_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_9_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_9_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_9_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_9_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_9_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_9_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_9_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_9_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_9_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_9_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_9_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_9_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_9_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_9_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_9_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_9_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_9_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_9_1_o2)
	
);

//bridge(10,1)
PCC_4op	#(10,1,BUSW)	pcc10_1(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_10_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_9_1_o2),
	.PCC_ip_data_i2(PCC_op_data_11_1_o1 ),
	.PCC_ip_data_i3(PCC_op_data_5_2_o3 ),

	.PCC_ip_stb_i0(PCC_ip_stb_10_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_9_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_11_1_o1 ),
	.PCC_ip_stb_i3(PCC_op_stb_5_2_o3 ),

	.PCC_ip_fwd_i0(PCC_ip_fwd_10_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_9_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_11_1_o1 ),
	.PCC_ip_fwd_i3(PCC_op_fwd_5_2_o3 ),

	.PCC_op_fail_i0(PCC_op_fail_10_1_i0),
	.PCC_op_fail_i1(PCC_ip_fail_9_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_11_1_o1 ),
	.PCC_op_fail_i3(PCC_ip_fail_5_2_o3 ),

	.PCC_op_pack_i0(PCC_op_pack_10_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_9_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_11_1_o1 ),
	.PCC_op_pack_i3(PCC_ip_pack_5_2_o3 ),

	.PCC_op_suspend_i0(PCC_op_suspend_10_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_9_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_11_1_o1 ),
	.PCC_op_suspend_i3(PCC_ip_suspend_5_2_o3 ),

	.PCC_op_cancel_i0(PCC_op_cancel_10_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_9_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_11_1_o1 ),
	.PCC_op_cancel_i3(PCC_ip_cancel_5_2_o3 ),

	//outputs
	.PCC_op_data_o0(PCC_op_data_10_1_o0),
	.PCC_op_data_o1(PCC_op_data_10_1_o1),
	.PCC_op_data_o2(PCC_op_data_10_1_o2),
	.PCC_op_data_o3(PCC_op_data_10_1_o3),

	.PCC_op_stb_o0(PCC_op_stb_10_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_10_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_10_1_o2),
	.PCC_op_stb_o3(PCC_op_stb_10_1_o3),

	.PCC_op_fwd_o0(PCC_op_fwd_10_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_10_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_10_1_o2),
	.PCC_op_fwd_o3(PCC_op_fwd_10_1_o3),

	.PCC_ip_fail_o0(PCC_ip_fail_10_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_10_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_10_1_o2),
	.PCC_ip_fail_o3(PCC_ip_fail_10_1_o3),

	.PCC_ip_pack_o0(PCC_ip_pack_10_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_10_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_10_1_o2),
	.PCC_ip_pack_o3(PCC_ip_pack_10_1_o3),

	.PCC_ip_suspend_o0(PCC_ip_suspend_10_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_10_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_10_1_o2),
	.PCC_ip_suspend_o3(PCC_ip_suspend_10_1_o3),

	.PCC_ip_cancel_o0(PCC_ip_cancel_10_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_10_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_10_1_o2),
	.PCC_ip_cancel_o3(PCC_ip_cancel_10_1_o3)
	
);

PCC_3op	#(11,1,BUSW)	pcc11_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_11_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_10_1_o2),
	.PCC_ip_data_i2(PCC_op_data_12_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_11_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_10_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_12_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_11_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_10_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_12_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_11_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_10_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_12_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_11_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_10_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_12_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_11_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_10_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_12_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_11_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_10_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_12_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_11_1_o0),
	.PCC_op_data_o1(PCC_op_data_11_1_o1),
	.PCC_op_data_o2(PCC_op_data_11_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_11_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_11_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_11_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_11_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_11_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_11_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_11_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_11_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_11_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_11_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_11_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_11_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_11_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_11_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_11_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_11_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_11_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_11_1_o2)
	
);

PCC_3op	#(12,1,BUSW)	pcc12_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_12_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_11_1_o2),
	.PCC_ip_data_i2(PCC_op_data_13_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_12_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_11_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_13_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_12_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_11_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_13_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_12_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_11_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_13_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_12_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_11_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_13_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_12_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_11_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_13_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_12_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_11_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_13_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_12_1_o0),
	.PCC_op_data_o1(PCC_op_data_12_1_o1),
	.PCC_op_data_o2(PCC_op_data_12_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_12_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_12_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_12_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_12_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_12_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_12_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_12_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_12_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_12_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_12_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_12_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_12_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_12_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_12_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_12_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_12_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_12_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_12_1_o2)
	
);

PCC_3op	#(13,1,BUSW)	pcc13_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_13_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_12_1_o2),
	.PCC_ip_data_i2(PCC_op_data_14_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_13_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_12_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_14_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_13_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_12_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_14_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_13_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_12_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_14_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_13_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_12_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_14_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_13_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_12_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_14_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_13_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_12_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_14_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_13_1_o0),
	.PCC_op_data_o1(PCC_op_data_13_1_o1),
	.PCC_op_data_o2(PCC_op_data_13_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_13_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_13_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_13_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_13_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_13_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_13_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_13_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_13_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_13_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_13_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_13_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_13_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_13_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_13_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_13_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_13_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_13_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_13_1_o2)
	
);

//bridge(14,1)
PCC_4op	#(14,1,BUSW)	pcc14_1(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_14_1_i0),
	.PCC_ip_data_i1(PCC_op_data_13_1_o2),
	.PCC_ip_data_i2(PCC_op_data_15_1_o1),
	.PCC_ip_data_i3(PCC_op_data_7_2_o3 ),

	.PCC_ip_stb_i0(PCC_ip_stb_14_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_13_1_o2),
	.PCC_ip_stb_i2(PCC_op_stb_15_1_o1),
	.PCC_ip_stb_i3(PCC_op_stb_7_2_o3 ),

	.PCC_ip_fwd_i0(PCC_ip_fwd_14_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_13_1_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_15_1_o1),
	.PCC_ip_fwd_i3(PCC_op_fwd_7_2_o3 ),

	.PCC_op_fail_i0(PCC_op_fail_14_1_i0),
	.PCC_op_fail_i1(PCC_ip_fail_13_1_o2),
	.PCC_op_fail_i2(PCC_ip_fail_15_1_o1),
	.PCC_op_fail_i3(PCC_ip_fail_7_2_o3 ),

	.PCC_op_pack_i0(PCC_op_pack_14_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_13_1_o2),
	.PCC_op_pack_i2(PCC_ip_pack_15_1_o1),
	.PCC_op_pack_i3(PCC_ip_pack_7_2_o3 ),

	.PCC_op_suspend_i0(PCC_op_suspend_14_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_13_1_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_15_1_o1),
	.PCC_op_suspend_i3(PCC_ip_suspend_7_2_o3 ),

	.PCC_op_cancel_i0(PCC_op_cancel_14_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_13_1_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_15_1_o1),
	.PCC_op_cancel_i3(PCC_ip_cancel_7_2_o3 ),

	//outputs
	.PCC_op_data_o0(PCC_op_data_14_1_o0),
	.PCC_op_data_o1(PCC_op_data_14_1_o1),
	.PCC_op_data_o2(PCC_op_data_14_1_o2),
	.PCC_op_data_o3(PCC_op_data_14_1_o3),

	.PCC_op_stb_o0(PCC_op_stb_14_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_14_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_14_1_o2),
	.PCC_op_stb_o3(PCC_op_stb_14_1_o3),

	.PCC_op_fwd_o0(PCC_op_fwd_14_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_14_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_14_1_o2),
	.PCC_op_fwd_o3(PCC_op_fwd_14_1_o3),

	.PCC_ip_fail_o0(PCC_ip_fail_14_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_14_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_14_1_o2),
	.PCC_ip_fail_o3(PCC_ip_fail_14_1_o3),

	.PCC_ip_pack_o0(PCC_ip_pack_14_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_14_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_14_1_o2),
	.PCC_ip_pack_o3(PCC_ip_pack_14_1_o3),

	.PCC_ip_suspend_o0(PCC_ip_suspend_14_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_14_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_14_1_o2),
	.PCC_ip_suspend_o3(PCC_ip_suspend_14_1_o3),

	.PCC_ip_cancel_o0(PCC_ip_cancel_14_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_14_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_14_1_o2),
	.PCC_ip_cancel_o3(PCC_ip_cancel_14_1_o3)
	
);

PCC_3op	#(15,1,BUSW)	pcc15_1(
	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_15_1_i0),	
	.PCC_ip_data_i1(PCC_op_data_14_1_o2 ),
	.PCC_ip_data_i2(PCC_op_data_0_1_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_15_1_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_14_1_o2 ),
	.PCC_ip_stb_i2(PCC_op_stb_0_1_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_15_1_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_14_1_o2 ),
	.PCC_ip_fwd_i2(PCC_op_fwd_0_1_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_15_1_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_14_1_o2 ),
	.PCC_op_fail_i2(PCC_ip_fail_0_1_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_15_1_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_14_1_o2 ),
	.PCC_op_pack_i2(PCC_ip_pack_0_1_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_15_1_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_14_1_o2 ),
	.PCC_op_suspend_i2(PCC_ip_suspend_0_1_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_15_1_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_14_1_o2 ),
	.PCC_op_cancel_i2(PCC_ip_cancel_0_1_o1),
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_15_1_o0),
	.PCC_op_data_o1(PCC_op_data_15_1_o1),
	.PCC_op_data_o2(PCC_op_data_15_1_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_15_1_o0),
	.PCC_op_stb_o1(PCC_op_stb_15_1_o1),
	.PCC_op_stb_o2(PCC_op_stb_15_1_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_15_1_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_15_1_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_15_1_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_15_1_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_15_1_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_15_1_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_15_1_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_15_1_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_15_1_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_15_1_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_15_1_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_15_1_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_15_1_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_15_1_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_15_1_o2)
	
);

PCC_3op	#(0,2,BUSW)	pcc0_2(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_0_2_i0),
	.PCC_ip_data_i1(PCC_op_data_7_2_o2),
	.PCC_ip_data_i2(PCC_op_data_1_2_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_0_2_i0),
	.PCC_ip_stb_i1(PCC_op_stb_7_2_o2),
	.PCC_ip_stb_i2(PCC_op_stb_1_2_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_0_2_i0),
	.PCC_ip_fwd_i1(PCC_op_fwd_7_2_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_1_2_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_0_2_i0),
	.PCC_op_fail_i1(PCC_ip_fail_7_2_o2),
	.PCC_op_fail_i2(PCC_ip_fail_1_2_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_0_2_i0),
	.PCC_op_pack_i1(PCC_ip_pack_7_2_o2),
	.PCC_op_pack_i2(PCC_ip_pack_1_2_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_0_2_i0),
	.PCC_op_suspend_i1(PCC_ip_suspend_7_2_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_1_2_o1),
	
	.PCC_op_cancel_i0(PCC_op_cancel_0_2_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_7_2_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_1_2_o1),
	
	//outputs
	.PCC_op_data_o0(PCC_op_data_0_2_o0),
	.PCC_op_data_o1(PCC_op_data_0_2_o1),
	.PCC_op_data_o2(PCC_op_data_0_2_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_0_2_o0),
	.PCC_op_stb_o1(PCC_op_stb_0_2_o1),
	.PCC_op_stb_o2(PCC_op_stb_0_2_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_0_2_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_0_2_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_0_2_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_0_2_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_0_2_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_0_2_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_0_2_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_0_2_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_0_2_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_0_2_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_0_2_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_0_2_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_0_2_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_0_2_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_0_2_o2)
	
);

//bridge(1,2)
PCC_4op	#(1,2,BUSW)	pcc1_2(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_1_2_i0),
	.PCC_ip_data_i1(PCC_op_data_0_2_o2),
	.PCC_ip_data_i2(PCC_op_data_2_2_o1),
	.PCC_ip_data_i3(PCC_op_data_2_1_o3),

	.PCC_ip_stb_i0(PCC_ip_stb_1_2_i0),
	.PCC_ip_stb_i1(PCC_op_stb_0_2_o2),
	.PCC_ip_stb_i2(PCC_op_stb_2_2_o1),
	.PCC_ip_stb_i3(PCC_op_stb_2_1_o3),

	.PCC_ip_fwd_i0(PCC_ip_fwd_1_2_i0),
	.PCC_ip_fwd_i1(PCC_op_fwd_0_2_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_2_2_o1),
	.PCC_ip_fwd_i3(PCC_op_fwd_2_1_o3),

	.PCC_op_fail_i0(PCC_op_fail_1_2_i0),
	.PCC_op_fail_i1(PCC_ip_fail_0_2_o2),
	.PCC_op_fail_i2(PCC_ip_fail_2_2_o1),
	.PCC_op_fail_i3(PCC_ip_fail_2_1_o3),

	.PCC_op_pack_i0(PCC_op_pack_1_2_i0),
	.PCC_op_pack_i1(PCC_ip_pack_0_2_o2),
	.PCC_op_pack_i2(PCC_ip_pack_2_2_o1),
	.PCC_op_pack_i3(PCC_ip_pack_2_1_o3),

	.PCC_op_suspend_i0(PCC_op_suspend_1_2_i0),
	.PCC_op_suspend_i1(PCC_ip_suspend_0_2_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_2_2_o1),
	.PCC_op_suspend_i3(PCC_ip_suspend_2_1_o3),

	.PCC_op_cancel_i0(PCC_op_cancel_1_2_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_0_2_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_2_2_o1),
	.PCC_op_cancel_i3(PCC_ip_cancel_2_1_o3),

	//outputs
	.PCC_op_data_o0(PCC_op_data_1_2_o0),
	.PCC_op_data_o1(PCC_op_data_1_2_o1),
	.PCC_op_data_o2(PCC_op_data_1_2_o2),
	.PCC_op_data_o3(PCC_op_data_1_2_o3),

	.PCC_op_stb_o0(PCC_op_stb_1_2_o0),
	.PCC_op_stb_o1(PCC_op_stb_1_2_o1),
	.PCC_op_stb_o2(PCC_op_stb_1_2_o2),
	.PCC_op_stb_o3(PCC_op_stb_1_2_o3),

	.PCC_op_fwd_o0(PCC_op_fwd_1_2_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_1_2_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_1_2_o2),
	.PCC_op_fwd_o3(PCC_op_fwd_1_2_o3),

	.PCC_ip_fail_o0(PCC_ip_fail_1_2_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_1_2_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_1_2_o2),
	.PCC_ip_fail_o3(PCC_ip_fail_1_2_o3),

	.PCC_ip_pack_o0(PCC_ip_pack_1_2_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_1_2_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_1_2_o2),
	.PCC_ip_pack_o3(PCC_ip_pack_1_2_o3),

	.PCC_ip_suspend_o0(PCC_ip_suspend_1_2_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_1_2_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_1_2_o2),
	.PCC_ip_suspend_o3(PCC_ip_suspend_1_2_o3),

	.PCC_ip_cancel_o0(PCC_ip_cancel_1_2_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_1_2_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_1_2_o2),
	.PCC_ip_cancel_o3(PCC_ip_cancel_1_2_o3)
	
);

PCC_3op	#(2,2,BUSW)	pcc2_2(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_2_2_i0),
	.PCC_ip_data_i1(PCC_op_data_1_2_o2),
	.PCC_ip_data_i2(PCC_op_data_3_2_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_2_2_i0),
	.PCC_ip_stb_i1(PCC_op_stb_1_2_o2),
	.PCC_ip_stb_i2(PCC_op_stb_3_2_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_2_2_i0),
	.PCC_ip_fwd_i1(PCC_op_fwd_1_2_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_3_2_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_2_2_i0),
	.PCC_op_fail_i1(PCC_ip_fail_1_2_o2),
	.PCC_op_fail_i2(PCC_ip_fail_3_2_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_2_2_i0),
	.PCC_op_pack_i1(PCC_ip_pack_1_2_o2),
	.PCC_op_pack_i2(PCC_ip_pack_3_2_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_2_2_i0),
	.PCC_op_suspend_i1(PCC_ip_suspend_1_2_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_3_2_o1),
	
	.PCC_op_cancel_i0(PCC_op_cancel_2_2_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_1_2_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_3_2_o1),
	
	//outputs
	.PCC_op_data_o0(PCC_op_data_2_2_o0),
	.PCC_op_data_o1(PCC_op_data_2_2_o1),
	.PCC_op_data_o2(PCC_op_data_2_2_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_2_2_o0),
	.PCC_op_stb_o1(PCC_op_stb_2_2_o1),
	.PCC_op_stb_o2(PCC_op_stb_2_2_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_2_2_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_2_2_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_2_2_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_2_2_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_2_2_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_2_2_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_2_2_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_2_2_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_2_2_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_2_2_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_2_2_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_2_2_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_2_2_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_2_2_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_2_2_o2)
	
);

//bridge(3,2)
PCC_4op	#(3,2,BUSW)	pcc3_2(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_3_2_i0),
	.PCC_ip_data_i1(PCC_op_data_2_2_o2),
	.PCC_ip_data_i2(PCC_op_data_4_2_o1),
	.PCC_ip_data_i3(PCC_op_data_6_1_o3),

	.PCC_ip_stb_i0(PCC_ip_stb_3_2_i0),
	.PCC_ip_stb_i1(PCC_op_stb_2_2_o2),
	.PCC_ip_stb_i2(PCC_op_stb_4_2_o1),
	.PCC_ip_stb_i3(PCC_op_stb_6_1_o3),

	.PCC_ip_fwd_i0(PCC_ip_fwd_3_2_i0),
	.PCC_ip_fwd_i1(PCC_op_fwd_2_2_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_4_2_o1),
	.PCC_ip_fwd_i3(PCC_op_fwd_6_1_o3),

	.PCC_op_fail_i0(PCC_op_fail_3_2_i0),
	.PCC_op_fail_i1(PCC_ip_fail_2_2_o2),
	.PCC_op_fail_i2(PCC_ip_fail_4_2_o1),
	.PCC_op_fail_i3(PCC_ip_fail_6_1_o3),

	.PCC_op_pack_i0(PCC_op_pack_3_2_i0),
	.PCC_op_pack_i1(PCC_ip_pack_2_2_o2),
	.PCC_op_pack_i2(PCC_ip_pack_4_2_o1),
	.PCC_op_pack_i3(PCC_ip_pack_6_1_o3),

	.PCC_op_suspend_i0(PCC_op_suspend_3_2_i0),
	.PCC_op_suspend_i1(PCC_ip_suspend_2_2_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_4_2_o1),
	.PCC_op_suspend_i3(PCC_ip_suspend_6_1_o3),

	.PCC_op_cancel_i0(PCC_op_cancel_3_2_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_2_2_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_4_2_o1),
	.PCC_op_cancel_i3(PCC_ip_cancel_6_1_o3),

	//outputs
	.PCC_op_data_o0(PCC_op_data_3_2_o0),
	.PCC_op_data_o1(PCC_op_data_3_2_o1),
	.PCC_op_data_o2(PCC_op_data_3_2_o2),
	.PCC_op_data_o3(PCC_op_data_3_2_o3),

	.PCC_op_stb_o0(PCC_op_stb_3_2_o0),
	.PCC_op_stb_o1(PCC_op_stb_3_2_o1),
	.PCC_op_stb_o2(PCC_op_stb_3_2_o2),
	.PCC_op_stb_o3(PCC_op_stb_3_2_o3),

	.PCC_op_fwd_o0(PCC_op_fwd_3_2_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_3_2_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_3_2_o2),
	.PCC_op_fwd_o3(PCC_op_fwd_3_2_03),

	.PCC_ip_fail_o0(PCC_ip_fail_3_2_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_3_2_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_3_2_o2),
	.PCC_ip_fail_o3(PCC_ip_fail_3_2_o3),

	.PCC_ip_pack_o0(PCC_ip_pack_3_2_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_3_2_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_3_2_o2),
	.PCC_ip_pack_o3(PCC_ip_pack_3_2_o3),

	.PCC_ip_suspend_o0(PCC_ip_suspend_3_2_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_3_2_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_3_2_o2),
	.PCC_ip_suspend_o3(PCC_ip_suspend_3_2_o3),

	.PCC_ip_cancel_o0(PCC_ip_cancel_3_2_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_3_2_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_3_2_o2),
	.PCC_ip_cancel_o3(PCC_op_cancel_3_2_o3)
	
);

PCC_3op	#(4,2,BUSW)	pcc4_2(

	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_4_2_i0),	
	.PCC_ip_data_i1(PCC_op_data_3_2_o2),
	.PCC_ip_data_i2(PCC_op_data_5_2_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_4_2_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_3_2_o2),
	.PCC_ip_stb_i2(PCC_op_stb_5_2_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_4_2_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_3_2_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_5_2_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_4_2_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_3_2_o2),
	.PCC_op_fail_i2(PCC_ip_fail_5_2_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_4_2_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_3_2_o2),
	.PCC_op_pack_i2(PCC_ip_pack_5_2_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_4_2_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_3_2_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_5_2_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_4_2_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_3_2_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_5_2_o1),
	
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_4_2_o0),
	.PCC_op_data_o1(PCC_op_data_4_2_o1),
	.PCC_op_data_o2(PCC_op_data_4_2_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_4_2_o0),
	.PCC_op_stb_o1(PCC_op_stb_4_2_o1),
	.PCC_op_stb_o2(PCC_op_stb_4_2_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_4_2_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_4_2_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_4_2_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_4_2_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_4_2_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_4_2_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_4_2_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_4_2_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_4_2_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_4_2_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_4_2_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_4_2_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_4_2_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_4_2_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_4_2_o2)
	
);

//bridge(5,2)
PCC_4op	#(5,2,BUSW)	pcc5_2(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_5_2_i0 ),
	.PCC_ip_data_i1(PCC_op_data_4_2_o2 ),
	.PCC_ip_data_i2(PCC_op_data_6_2_o1 ),
	.PCC_ip_data_i3(PCC_op_data_10_1_o3),

	.PCC_ip_stb_i0(PCC_ip_stb_5_2_i0 ),
	.PCC_ip_stb_i1(PCC_op_stb_4_2_o2 ),
	.PCC_ip_stb_i2(PCC_op_stb_6_2_o1 ),
	.PCC_ip_stb_i3(PCC_op_stb_10_1_o3),

	.PCC_ip_fwd_i0(PCC_ip_fwd_5_2_i0 ),
	.PCC_ip_fwd_i1(PCC_op_fwd_4_2_o2 ),
	.PCC_ip_fwd_i2(PCC_op_fwd_6_2_o1 ),
	.PCC_ip_fwd_i3(PCC_op_fwd_10_1_o3),

	.PCC_op_fail_i0(PCC_op_fail_5_2_i0 ),
	.PCC_op_fail_i1(PCC_ip_fail_4_2_o2 ),
	.PCC_op_fail_i2(PCC_ip_fail_6_2_o1 ),
	.PCC_op_fail_i3(PCC_ip_fail_10_1_o3),

	.PCC_op_pack_i0(PCC_op_pack_5_2_i0 ),
	.PCC_op_pack_i1(PCC_ip_pack_4_2_o2 ),
	.PCC_op_pack_i2(PCC_ip_pack_6_2_o1 ),
	.PCC_op_pack_i3(PCC_ip_pack_10_1_o3),

	.PCC_op_suspend_i0(PCC_op_suspend_5_2_i0 ),
	.PCC_op_suspend_i1(PCC_ip_suspend_4_2_o2 ),
	.PCC_op_suspend_i2(PCC_ip_suspend_6_2_o1 ),
	.PCC_op_suspend_i3(PCC_ip_suspend_10_1_o3),

	.PCC_op_cancel_i0(PCC_op_cancel_5_2_i0 ),
	.PCC_op_cancel_i1(PCC_ip_cancel_4_2_o2 ),
	.PCC_op_cancel_i2(PCC_ip_cancel_6_2_o1 ),
	.PCC_op_cancel_i3(PCC_ip_cancel_10_1_o3),

	//outputs
	.PCC_op_data_o0(PCC_op_data_5_2_o0),
	.PCC_op_data_o1(PCC_op_data_5_2_o1),
	.PCC_op_data_o2(PCC_op_data_5_2_o2),
	.PCC_op_data_o3(PCC_op_data_5_2_o3),

	.PCC_op_stb_o0(PCC_op_stb_5_2_o0),
	.PCC_op_stb_o1(PCC_op_stb_5_2_o1),
	.PCC_op_stb_o2(PCC_op_stb_5_2_o2),
	.PCC_op_stb_o3(PCC_op_stb_5_2_o3),

	.PCC_op_fwd_o0(PCC_op_fwd_5_2_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_5_2_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_5_2_o2),
	.PCC_op_fwd_o3(PCC_op_fwd_5_2_o3),

	.PCC_ip_fail_o0(PCC_ip_fail_5_2_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_5_2_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_5_2_o2),
	.PCC_ip_fail_o3(PCC_ip_fail_5_2_o3),

	.PCC_ip_pack_o0(PCC_ip_pack_5_2_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_5_2_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_5_2_o2),
	.PCC_ip_pack_o3(PCC_ip_pack_5_2_o3),

	.PCC_ip_suspend_o0(PCC_ip_suspend_5_2_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_5_2_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_5_2_o2),
	.PCC_ip_suspend_o3(PCC_ip_suspend_5_2_o3),

	.PCC_ip_cancel_o0(PCC_ip_cancel_5_2_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_5_2_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_5_2_o2),
	.PCC_ip_cancel_o3(PCC_ip_cancel_5_2_o3)
	
);

PCC_3op	#(6,2,BUSW)	pcc6_2(

	//INPUT
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_6_2_i0),	
	.PCC_ip_data_i1(PCC_op_data_5_2_o2),
	.PCC_ip_data_i2(PCC_op_data_7_2_o1),
	
	.PCC_ip_stb_i0(PCC_ip_stb_6_2_i0),	
	.PCC_ip_stb_i1(PCC_op_stb_5_2_o2),
	.PCC_ip_stb_i2(PCC_op_stb_7_2_o1),
	
	.PCC_ip_fwd_i0(PCC_ip_fwd_6_2_i0),	
	.PCC_ip_fwd_i1(PCC_op_fwd_5_2_o2),
	.PCC_ip_fwd_i2(PCC_op_fwd_7_2_o1),
	
	.PCC_op_fail_i0(PCC_op_fail_6_2_i0),	
	.PCC_op_fail_i1(PCC_ip_fail_5_2_o2),
	.PCC_op_fail_i2(PCC_ip_fail_7_2_o1),
	
	.PCC_op_pack_i0(PCC_op_pack_6_2_i0),	
	.PCC_op_pack_i1(PCC_ip_pack_5_2_o2),
	.PCC_op_pack_i2(PCC_ip_pack_7_2_o1),
	
	.PCC_op_suspend_i0(PCC_op_suspend_6_2_i0),	
	.PCC_op_suspend_i1(PCC_ip_suspend_5_2_o2),
	.PCC_op_suspend_i2(PCC_ip_suspend_7_2_o1),

	.PCC_op_cancel_i0(PCC_op_cancel_6_2_i0),
	.PCC_op_cancel_i1(PCC_ip_cancel_5_2_o2),
	.PCC_op_cancel_i2(PCC_ip_cancel_7_2_o1),
	
	//OUTPUT
	.PCC_op_data_o0(PCC_op_data_6_2_o0),
	.PCC_op_data_o1(PCC_op_data_6_2_o1),
	.PCC_op_data_o2(PCC_op_data_6_2_o2),
	
	.PCC_op_stb_o0(PCC_op_stb_6_2_o0),
	.PCC_op_stb_o1(PCC_op_stb_6_2_o1),
	.PCC_op_stb_o2(PCC_op_stb_6_2_o2),
	
	.PCC_op_fwd_o0(PCC_op_fwd_6_2_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_6_2_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_6_2_o2),
	
	.PCC_ip_fail_o0(PCC_ip_fail_6_2_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_6_2_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_6_2_o2),
	
	.PCC_ip_pack_o0(PCC_ip_pack_6_2_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_6_2_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_6_2_o2),
	
	.PCC_ip_suspend_o0(PCC_ip_suspend_6_2_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_6_2_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_6_2_o2),
	
	.PCC_ip_cancel_o0(PCC_ip_cancel_6_2_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_6_2_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_6_2_o2)
	
);

//bridge(7,2)
PCC_4op	#(7,2,BUSW)	pcc7_2(

	//inputs
    .clk(clk), 
    .reset(!reset_n), 
	.PCC_ip_data_i0(PCC_ip_data_7_2_i0 ),
	.PCC_ip_data_i1(PCC_op_data_6_2_o2 ),
	.PCC_ip_data_i2(PCC_op_data_0_2_o1 ),
	.PCC_ip_data_i3(PCC_op_data_14_1_o3),

	.PCC_ip_stb_i0(PCC_ip_stb_7_2_i0 ),
	.PCC_ip_stb_i1(PCC_op_stb_6_2_o2 ),
	.PCC_ip_stb_i2(PCC_op_stb_0_2_o1 ),
	.PCC_ip_stb_i3(PCC_op_stb_14_1_o3),

	.PCC_ip_fwd_i0(PCC_ip_fwd_7_2_i0 ),
	.PCC_ip_fwd_i1(PCC_op_fwd_6_2_o2 ),
	.PCC_ip_fwd_i2(PCC_op_fwd_0_2_o1 ),
	.PCC_ip_fwd_i3(PCC_op_fwd_14_1_o3),

	.PCC_op_fail_i0(PCC_op_fail_7_2_i0 ),
	.PCC_op_fail_i1(PCC_ip_fail_6_2_o2 ),
	.PCC_op_fail_i2(PCC_ip_fail_0_2_o1 ),
	.PCC_op_fail_i3(PCC_ip_fail_14_1_o3),

	.PCC_op_pack_i0(PCC_op_pack_7_2_i0 ),
	.PCC_op_pack_i1(PCC_ip_pack_6_2_o2 ),
	.PCC_op_pack_i2(PCC_ip_pack_0_2_o1 ),
	.PCC_op_pack_i3(PCC_ip_pack_14_1_o3),

	.PCC_op_suspend_i0(PCC_op_suspend_7_2_i0 ),
	.PCC_op_suspend_i1(PCC_ip_suspend_6_2_o2 ),
	.PCC_op_suspend_i2(PCC_ip_suspend_0_2_o1 ),
	.PCC_op_suspend_i3(PCC_ip_suspend_14_1_o3),

	.PCC_op_cancel_i0(PCC_op_cancel_7_2_i0 ),
	.PCC_op_cancel_i1(PCC_ip_cancel_6_2_o2 ),
	.PCC_op_cancel_i2(PCC_ip_cancel_0_2_o1 ),
	.PCC_op_cancel_i3(PCC_ip_cancel_14_1_o3),

	//outputs
	.PCC_op_data_o0(PCC_op_data_7_2_o0),
	.PCC_op_data_o1(PCC_op_data_7_2_o1),
	.PCC_op_data_o2(PCC_op_data_7_2_o2),
	.PCC_op_data_o3(PCC_op_data_7_2_o3),

	.PCC_op_stb_o0(PCC_op_stb_7_2_o0),
	.PCC_op_stb_o1(PCC_op_stb_7_2_o1),
	.PCC_op_stb_o2(PCC_op_stb_7_2_o2),
	.PCC_op_stb_o3(PCC_op_stb_7_2_o3),

	.PCC_op_fwd_o0(PCC_op_fwd_7_2_o0),
	.PCC_op_fwd_o1(PCC_op_fwd_7_2_o1),
	.PCC_op_fwd_o2(PCC_op_fwd_7_2_o2),
	.PCC_op_fwd_o3(PCC_op_fwd_7_2_o3),

	.PCC_ip_fail_o0(PCC_ip_fail_7_2_o0),
	.PCC_ip_fail_o1(PCC_ip_fail_7_2_o1),
	.PCC_ip_fail_o2(PCC_ip_fail_7_2_o2),
	.PCC_ip_fail_o3(PCC_ip_fail_7_2_o3),

	.PCC_ip_pack_o0(PCC_ip_pack_7_2_o0),
	.PCC_ip_pack_o1(PCC_ip_pack_7_2_o1),
	.PCC_ip_pack_o2(PCC_ip_pack_7_2_o2),
	.PCC_ip_pack_o3(PCC_ip_pack_7_2_o3),

	.PCC_ip_suspend_o0(PCC_ip_suspend_7_2_o0),
	.PCC_ip_suspend_o1(PCC_ip_suspend_7_2_o1),
	.PCC_ip_suspend_o2(PCC_ip_suspend_7_2_o2),
	.PCC_ip_suspend_o3(PCC_ip_suspend_7_2_o3),

	.PCC_ip_cancel_o0(PCC_ip_cancel_7_2_o0),
	.PCC_ip_cancel_o1(PCC_ip_cancel_7_2_o1),
	.PCC_ip_cancel_o2(PCC_ip_cancel_7_2_o2),
	.PCC_ip_cancel_o3(PCC_ip_cancel_7_2_o3)
	
);


//recdata
RecData RecData_0_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_0_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_0_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_0_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_0_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_0_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_0_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_0_1_i0)
    );	

RecData RecData_1_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_1_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_1_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_1_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_1_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_1_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_1_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_1_1_i0)
    );
			
RecData RecData_2_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_2_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_2_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_2_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_2_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_2_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_2_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_2_1_i0)
    );	

RecData RecData_3_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_3_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_3_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_3_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_3_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_3_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_3_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_3_1_i0)
    );	
	
RecData RecData_4_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_4_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_4_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_4_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_4_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_4_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_4_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_4_1_i0)
    );

RecData RecData_5_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_5_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_5_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_5_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_5_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_5_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_5_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_5_1_i0)
    );	
		
RecData RecData_6_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_6_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_6_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_6_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_6_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_6_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_6_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_6_1_i0)
    );	

RecData RecData_7_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_7_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_7_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_7_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_7_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_7_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_7_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_7_1_i0)
    );	
	
RecData RecData_8_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_8_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_8_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_8_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_8_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_8_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_8_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_8_1_i0)
    );
	
RecData RecData_9_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_9_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_9_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_9_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_9_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_9_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_9_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_9_1_i0)
    );
	
RecData RecData_10_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_10_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_10_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_10_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_10_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_10_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_10_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_10_1_i0)
    );	

RecData RecData_11_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_11_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_11_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_11_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_11_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_11_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_11_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_11_1_i0)
    );	
	
RecData RecData_12_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_12_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_12_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_12_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_12_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_12_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_12_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_12_1_i0)
    );

RecData RecData_13_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_13_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_13_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_13_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_13_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_13_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_13_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_13_1_i0)
    );	
		
RecData RecData_14_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_14_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_14_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_14_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_14_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_14_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_14_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_14_1_i0)
    );	
	
RecData RecData_15_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_15_1_o0), 
    .PCC_ip_stb_i(PCC_op_stb_15_1_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_15_1_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_15_1_i0),
    .PCC_ip_pack_o(PCC_op_pack_15_1_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_15_1_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_15_1_i0)
    );	

RecData RecData_0_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_0_2_o0), 
    .PCC_ip_stb_i(PCC_op_stb_0_2_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_0_2_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_0_2_i0),
    .PCC_ip_pack_o(PCC_op_pack_0_2_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_0_2_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_0_2_i0)
    );	
			
RecData RecData_1_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_1_2_o0), 
    .PCC_ip_stb_i(PCC_op_stb_1_2_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_1_2_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_1_2_i0),
    .PCC_ip_pack_o(PCC_op_pack_1_2_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_1_2_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_1_2_i0)
    );	

RecData RecData_2_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_2_2_o0), 
    .PCC_ip_stb_i(PCC_op_stb_2_2_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_2_2_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_2_2_i0),
    .PCC_ip_pack_o(PCC_op_pack_2_2_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_2_2_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_2_2_i0)
    );	
	
RecData RecData_3_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_3_2_o0), 
    .PCC_ip_stb_i(PCC_op_stb_3_2_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_3_2_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_3_2_i0),
    .PCC_ip_pack_o(PCC_op_pack_3_2_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_3_2_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_3_2_i0)
    );

RecData RecData_4_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_4_2_o0), 
    .PCC_ip_stb_i(PCC_op_stb_4_2_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_4_2_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_4_2_i0),
    .PCC_ip_pack_o(PCC_op_pack_4_2_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_4_2_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_4_2_i0)
    );	
		
RecData RecData_5_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_5_2_o0), 
    .PCC_ip_stb_i(PCC_op_stb_5_2_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_5_2_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_5_2_i0),
    .PCC_ip_pack_o(PCC_op_pack_5_2_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_5_2_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_5_2_i0)
    );	

RecData RecData_6_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_6_2_o0), 
    .PCC_ip_stb_i(PCC_op_stb_6_2_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_6_2_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_6_2_i0),
    .PCC_ip_pack_o(PCC_op_pack_6_2_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_6_2_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_6_2_i0)
    );	
	
RecData RecData_7_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_ip_data_i(PCC_op_data_7_2_o0), 
    .PCC_ip_stb_i(PCC_op_stb_7_2_o0), 
    .PCC_ip_fwd_i(PCC_op_fwd_7_2_o0),
	
    .PCC_ip_fail_o(PCC_op_fail_7_2_i0),
    .PCC_ip_pack_o(PCC_op_pack_7_2_i0),
	.PCC_ip_suspend_o(PCC_op_suspend_7_2_i0),
	.PCC_ip_cancel_o(PCC_op_cancel_7_2_i0)
    );

	

//SendData Part

//flow1
SendData #(8'd5,6'd10,12'd128,200,1,8'd1,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h22,8'h01)SendData_f1_0_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_op_data_o(PCC_ip_data_0_1_i0), 
    .PCC_op_stb_o(PCC_ip_stb_0_1_i0), 
    .PCC_op_fwd_o(PCC_ip_fwd_0_1_i0), 

    .PCC_op_fail_i(PCC_ip_fail_0_1_o0), 
    .PCC_op_pack_i(PCC_ip_pack_0_1_o0), 
    .PCC_op_suspend_i(PCC_ip_suspend_0_1_o0), 
    .PCC_op_cancel_i(PCC_ip_cancel_0_1_o0)

    );
/*
//flow2
SendData #(8'd5,6'd10,12'd128,200,1,8'd1,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'hF1,8'h41)SendData_f2_3_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_op_data_o(PCC_ip_data_4_1_i0), 
    .PCC_op_stb_o(PCC_ip_stb_4_1_i0), 
    .PCC_op_fwd_o(PCC_ip_fwd_4_1_i0), 
     
    .PCC_op_fail_i(PCC_ip_fail_4_1_o0), 
    .PCC_op_pack_i(PCC_ip_pack_4_1_o0), 
    .PCC_op_suspend_i(PCC_ip_suspend_4_1_o0), 
    .PCC_op_cancel_i(PCC_ip_cancel_4_1_o0)

	
    ); 

//flow3
SendData #(8'd5,6'd10,12'd100,200,1,8'd1,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h31,8'hF1)SendData_f3_15_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_op_data_o(PCC_ip_data_15_1_i0), 
    .PCC_op_stb_o(PCC_ip_stb_15_1_i0), 
    .PCC_op_fwd_o(PCC_ip_fwd_15_1_i0), 

	//.en(PCC_2_3_en),
    .PCC_op_fail_i(PCC_ip_fail_15_1_o0), 
    .PCC_op_pack_i(PCC_ip_pack_15_1_o0), 
    .PCC_op_suspend_i(PCC_ip_suspend_15_1_o0), 
    .PCC_op_cancel_i(PCC_ip_cancel_15_1_o0)

    );
SendData #(8'd5,6'd10,12'd100,200,1,8'd1,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h31,8'h72)SendData_f6_7_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_op_data_o(PCC_ip_data_7_2_i0), 
    .PCC_op_stb_o(PCC_ip_stb_7_2_i0), 
    .PCC_op_fwd_o(PCC_ip_fwd_7_2_i0), 

    .PCC_op_fail_i(PCC_ip_fail_7_2_o0), 
    .PCC_op_pack_i(PCC_ip_pack_7_2_o0), 
    .PCC_op_suspend_i(PCC_ip_suspend_7_2_o0), 
    .PCC_op_cancel_i(PCC_ip_cancel_7_2_o0)
	 );
//flow4
/*
SendData #(8'd5,6'd10,12'd100,200,2,8'd1,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'hB1,8'hE1)SendData_f4_14_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_op_data_o(PCC_ip_data_14_1_i0), 
    .PCC_op_stb_o(PCC_ip_stb_14_1_i0), 
    .PCC_op_fwd_o(PCC_ip_fwd_14_1_i0), 

	//.en(PCC_2_3_en),
    .PCC_op_fail_i(PCC_ip_fail_14_1_o0), 
    .PCC_op_pack_i(PCC_ip_pack_14_1_o0), 
    .PCC_op_suspend_i(PCC_ip_suspend_14_1_o0), 
    .PCC_op_cancel_i(PCC_ip_cancel_14_1_o0)

	
    );
//flow5
SendData #(8'd5,6'd10,12'd100,200,2,8'd1,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h42,8'h22)SendData_f5_2_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_op_data_o(PCC_ip_data_2_2_i0), 
    .PCC_op_stb_o(PCC_ip_stb_2_2_i0), 
    .PCC_op_fwd_o(PCC_ip_fwd_2_2_i0), 

    .PCC_op_fail_i(PCC_ip_fail_2_2_o0), 
    .PCC_op_pack_i(PCC_ip_pack_2_2_o0), 
    .PCC_op_suspend_i(PCC_ip_suspend_2_2_o0), 
    .PCC_op_cancel_i(PCC_ip_cancel_2_2_o0)

    ); 
//flow6


    	
//flow7

SendData #(8'd5,6'd10,12'd100,200,2,8'd1,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h72,8'h91)SendData_f7_9_1 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_op_data_o(PCC_ip_data_9_1_i0), 
    .PCC_op_stb_o(PCC_ip_stb_9_1_i0), 
    .PCC_op_fwd_o(PCC_ip_fwd_9_1_i0), 

    .PCC_op_fail_i(PCC_ip_fail_9_1_o0), 
    .PCC_op_pack_i(PCC_ip_pack_9_1_o0), 
    .PCC_op_suspend_i(PCC_ip_suspend_9_1_o0), 
    .PCC_op_cancel_i(PCC_ip_cancel_9_1_o0)

    );

 	
//flow8
SendData #(8'd5,6'd10,12'd100,200,3,8'd1,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h41,8'h32)SendData_f8_3_2 (
    .clk(clk), 
    .reset(!reset_n), 
    .PCC_op_data_o(PCC_ip_data_3_2_i0), 
    .PCC_op_stb_o(PCC_ip_stb_3_2_i0), 
    .PCC_op_fwd_o(PCC_ip_fwd_3_2_i0), 

    .PCC_op_fail_i(PCC_ip_fail_3_2_o0), 
    .PCC_op_pack_i(PCC_ip_pack_3_2_o0), 
    .PCC_op_suspend_i(PCC_ip_suspend_3_2_o0), 
    .PCC_op_cancel_i(PCC_ip_cancel_3_2_o0)

    );
*/
//Dispaly_UART
parameter  CLK_FREQ = 50000000;         
parameter  UART_BPS = 115200; 

uart_send #(BUSW,CLK_FREQ,UART_BPS,8,127)         
u_uart_send(                 
    .sys_clk        (clk),
    .sys_rst_n      (reset_n),
     
	
    .uart_en        (PCC_op_fwd_5_1_o0),
    .uart_din       (PCC_op_data_5_1_o0),
    .uart_txd       (uart_txd)
    );
/*	
flow_output_2  u_flow(                 
    .sys_clk        (clk),
    .sys_rst_n      (reset_n),
    .clk_counter	(clk_counter),
	.packing_1		(PCC_ip_pack_0_1_o0),
	.packing_2		(PCC_ip_pack_0_2_o0),
    .en_1    		(PCC_op_fwd_5_1_o0),
	.en_2    		(PCC_op_fwd_4_2_o0),
    .data_din_1     (PCC_op_data_5_1_o0),
	.data_din_2     (PCC_op_data_4_2_o0),
    .uart_txd   	(uart_txd)
    );	
*/	
/*flow_output_8 #(16'd63) 
u_flow(                 
    .sys_clk        (clk),
    .sys_rst_n      (reset_n),
    .clk_counter	(clk_counter),
	.packing_1		(PCC_ip_pack_2_1_o0),
	.packing_2		(PCC_ip_pack_4_1_o0),
	.packing_3		(PCC_ip_pack_15_1_o0),
	.packing_4		(PCC_ip_pack_13_1_o0),
	.packing_5		(PCC_ip_pack_0_2_o0),
	.packing_6		(PCC_ip_pack_1_2_o0),
	.packing_7		(PCC_ip_pack_1_1_o0),
	.packing_8		(PCC_ip_pack_14_1_o0),
    .en_1    		(PCC_op_fwd_8_1_o0),
	.en_2    		(PCC_op_fwd_8_1_o0),
	.en_3    		(PCC_op_fwd_10_1_o0),
	.en_4    		(PCC_op_fwd_10_1_o0),
	.en_5    		(PCC_op_fwd_3_2_o0),
	.en_6    		(PCC_op_fwd_3_2_o0),
	.en_7    		(PCC_op_fwd_4_2_o0),
	.en_8    		(PCC_op_fwd_4_2_o0),
    .data_din_1     (PCC_op_data_8_1_o0),
	.data_din_2     (PCC_op_data_8_1_o0),
	.data_din_3     (PCC_op_data_10_1_o0),
	.data_din_4     (PCC_op_data_10_1_o0),
	.data_din_5     (PCC_op_data_3_2_o0),
	.data_din_6     (PCC_op_data_3_2_o0),
	.data_din_7     (PCC_op_data_4_2_o0),
	.data_din_8     (PCC_op_data_4_2_o0),
    .uart_txd   	(uart_txd)
    );	


breakdown #(16'd50)U_bresk(
	.clk(clk),
	.rst_n(!reset_n),
	.data(PCC_ip_data_0_1_i0),
	.rst(rst)

); */	

endmodule