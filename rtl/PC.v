`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


// Simple Program Counter.
module PC (	
		input wire 	   clk,reset,
		input wire [31:0]  PCNext,
		output wire [31:0] PC );
   
   reg [31:0] 			   PCReg;

   always@(posedge clk or posedge reset)
     begin
	if (reset) PCReg <= 0;
	else PCReg <= PCNext;
     end	

   assign PC = PCReg;

endmodule
