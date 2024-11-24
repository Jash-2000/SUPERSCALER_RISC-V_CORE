`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module ALU_Mux_tb;

   reg [31:0] WD;
   reg [31:0] ImmExt;
   reg	      ALUSrc;
   wire [31:0] B;

   ALU_Mux ALU_Mux_tb_inst (.WD(WD), .ImmExt(ImmExt), .ALUSrc(ALUSrc), .B(B));

   initial begin
      WD = 32'd12345678;
      ImmExt = 32'd87654321;
      ALUSrc = 1'b0;
      #10;
      ALUSrc = 1'b1;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, B = %h", $time, B);
   end

endmodule

