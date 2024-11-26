`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */
 
module ALU_Array(	   input wire [31:0]  A,B, 	  // Inputs for the ALUs
	   input wire [3:0]   ALUControl,  // Used to define the target operation
	   output wire [31:0] Result );	  // Holds the Results
   
   wire [3:0] t_Result1,t_Result2,t_Result3,t_Result4,t_Result5,t_Result6,t_Result7,t_Result8 ;
	
// Defining 8 parallel sets of ALUs to work in parallel.
   ALU_reduced ALU_reduced_inst1(
		.A(A[3:0]),
		.B(B[3:0]),
		.ALUControl(ALUControl),
		.Result(t_Result1)
		);
   ALU_reduced ALU_reduced_inst2(
		.A(A[7:4]),
		.B(B[7:4]),
		.ALUControl(ALUControl),
		.Result(t_Result2)
		);
   ALU_reduced ALU_reduced_inst3(
		.A(A[11:8]),
		.B(B[11:8]),
		.ALUControl(ALUControl),
		.Result(t_Result3)
		);
   ALU_reduced ALU_reduced_inst4(
		.A(A[15:12]),
		.B(B[15:12]),
		.ALUControl(ALUControl),
		.Result(t_Result4)
		);
   ALU_reduced ALU_reduced_inst5(
		.A(A[19:16]),
		.B(B[19:16]),
		.ALUControl(ALUControl),
		.Result(t_Result5)
		);
   ALU_reduced ALU_reduced_inst6(
		.A(A[23:20]),
		.B(B[23:20]),
		.ALUControl(ALUControl),
		.Result(t_Result6)
		);
   ALU_reduced ALU_reduced_inst7(
		.A(A[27:24]),
		.B(B[27:24]),
		.ALUControl(ALUControl),
		.Result(t_Result7)
		);
   ALU_reduced ALU_reduced_inst8(
		.A(A[31:28]),
		.B(B[31:28]),
		.ALUControl(ALUControl),
		.Result(t_Result8)
		);

   assign Result = {t_Result8,t_Result7,t_Result6,t_Result5,t_Result4,t_Result3,t_Result2,t_Result1};
endmodule
