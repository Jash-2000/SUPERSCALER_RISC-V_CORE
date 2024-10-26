`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module PC_Target_tb;

   reg [31:0] PC;
   reg [31:0] ImmExt;
   wire [31:0] PCTarget;

   PC_Target PC_Target_tb_inst (.PC(PC), .ImmExt(ImmExt), .PCTarget(PCTarget));

   initial begin
      PC = 32'd12345678;
      ImmExt = 32'd4;
      #10;
      PC = 32'd87654321;
      ImmExt = 32'd10;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, PCTarget = %d", $time, PCTarget);
   end

endmodule
