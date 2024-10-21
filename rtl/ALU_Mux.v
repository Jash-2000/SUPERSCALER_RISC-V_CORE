`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module ALU_Mux (
		input wire [31:0]  WD, ImmExt,
		input wire	   ALUSrc,
		output wire [31:0] B
		);

   assign B = ALUSrc ? ImmExt : WD;

endmodule
