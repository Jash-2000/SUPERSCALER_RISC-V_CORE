`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module PC_tb;


   reg clk = 0; 
   reg reset;
   reg [31:0] PCNext;
   wire [31:0] PC;

   always #5 clk = ~clk;

   PC PC_tb_inst (.clk(clk), .reset(reset), .PCNext(PCNext), .PC(PC));

   initial begin
      reset = 0;
      #10;
      reset = 1;
      #10;
      reset = 0;
      #10;
      PCNext = 32'd12345678;
      #10;
      PCNext = 32'd17291729;
      #10;
      PCNext = 32'd87654321;
      #10;
      $finish;
   end 

endmodule
