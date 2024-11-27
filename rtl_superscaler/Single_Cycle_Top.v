`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Single_Cycle_Top( input clk,reset );

  wire [31:0] WriteData, DataAddr, PC, Instr, ReadData, SrcA, Result;
  wire MemWrite, SSSrc, ALUSrc, RegWrite, Jump, Zero, PCSrc;
  wire [1:0] ResultSrc,ImmSrc;
  wire [3:0] ALUControl;

   Instruction_Memory Instr_Memory ( 
				     .A(PC),
				     .RD(Instr),
				     .SSSrc(SSSrc) );

   Data_Memory Data_Memory (
			    .clk(clk), 
			    .WE(MemWrite),
			    .A(DataAddr), 
			    .WD(WriteData),
			    .RD(ReadData) );

   Register_File Register_inst(
			       .clk(clk),
			       .WE3(RegWrite),
			       .RA1(Instr[19:15]),
			       .RA2(Instr[24:20]),
			       .WA3((Instr[11:7])),
			       .WD3(Result),
			       .RD1(SrcA),
			       .RD2(WriteData)
			       );

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
			  .ImmSrc(ImmSrc),
			  .ALUControl(ALUControl),
			  .Instr(Instr),
			  .ReadData(ReadData),
			  .Zero(Zero),
			  .PC(PC),
			  .SSSrc(SSSrc),
			  .ALUResult(DataAddr),
			  .WriteData(WriteData),
			  .Result(Result),
			  .SrcA(SrcA)
			  );	


endmodule
