`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Instruction_Memory(
			  input [31:0] 	A,
			  output [31:0] RD,
			  output SSSrc
			  );

   reg [32:0] 				I_MEM_BLOCK[63:0];

   initial
     begin
        $display("Loading the instruction ROM.");
	$readmemh("/fs/student/jashshah/Desktop/SUPERSCALER_RISC-V_CORE/instructions_ss.txt",I_MEM_BLOCK);
     end

	assign {SSSrc,RD} = I_MEM_BLOCK[A[31:2]]; // word aligned by dividing by 4 (we are reading 32 bit instructions only)

endmodule
