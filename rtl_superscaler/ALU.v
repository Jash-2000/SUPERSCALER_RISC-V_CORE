`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */
 
module ALU(
	   input wire signed [31:0]  A,B, 	  // Inputs for the ALUs
	   input wire signed [3:0]   ALUControl,  // Used to define the target operation
	   output wire signed	      Zero,	  // Simply denotes if the output is 0. Used for Jump/Branch Operations
	   output wire signed [31:0] Result );	  // Holds the Results

   reg [31:0]		      ResultReg;
   wire [31:0]		      temp,Sum;
   wire			      slt, sltu; 	//overflow

   //~B if ALUControl[0] is set 1 for subtraction (R Type]
   //Sum is addition of A + B + 0 or
   //Sum is subtraction of A + ~B + 1 <2's complement>
   assign temp = ALUControl[0] ? ~B:B;
   assign Sum = A + temp + ALUControl[0]; 
   
   assign slt = (A[31] == B[31]) ? (A < B) : A[31]; // because for signed numbers, of both are of same sign, we can compare A and B, but if they are of different sign we can take the MSB of A
   //if A is positive and B is negative => A is not less than B, slt = 0 ie. A[31]
   //if A is negative and B is positive -> A is definitely lass than B, so slt = 1 ie. A[31]
   
   assign sltu = A < B; //for unsigned number comparison, this will give a boolean output (true - 1, false - 0)
   

   always@(*)
     case(ALUControl)
       4'b0000: ResultReg <= Sum; //add
       4'b0001: ResultReg <= Sum; //sub
       4'b0010: ResultReg <= A&B; //and
       4'b0011: ResultReg <= A|B; //or
       4'b0100: ResultReg <= A^B; //xor
       //4'b1111: ResultReg <= <To be added for non-superscaler cases> ; //Mul
       
       4'b0101: ResultReg <= {31'b0,slt}; //slt
       4'b0110: ResultReg <= {31'b0,sltu}; // sltu
       4'b0111: ResultReg <= {A[31:12],12'b0}; //lui
       4'b1000: ResultReg <= A + {B[31:12],12'b0}; // AUIPC
       4'b1001: ResultReg <= {B[31:12],12'b0}; // LUI
       
       4'b1010: ResultReg <= A << B; // sll, slli
       4'b1011: ResultReg <= A >>> B; // sra
       4'b1100: ResultReg <= A >> B; // srl
       
       default:  ResultReg <= 'bx;

     endcase

   assign Zero = (ResultReg == 32'b0);
   assign Result = ResultReg;

endmodule
