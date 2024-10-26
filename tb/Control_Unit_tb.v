`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module Control_Unit_tb;

   // Input wires
   reg [6:0]  op;
   reg [2:0]  funct3;
   reg	      funct7b5;
   reg	      Zero;

   // Output wires
   wire [1:0] ResultSrc;
   wire	      MemWrite;
   wire	      PCSrc;
   wire	      ALUSrc;
   wire	      RegWrite;
   wire	      Jump;
   wire [1:0] ImmSrc;
   wire [3:0] ALUControl;

   Control_Unit control_unit(
			     .op(op),
			     .funct3(funct3),
			     .funct7b5(funct7b5),
			     .Zero(Zero),
			     .ResultSrc(ResultSrc),
			     .MemWrite(MemWrite),
			     .PCSrc(PCSrc),
			     .ALUSrc(ALUSrc),
			     .RegWrite(RegWrite),
			     .Jump(Jump),
			     .ImmSrc(ImmSrc),
			     .ALUControl(ALUControl)
			     );

   initial begin
      op = 7'b0000011; // load
      funct3 = 3'b010;
      funct7b5 = 1'b0;
      Zero = 1'b0;
      #10;

      op = 7'b0110011; // add
      funct3 = 3'b000;
      funct7b5 = 1'b0;
      Zero = 1'b0;
      #10;
      
      // to add more

      $finish;
   end 

   initial begin
      $monitor("At time %d, ResultSrc = %b, MemWrite = %b, PCSrc = %b, ALUSrc = %b, RegWrite = %b, Jump = %b, ImmSrc = %b, ALUControl = %b", 
               $time, ResultSrc, MemWrite, PCSrc, ALUSrc, RegWrite, Jump, ImmSrc, ALUControl);
   end

endmodule
