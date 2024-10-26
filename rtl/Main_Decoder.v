 `timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

// Control Unit for decoding the instructions and assigning them to ALU/JUMP/Extender modules as required.
module Main_Decoder(
		    input wire [6:0]  op,
		    output wire [1:0] ResultSrc,
		    output wire       MemWrite, Branch,ALUSrc, RegWrite,Jump,
		    output wire [1:0] ImmSrc, ALUop
		    );

   reg [10:0] 			      control_signals;
   
   always@(*)
     case(op)
       //RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUop_Jump
       7'b0000011: control_signals = 11'b1_00_1_0_01_0_00_0;//lw
       7'b0100011: control_signals = 11'b0_01_1_1_00_0_00_0;//sw
       7'b0110011: control_signals = 11'b1_xx_0_0_00_0_10_0;//R-type
       7'b0010011: control_signals = 11'b1_00_1_0_00_0_10_0;//I-typr ALU
       7'b1100011: control_signals = 11'b0_10_0_0_00_1_01_0;//beq
       
       7'b1100011: control_signals = 11'b0_10_0_0_00_1_01_0;//B-type Branch
       7'b1101111: control_signals = 11'b1_11_0_0_10_0_00_1;//jal
       7'b1100111: control_signals = 11'b1_00_1_0_10_0_00_1;//jalr
        7'b0110111: control_signals = 11'b1_00_1_0_00_0_11_0;//U-type lui
        7'b0010111: control_signals = 11'b1_00_1_0_00_0_01_0;// U-type AUIPC
        
        7'b0000000: control_signals = 11'b0_00_0_0_00_0_00_0;//reset conditionm

       default:    control_signals = 11'bx_xx_x_x_xx_x_xx_x;
     endcase

   assign {RegWrite,ImmSrc,ALUSrc,MemWrite,
	   ResultSrc,Branch,ALUop,Jump} = control_signals;	
   
endmodule
