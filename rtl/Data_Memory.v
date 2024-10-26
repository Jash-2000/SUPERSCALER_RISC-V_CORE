`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


// Main Module for Memory Design
module Data_Memory(
		   input wire 	      clk, WE,		// Input Clock and Write-Enable signal
		   input wire [31:0]  Add_local, WD,		// Input Address and write-data
		   output wire [31:0] RD		// Output Read-Data
		   );

   reg [31:0] 			      RAM[63:0];	// Our Ram has 64 slots of 32-bit data

   assign RD = RAM[Add_local[31:2]]; 			// word aligned

initial begin
   RAM[32'h00_00_00_00]  = 32'hFFFFFFFF;		// The stored admin key for encryption  
end

   always @(posedge clk)
     if (WE)
       RAM[A[31:2]] <= WD;

endmodule
