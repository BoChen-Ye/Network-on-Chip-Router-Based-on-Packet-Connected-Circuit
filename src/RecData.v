`timescale 1ns / 10ps


module RecData
#(parameter DATAW = 66)
(

   input	                  clk,
   input	                reset,
   
   input [DATAW-1:0] PCC_ip_data_i,
   input             PCC_ip_stb_i,
   input             PCC_ip_fwd_i,
   
   
   output  reg    	PCC_ip_fail_o,
   output  reg   	PCC_ip_pack_o,
   output  reg 		PCC_ip_suspend_o,
   output  reg  	PCC_ip_cancel_o
   
   );
	

reg		pack_sig_1;
reg		pack_sig_2;
wire	pack_sig;
always@(posedge clk)
	if(reset)
		pack_sig_1<=0;
	else if(PCC_ip_data_i[DATAW-1]==1)
		pack_sig_1<=1;
	else
		pack_sig_1<=0;
always@(posedge clk)
	if(reset)
		pack_sig_2<=0;
	else 
		pack_sig_2<=pack_sig_1;
assign	pack_sig	=	pack_sig_1&&!pack_sig_2;
always@(posedge clk)
	if(reset)
		PCC_ip_pack_o<=0;
	else if(pack_sig)
		PCC_ip_pack_o<=1;
	else
		PCC_ip_pack_o<=0;


reg		cancel_sig_1;
reg		cancel_sig_2;
wire	cancel_sig;
always@(posedge clk)
	if(reset)
		cancel_sig_1<=0;
	else if(PCC_ip_data_i[DATAW-2:DATAW-3]==2'b11)
		cancel_sig_1<=1;
	else
		cancel_sig_1<=0;
always@(posedge clk)
	if(reset)
		cancel_sig_2<=0;
	else 
		cancel_sig_2<=cancel_sig_1;
assign	cancel_sig	=	cancel_sig_1&&!cancel_sig_2;
always@(posedge clk)
	if(reset)
		PCC_ip_cancel_o<=0;
	else if(cancel_sig)
		PCC_ip_cancel_o<=1;
	else
		PCC_ip_cancel_o<=0;
		
always@(posedge clk)
	if(reset)	
		PCC_ip_fail_o<=0;
	else
		PCC_ip_fail_o<=0;
		
always@(posedge clk)
	if(reset)	
		PCC_ip_suspend_o<=0;
	else
		PCC_ip_suspend_o<=0;	
endmodule
