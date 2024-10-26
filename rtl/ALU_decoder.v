`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module ALU_Decoder(
		   input wire	    opb5, //bit 5 of the opcode
		   input wire [2:0] funct3, // instr[14:12]
		   input wire	    funct7b5, // bit 30 of instruction
		   input wire [1:0] ALUOp,
		   output reg [3:0] ALUControl
		   );

   wire				    RtypeSub;
   assign RtypeSub = funct7b5 & opb5; //TRUE for R-type substract

   always@(*)
     begin
	case(ALUOp)
          2'b00:  ALUControl = 4'b0000; //addition
          2'b01:  ALUControl = 4'b0001; //subtraction or auipc
          2'b10: //ALUOp = 2'b10 and beyond
            case(funct3)//R-type or I-type ALU
              3'b000:    
                if (RtypeSub) ALUControl = 4'b0001; //sub
                else ALUControl = 4'b0000; //add,addi
                3'b001: ALUControl = 4'b1010; // sll, slli;
              3'b010: ALUControl = 4'b0101; //slt,slti
              3'b011: ALUControl = 4'b0110; //sltu, sltui
              3'b100: ALUControl = 4'b0100; //xor
              3'b101: 
                if (funct7b5) ALUControl = 4'b1011; //sra
                else ALUControl = 4'b1100; // srl
               
              3'b110: ALUControl = 4'b0011; //or,ori
              3'b111: ALUControl = 4'b0010; //and,andi
              default: ALUControl = 4'bxxx; 
            endcase
          2'b11: //ALUOp = 2'b11 and beyond
            case(funct3)
              3'b000: ALUControl = 4'b01000; // AUIPC
              3'b001: ALUControl = 4'b01001; // LUI
              default: ALUControl = 4'bxxxx;
            endcase
          default: ALUControl = 4'bxxxx;
	endcase
     end

endmodule
