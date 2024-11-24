`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */
module Instruction_Memory_tb;

   reg [31:0] A;
   wire [31:0] RD;

   Instruction_Memory Instruction_Memory_tb_inst (.A(A), .RD(RD));

   initial begin
      A = 32'd0;
      #10;
      A = 32'd4;
      #10;
      A = 32'd8;
      #10;
      A = 32'd12;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, RD = %h", $time, RD);
   end

endmodule
