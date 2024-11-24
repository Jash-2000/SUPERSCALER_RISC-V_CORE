`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Control_Unit(
		    input wire [6:0]  op,
		    input wire [2:0]  funct3,
		    input wire	      funct7b5, Zero, // function 7 is the 5th bit

		    output wire [1:0] ResultSrc,
		    output wire	      MemWrite, PCSrc, ALUSrc, RegWrite,Jump,
		    output wire [1:0] ImmSrc,
		    output wire [3:0] ALUControl
		    );

   wire [1:0]			      ALUop;
   wire				      Branch;
   
   Main_Decoder Main_Decoder(
  			     .op(op),
			     .ResultSrc(ResultSrc),
			     .MemWrite(MemWrite),
			     .Branch(Branch),
  			     .ALUSrc(ALUSrc),
			     .RegWrite(RegWrite),
  			     .Jump(Jump),
			     .ImmSrc(ImmSrc),
			     .ALUop(ALUop) );
   
   ALU_Decoder ALU_Decoder(
  			   .opb5(op[5]),
			   .funct3(funct3),
			   .funct7b5(funct7b5),
			   .ALUOp(ALUop),
			   .ALUControl(ALUControl) );
   
   //for branches beq, bne, blt, bge, bltu, bgeu
   //make modifications later - get sign from ALU, make conditions for all branches  
  
   assign PCSrc = Branch & Zero | Jump;
    
   
endmodule
