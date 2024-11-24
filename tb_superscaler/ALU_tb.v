`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module ALU_tb;

   reg [31:0] A;
   reg [31:0] B;
   reg [3:0]  ALUControl;
   wire	      Zero;
   wire [31:0] Result;

   ALU ALU_tb_inst (.A(A), .B(B), .ALUControl(ALUControl), .Zero(Zero), .Result(Result));

   initial begin
      A = 32'd12345678;
      B = 32'd87654321;
      ALUControl = 4'b0000; // test add operation
      #10;
      ALUControl = 4'b0001; // test sub operation
      #10;
      ALUControl = 4'b0010; // test and operation
      #10;
      ALUControl = 4'b0011; // test or operation
      #10;
      ALUControl = 4'b0100; // test xor operation
      #10;
      ALUControl = 4'b0101; // test slt operation
      #10;
      ALUControl = 4'b0110; // test sltu operation
      #10;
      ALUControl = 4'b0111; // test lui operation
      #10;
      ALUControl = 4'b1000; // test AUIPC operation
      #10;
      ALUControl = 4'b1001; // test LUI operation
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, Result = %d, Zero = %b", $time, Result, Zero);
   end

endmodule
