`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Single_Cycle_Top(
			input 	      clk,reset,
			output [31:0] WriteData,DataAddr, PC, Instr, ReadData, 
			output 	      MemWrite );

  // wire [31:0] Instr, ReadData;

   Single_Cycle_Core core_top (
			       .clk(clk),
			       .reset(reset),
			       .Instr(Instr),
			       .ReadData(ReadData),
			       .PC(PC),
			       .MemWrite(MemWrite),
			       .ALUResult(DataAddr),
			       .WriteData(WriteData) );

   Instruction_Memory Instr_Memory ( 
				     .A(PC),
				     .RD(Instr) );

   Data_Memory Data_Memory (
			    .clk(clk), 
			    .WE(MemWrite),
			    .A(DataAddr), 
			    .WD(WriteData),
			    .RD(ReadData) );

endmodule
