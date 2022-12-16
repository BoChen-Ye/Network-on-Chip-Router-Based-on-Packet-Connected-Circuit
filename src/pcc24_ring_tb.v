`timescale 1ns/1ps
module pcc24_ring_tb;
reg clk;
reg reset;

pcc24_ring uut (
		.clk(clk), 
		.reset_n(reset)
	);
	
initial
  begin
        clk=1'b0;
        reset=1'b1;
		 
		#100 reset=1'b0;	 
		#100 reset=1'b1;
  end
 
 always #10 clk=~clk;
 
 endmodule