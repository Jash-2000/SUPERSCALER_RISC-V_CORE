`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module Core_Datapath_tb;

   reg clk=0, reset;
   reg [1:0] ResultSrc;
   reg	     PCSrc, ALUSrc, RegWrite;
   reg [1:0] ImmSrc;
   reg [3:0] ALUControl;
   reg [31:0] Instr;
   reg [31:0] ReadData;
   wire	      Zero;
   wire [31:0] PC, ALUResult, WriteData;

   Core_Datapath core_datapath(
			       .clk(clk), 
			       .reset(reset), 
			       .ResultSrc(ResultSrc), 
			       .PCSrc(PCSrc), 
			       .ALUSrc(ALUSrc), 
			       .RegWrite(RegWrite),
			       .ImmSrc(ImmSrc), 
			       .ALUControl(ALUControl), 
			       .Instr(Instr), 
			       .ReadData(ReadData), 
			       .Zero(Zero),
			       .PC(PC), 
			       .ALUResult(ALUResult), 
			       .WriteData(WriteData)
			       );

   always #10 clk = ~clk;

   initial begin
      reset = 1; 
      #20; 
      reset = 0; 

      Instr = 'b010011; // addi
      ReadData = 'b001;
      ResultSrc = 2'b00;
      PCSrc = 0;
      ALUSrc = 1;
      RegWrite = 1;
      ImmSrc = 2'b00;
      ALUControl = 4'b0010;
      #20;

      $finish;
   end
   initial begin
      $monitor("At time %t, Zero = %b, PC = %d, ALUResult = %d, WriteData = %d", 
               $time, Zero, PC, ALUResult, WriteData);
   end

endmodule

