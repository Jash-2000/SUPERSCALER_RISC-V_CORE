`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module four_bit_multiplier (
    input [3:0] A,        	// 4-bit input A
    input [3:0] B,        	// 4-bit input B
    output reg [3:0] P     // 4-bit product output (assuming the output is no greater than 15)
);

integer i;

always @(*) begin
    P = 3'b0; // Initialize product to 0

    // Perform multiplication using shift and add
    for (i = 0; i < 4; i = i + 1) begin
        if (B[i]) begin
            P = P + (A << i); // Shift A by i and add to P
        end
    end
end

endmodule
