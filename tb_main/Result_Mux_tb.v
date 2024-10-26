`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Result_Mux_tb;

    reg [31:0] ALUResult, ReadData, PC_Plus_4;
    reg [1:0]  ResultSrc;

    wire [31:0] Result;

    Result_Mux result_mux(
        .ALUResult(ALUResult),
        .ReadData(ReadData),
        .PC_Plus_4(PC_Plus_4),
        .ResultSrc(ResultSrc),
        .Result(Result)
    );

    initial begin
        ALUResult = 32'b001;
        ReadData = 32'b010;
        PC_Plus_4 = 32'b011;
        ResultSrc = 2'b00;
        #10;

        ResultSrc = 2'b01;
        #10;

        ResultSrc = 2'b10;
        #10;

        $finish;
    end
    initial begin
        $monitor("At time %t, Result=%b", $time, Result);
    end
    
endmodule
