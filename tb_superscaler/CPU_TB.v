`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module CPU_TB();

reg clk = 0, reset;     // Inputs to the system
integer clk_cnt=0, stop_flag=0;        // Process Variable to count the number of clock pulses. 

// Wires decalred for simulation purpose.
wire [31:0] WriteData, DataAddr;
wire MemWrite;
wire [31:0] PC, Instr;
wire [31:0] RAM_0, reg_0;

always #10 clk = ~clk;

// Assigning the wires in TB to their RTL equivalents.
assign PC = DUT.cpu_single_cycle_top.Datapath.PC;

CPU_Top DUT(
	.clk(clk),
	.reset(reset)
);
  
initial begin
    #20; reset = 0; 
    #20; reset = 1; 
    #20; reset = 0;
end


always@(posedge clk)  begin
    if (stop_flag == 1) begin
        $stop;
    end
    
    clk_cnt = clk_cnt + 1;
    
    if(PC == 'd64) begin       
        stop_flag <= 1; // Our custom design's instruction memory(ROM) is supposed to be of size (16 X 32) bits only i.e. 16 instructions of size 32.
    end
end

endmodule