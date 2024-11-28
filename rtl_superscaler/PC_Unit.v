`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module PC_Unit(
		     input	   clk,reset,PCSrc,
		     output [31:0] PC, PCplus4, ImmExt
		     );

   wire [31:0]			   PCnext,PCtarget;

   PC PC_inst (
	       .clk(clk),
	       .reset(reset),
	       .PCNext(PCnext),
	       .PC(PC)
	       );
   PC_Plus_4 PCPlus4_inst (
			   .PC(PC),
			   .PCPlus4(PCplus4)
			   );

   PC_Target PCTarget_inst (
			    .PC(PC),
			    .ImmExt(ImmExt),	
			    .PCTarget(PCtarget)
			    );

   Mux PCmux_inst(
		     .Input_A(PCplus4),
		     .Input_B(PCtarget),
		     .Sel(PCSrc),
		     .Output(PCnext)
		     );


endmodule
