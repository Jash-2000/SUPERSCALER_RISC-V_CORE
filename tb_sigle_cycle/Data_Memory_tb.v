`timescale 1ns / 1ps

/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */
module Data_Memory_tb;

   reg clk = 0; 
   reg WE;
   reg [31:0] A;
   reg [31:0] WD;
   wire [31:0] RD;

   always #5 clk = ~clk;

   Data_Memory Data_Memory_tb_inst (.clk(clk), .WE(WE), .A(A), .WD(WD), .RD(RD));

   initial begin
      WE = 0;
      A = 32'd10;
      WD = 32'd12345678;
      #10;
      WE = 1;
      #10;
      WE = 0;
      #10;
      A = 32'd20;
      WD = 32'd87654321;
      #10;
      WE = 1;
      #10;
      WE = 0;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, RD = %h", $time, RD);
   end

endmodule
