`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Data_Memory(
		   input wire 	      clk, WE,
		   input wire [31:0]  A, WD,
		   output wire [31:0] RD
		   );

   reg [31:0] 			      RAM[63:0];

   assign RD = RAM[A[31:2]]; // word aligned

initial begin
   RAM[32'h00_00_00_00]  = 32'h11111111;	// Admin Key Stored the system's 1st memory block
   //RAM[32'h00_00_00_01]  = 32'h1FD961AB;	// Passkey Stored the system's 4th memory block
end



   always @(posedge clk)
     if (WE)
       RAM[A[31:2]] <= WD;

endmodule
