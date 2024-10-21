`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

// This module simply contains the instruction memory.
// We have a space of 64 instructions, each being 32 bit long.
module Instruction_Memory(
			  input [31:0] 	PC_input,
			  output [31:0] RD
			  );
   reg [31:0] 				I_MEM_BLOCK[63:0];

   initial
     begin
	$readmemh("./../instructions.txt",I_MEM_BLOCK);	// Instructions are in the text file
     end

   assign RD = I_MEM_BLOCK[PC_input[31:2]]; // word aligned

endmodule
