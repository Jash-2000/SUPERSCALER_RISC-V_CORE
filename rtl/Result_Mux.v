`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Result_Mux (
		   input wire [31:0]  ALUResult,ReadData,PC_Plus_4,
		   input wire [31:0]  ResultSrc,
		   output wire [31:0] Result
		   );

   assign Result = ResultSrc[1] ? PC_Plus_4 :(ResultSrc[0] ? ReadData : ALUResult);

endmodule
