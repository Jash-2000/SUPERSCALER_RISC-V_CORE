`timescale 1ns / 1ps

/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */


module Main_Decoder_tb;
    reg [6:0] op;
    wire [1:0] ResultSrc;
    wire MemWrite, Branch, ALUSrc, RegWrite, Jump;
    wire [1:0] ImmSrc, ALUop;

    Main_Decoder main_decoder(
        .op(op),
        .ResultSrc(ResultSrc),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .ImmSrc(ImmSrc),
        .ALUop(ALUop)
    );

    initial begin
        op = 7'b0110011;
        #10;

        op = 7'b0010011;
        #10;

        op = 7'b0000011;
        #10;

        $finish;
    end

    initial begin
        $monitor("At time %t, ResultSrc=%b, MemWrite=%b, Branch=%b, ALUSrc=%b, RegWrite=%b, Jump=%b, ImmSrc=%b, ALUop=%b",
                 $time, ResultSrc, MemWrite, Branch, ALUSrc, RegWrite, Jump, ImmSrc, ALUop);
    end
endmodule
