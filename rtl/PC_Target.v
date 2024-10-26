`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


// Based on the Immediate input, we implement the jump operation
module PC_Target(
		 input wire [31:0]  PC,ImmExt,
		 output wire [31:0] PCTarget
		 );

   assign PCTarget= PC + ImmExt;

endmodule
