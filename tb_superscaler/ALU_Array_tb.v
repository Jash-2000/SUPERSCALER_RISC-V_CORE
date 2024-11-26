`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module ALU_Array_tb;

   reg [31:0] A, B;
   wire [31:0] Result;
   reg [3:0]  ALUControl;

   ALU_Array ALU_Array_inst (.A(A), .B(B), .Result(Result), .ALUControl(ALUControl));

   initial begin
      A = 32'h02345432;		// Key 1 - [0 2 3 4 5 4 3 2]
      B = 32'hF7521035;		// Key 2 - [15 7 5 2 1 0 3 5]
      ALUControl = 4'b0000;	// Parallel Add operation
      #10;
      A = 32'h02345432;		// Key 1 - [0 2 3 4 5 4 3 2]
      B = 32'hF7521035;		// Key 2 - [15 7 5 2 1 0 3 5]
      ALUControl = 4'b1111;	// Parallel MUL operation
      #10;
      A = 32'h02345432;		// Key 1 - [0 2 3 4 5 4 3 2]
      B = 32'hF7521035;		// Key 2 - [15 7 5 2 1 0 3 5]
      ALUControl = 4'b0001;	// Parallel Sub operation
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, Result = %h", $time, Result);
   end

endmodule
