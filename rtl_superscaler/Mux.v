`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Mux (
		input wire [31:0]  Input_A, Input_B,
		input wire	   Sel,
		output wire [31:0] Output
		);

   assign Output = Sel ? Input_B : Input_A;

endmodule
