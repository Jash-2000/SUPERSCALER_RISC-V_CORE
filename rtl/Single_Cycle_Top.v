`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


// Main file of the simulation hierarchy. Defines the structure of the project.
module Single_Cycle_Top(
			input 	      clk,reset,	// Input signal to the RISC-V Core
			output [31:0] WriteData,DataAddr,PC, Instr, ReadData, // Output signal to the memory unit
			output 	      MemWrite );	  // Output Signal for enaling Memory Write


   Single_Cycle_Core core_top (
			       .clk(clk),
			       .reset(reset),
			       .Instr(Instr),
			       .ReadData(ReadData),
			       .PC(PC),
			       .MemWrite(MemWrite),
			       .ALUResult(DataAddr),
			       .WriteData(WriteData) );

   //  Unit that stores the instructions of execution 
   Instruction_Memory Instr_Memory ( 
				     .PC_input(PC),
				     .RD(Instr) );
   
   // Definig the block of Data Memory
   Data_Memory Data_Memory (
			    .clk(clk), 
			    .WE(MemWrite),
			    .A(DataAddr), 
			    .WD(WriteData),
			    .RD(ReadData) );

endmodule
