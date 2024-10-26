`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

// Adding +4 values to move to the next instruction.
module PC_Plus_4(
		 input wire [31:0]  PC,
		 output wire [31:0] PCPlus4 );

   assign PCPlus4 = PC + 32'd4;

endmodule
