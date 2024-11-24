`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */
module Single_Cycle_Core_tb;

   reg clk = 0;
   reg reset = 0;
   reg [31:0] Instr;
   reg [31:0] ReadData;
   wire [31:0] PC;
   wire	       MemWrite;
   wire [31:0] ALUResult;
   wire [31:0] WriteData;

   always #5 clk = ~clk;

   Single_Cycle_Core Single_Cycle_Core_tb_inst(.clk(clk),
					       .reset(reset), 
					       .Instr(Instr), 
					       .ReadData(ReadData), 
					       .PC(PC), 
					       .MemWrite(MemWrite), 
					       .ALUResult(ALUResult), 
					       .WriteData(WriteData));

   initial begin
      Instr = 32'h00000000;
      ReadData = 32'h00000000;
      #10;
      Instr = 32'h00400093; // addi x1, x0, 4
      ReadData = 32'h00000004;
      #10;
      Instr = 32'h008080b3; //add x1, x1, x1
      ReadData = 32'h00000008;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, PC = %h, MemWrite = %b, ALUResult = %h, WriteData = %h", $time, PC, MemWrite, ALUResult, WriteData);
   end

endmodule
