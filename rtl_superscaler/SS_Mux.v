`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module SS_Mux (
		input wire [31:0]  ALUResult_s, ALUResult_ss,
		input wire	   SSSrc,
		output wire [31:0] ALUResult
		);

   assign ALUResult = SSSrc ? ALUResult_ss : ALUResult_s;

endmodule
