`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Single_Cycle_TB();

reg clk = 0, reset;
wire [31:0] WriteData, DataAddr;
wire MemWrite;
wire [31:0] PC, Instr, ReadData;
integer clk_cnt = 0;

always #10 clk = ~clk;

Single_Cycle_Top DUT(
	.clk(clk),
	.reset(reset),
	.WriteData(WriteData),
	.DataAddr(DataAddr),
	.MemWrite(MemWrite),
	.PC(PC),
	.Instr(Instr),
	.ReadData(ReadData)
);
  
initial begin
    #20; reset = 0; 
    #20; reset = 1; 
	#20; reset = 0;
end


always@(posedge clk)  begin
    clk_cnt = clk_cnt + 1;
    if(clk_cnt == 18) begin
        $stop;
    end
end

endmodule
