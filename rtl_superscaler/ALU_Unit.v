`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module ALU_Unit(
		     input	   ALUSrc, SSSrc,
		     input [3:0]   ALUControl,
		     input [31:0]  SrcA,SrcB,ImmExt,

		     output	   Zero,
		     output [31:0] ALUResult,WriteData
		     );

   wire [31:0]			   ALUResult_s, ALUResult_ss;

   Mux ALU_Mux_inst(
			.Input_A(WriteData), 
			.Input_B(ImmExt), 
			.Sel(ALUSrc),
			.Output(SrcB)
			);

   ALU ALU_inst(
		.A(SrcA),
		.B(SrcB),
		.ALUControl(ALUControl),
		.Zero(Zero),
		.Result(ALUResult_s)
		);

   ALU_Array ALU_Array_inst(
		.A(SrcA),
		.B(SrcB),
		.ALUControl(ALUControl),
		.Result(ALUResult_ss)
		);

   Mux SS_Mux_inst(
			.Input_B(ALUResult_ss), 
			.Input_A(ALUResult_s), 
			.Sel(SSSrc),
			.Output(ALUResult)
   );

endmodule
