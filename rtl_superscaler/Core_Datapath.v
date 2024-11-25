`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module Core_Datapath(
		     input	   clk,reset,
		     input [1:0]   ResultSrc,
		     input	   PCSrc,ALUSrc, SSSrc,
		     input	   RegWrite,
		     input [1:0]   ImmSrc,
		     input [3:0]   ALUControl,
		     input [31:0]  Instr,
		     input [31:0]  ReadData,

		     output	   Zero,
		     output [31:0] PC,
		     output [31:0] ALUResult,WriteData
		     );

   wire [31:0]			   PCnext,PCplus4,PCtarget;
   wire [31:0]			   ImmExt;
   wire [31:0]			   SrcA,SrcB;
   wire [31:0]			   Result;
   wire [31:0]			   ALUResult_s, ALUResult_ss;

   PC PC_inst (
	       .clk(clk),
	       .reset(reset),
	       .PCNext(PCnext),
	       .PC(PC)
	       );
   PC_Plus_4 PCPlus4_inst (
			   .PC(PC),
			   .PCPlus4(PCplus4)
			   );

   PC_Target PCTarget_inst (
			    .PC(PC),
			    .ImmExt(ImmExt),	
			    .PCTarget(PCtarget)
			    );

   PC_Mux PCmux_inst(
		     .PC_Plus_4(PCplus4),
		     .PC_Target(PCtarget),
		     .PCSrc(PCSrc),
		     .PC_Next(PCnext)
		     );

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
   Extend Extend_inst(
		      .Instr(Instr[31:7]),
		      .ImmSrc(ImmSrc),
		      .ImmExt(ImmExt)
		      ); 

   ALU_Mux ALU_Mux_inst(
			.WD(WriteData), 
			.ImmExt(ImmExt), 
			.ALUSrc(ALUSrc),
			.B(SrcB)
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
   SS_Mux SS_Mux_inst(
			.ALUResult_ss(ALUResult_ss), 
			.ALUResult_s(ALUResult_s), 
			.SSSrc(SSSrc),
			.ALUResult(ALUResult)
   );
   Result_Mux Result_Mux_inst(
			      .ALUResult(ALUResult),
			      .ReadData (ReadData),
			      .PC_Plus_4(PCplus4),
			      .ResultSrc(ResultSrc),
			      .Result(Result)
			      );

endmodule


