`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */
module PC_Mux_tb;

   reg [31:0] PC_Plus_4;
   reg [31:0] PC_Target;
   reg	      PCSrc;
   wire [31:0] PC_Next;

   PC_Mux PC_Mux_tb_inst (.PC_Plus_4(PC_Plus_4), .PC_Target(PC_Target), .PCSrc(PCSrc), .PC_Next(PC_Next));

   initial begin
      PC_Plus_4 = 32'd4;
      PC_Target = 32'd12345678;
      PCSrc = 0;
      #10;
      PCSrc = 1;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, PC_Next = %d", $time, PC_Next);
   end

endmodule
