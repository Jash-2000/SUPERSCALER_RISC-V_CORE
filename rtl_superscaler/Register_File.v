`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Register_File(
		     input wire 	clk, WE3,
		     input wire [4:0] 	RA1,RA2,WA3,
		     input wire [31:0] 	WD3,
		     output wire [31:0] RD1,RD2
		     );

   reg [31:0] 				REG_MEM_BLOCK[31:0];

   initial begin
    REG_MEM_BLOCK[5'b00000]  = 32'h00000019;    // System Exit Configurations
    REG_MEM_BLOCK[5'b00001]  = 32'h00000000;
    REG_MEM_BLOCK[5'b00010]  = 32'h00000000;
    REG_MEM_BLOCK[5'b00011]  = 32'h00000000;
    REG_MEM_BLOCK[5'b00100]  = 32'h00000000;
   end

   always@(posedge clk)
     begin
	   if(WE3)
	       REG_MEM_BLOCK[WA3] <= WD3;
     end

   assign RD1 = REG_MEM_BLOCK[RA1];
   assign RD2 = REG_MEM_BLOCK[RA2];

endmodule
