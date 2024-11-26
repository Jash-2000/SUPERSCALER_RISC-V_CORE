`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */
 
module ALU_reduced(
	   input wire [3:0]  A,B, 	  // Inputs for the ALUs
	   input wire [3:0]   ALUControl,  // Used to define the target operation
	   output wire [3:0] Result );	  // Holds the Results

   reg [3:0]		      ResultReg;
   wire [3:0]		      temp,Sum;
  
   assign Sum = A + (ALUControl[0] ? ~B:B) + ALUControl[0];	// Either addition or subtraction  
   FOUR_bit_multiplier four_bit_mul_inst(.A(A), .B(B), .P(temp));

// Only unsigned operations are perfomed in ALU array.
   always@(*)
     case(ALUControl)
       4'b0000: ResultReg <= Sum; //add
       4'b1111: ResultReg <= temp; //Mul
       4'b0001: ResultReg <= Sum; //sub
       default: ResultReg <= 'bx;
     endcase

   assign Result = ResultReg;

endmodule
