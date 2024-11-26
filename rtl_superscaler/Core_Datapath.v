`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module Core_Datapath(
		     input	   clk,reset,
		     input [1:0]   ResultSrc,
		     input	   PCSrc,ALUSrc, SSSrc,
		     input [1:0]   ImmSrc,
		     input [3:0]   ALUControl,
		     input [31:0]  Instr,
		     input [31:0]  ReadData, SrcA,SrcB, Result,

		     output	   Zero,
		     output [31:0] PC,
		     output [31:0] ALUResult,WriteData
		     );

   wire [31:0]			   PCplus4, ImmExt;

  Extend Extend_inst(
		      .Instr(Instr[31:7]),
		      .ImmSrc(ImmSrc),
		      .ImmExt(ImmExt)
		      ); 
  
  Result_Mux Write_Back_inst(
			      .ALUResult(ALUResult),
			      .ReadData (ReadData),
			      .PC_Plus_4(PCplus4),
			      .ResultSrc(ResultSrc),
			      .Result(Result)
			      );

  PC_Unit PC_Unit_inst (
	       .clk(clk),
	       .reset(reset),
	       .PCSrc(PCSrc),
	       .PC(PC)
	       );

   ALU_Unit ALU_Unit_inst(
			.ALUSrc(ALUSrc),
			.SSSrc(SSSrc),
			.ALUControl(ALUControl),
			.SrcA(SrcA),
			.SrcB(SrcB),
			.ImmExt(ImmExt),
			.Zero(Zero),
			.ALUResult(ALUResult),
			.WriteData(WriteData)
			);

endmodule


