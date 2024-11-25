`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Single_Cycle_Core(
			 input wire 	    clk,reset,
			 input wire [31:0]  Instr,
			 input wire 	    SSSrc,
			 input wire [31:0]  ReadData,
			 output wire [31:0] PC,
			 output wire 	    MemWrite,
			 output wire [31:0] ALUResult,WriteData
			 );

   wire 				    ALUSrc, RegWrite, Jump, Zero, PCSrc;
   wire [1:0] 				    ResultSrc,ImmSrc;
   wire [3:0] 				    ALUControl;

   Control_Unit Control(
			.op(Instr[6:0]),
			.funct3(Instr[14:12]),
			.funct7b5(Instr[30]),
			.funct7b0(Instr[25]),
			.Zero(Zero),
			.ResultSrc(ResultSrc),
			.MemWrite(MemWrite),
			.PCSrc(PCSrc),
			.ALUSrc(ALUSrc),
			.RegWrite(RegWrite),
			.Jump(Jump),
			.ImmSrc(ImmSrc),
			.ALUControl(ALUControl)
			);

   Core_Datapath Datapath(
			  .clk(clk),
			  .reset(reset),
			  .ResultSrc(ResultSrc),
			  .PCSrc(PCSrc),
			  .ALUSrc(ALUSrc),
			  .RegWrite(RegWrite),
			  .ImmSrc(ImmSrc),
			  .ALUControl(ALUControl),
			  .Instr(Instr),
			  .ReadData(ReadData),
			  .Zero(Zero),
			  .PC(PC),
			  .SSSrc(SSSrc),
			  .ALUResult(ALUResult),
			  .WriteData(WriteData)
			  );	

endmodule








