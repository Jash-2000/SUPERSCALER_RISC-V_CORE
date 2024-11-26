`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

// Top most file added to introduce modularity and ease in debug of the code.
// Any External input (like interrupts and/or peripherals) to the core CPU unit should be added/configured here
module CPU_Top( input clk,reset );
	
	Single_Cycle_Top cpu_single_cycle_top(
					.clk(clk),
					.reset(reset)
				);
endmodule
