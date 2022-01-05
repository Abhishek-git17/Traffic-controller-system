`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:06:13 12/05/2021
// Design Name:   sig_control
// Module Name:   C:/Users/abhishek/Desktop/xilins_project/Traffic_controller/test_bench.v
// Project Name:  Traffic_controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sig_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define TRUE  1'b1 
`define FALSE 1'b0 
module test_bench;

	// Inputs
	reg X;
	reg clock;
	reg clear;

	// Outputs
	wire [1:0] hwy;
	wire [1:0] cntry;

	// Instantiate the Unit Under Test (UUT)
	sig_control uut (
		.hwy(hwy), 
		.cntry(cntry), 
		.X(X), 
		.clock(clock), 
		.clear(clear)
	);

	initial begin
		$monitor("	simtime = %g,highway=%b,country_road=%b,vehicle _on_country_road=%b,clock=%b,clear=%b",$time,hwy,cntry,X,clock,clear);	
  clock = `FALSE;    
  forever #5 clock = ~clock; 
  end 
 
//control clear signal initial 
		initial 
		
	begin     
	clear = `TRUE;    
	repeat (5) @(negedge clock);     
	clear = `FALSE; end 
 
//apply stimulus 
initial 
begin     
X = `FALSE; 
 
    repeat(20)@(negedge clock); X = `TRUE;     
	 repeat(10)@(negedge clock); X = `FALSE; 
 
    repeat(20)@(negedge clock); X = `TRUE;     
	 repeat(10)@(negedge clock); X = `FALSE; 
 
    repeat(20)@(negedge clock); X = `TRUE;     
	 repeat(10)@(negedge clock); X = `FALSE; 
 
    repeat(10)@(negedge clock); 
	 $finish; 
	 end 
      
endmodule

