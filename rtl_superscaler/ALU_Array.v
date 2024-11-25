`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */
 
module ALU_Array(	   input wire signed [31:0]  A,B, 	  // Inputs for the ALUs
	   input wire signed [3:0]   ALUControl,  // Used to define the target operation
	   output wire signed [31:0] Result );	  // Holds the Results
   
// Defining 8 parallel sets of ALUs to work in parallel.
   ALU_reduced ALU_reduced_inst1(
		.A(A[3:0]),
		.B(B[3:0]),
		.ALUControl(ALUControl),
		.Result(Result[3:0])
		);
   ALU_reduced ALU_reduced_inst2(
		.A(A[7:4]),
		.B(B[7:4]),
		.ALUControl(ALUControl),
		.Result(Result[7:4])
		);
   ALU_reduced ALU_reduced_inst3(
		.A(A[11:8]),
		.B(B[11:8]),
		.ALUControl(ALUControl),
		.Result(Result[11:8])
		);
   ALU_reduced ALU_reduced_inst4(
		.A(A[15:12]),
		.B(B[15:12]),
		.ALUControl(ALUControl),
		.Result(Result[15:12])
		);
   ALU_reduced ALU_reduced_inst5(
		.A(A[19:16]),
		.B(B[19:16]),
		.ALUControl(ALUControl),
		.Result(Result[19:16])
		);
   ALU_reduced ALU_reduced_inst6(
		.A(A[23:20]),
		.B(B[23:20]),
		.ALUControl(ALUControl),
		.Result(Result[23:20])
		);
   ALU_reduced ALU_reduced_inst7(
		.A(A[27:24]),
		.B(B[27:24]),
		.ALUControl(ALUControl),
		.Result(Result[27:24])
		);
   ALU_reduced ALU_reduced_inst8(
		.A(A[31:28]),
		.B(B[31:28]),
		.ALUControl(ALUControl),
		.Result(Result[31:28])
		);

endmodule
