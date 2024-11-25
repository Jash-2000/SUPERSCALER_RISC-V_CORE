`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module ALU_Array_tb;

   reg [31:7] Instr;
   reg [1:0]  ImmSrc;
   wire [31:0] ImmExt;

   Extend Extend_tb_inst (.Instr(Instr), .ImmSrc(ImmSrc), .ImmExt(ImmExt));

   initial begin
      Instr = 32'h010080000;
      ImmSrc = 2'b00;
      #10;
      Instr = 32'h010080000;
      ImmSrc = 2'b01;
      #10;
      Instr = 32'h010080000;
      ImmSrc = 2'b10;
      #10;
      Instr = 32'h010080000;
      ImmSrc = 2'b11;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, ImmExt = %h", $time, ImmExt);
   end

endmodule
