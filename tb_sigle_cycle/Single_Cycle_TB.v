`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Single_Cycle_TB();

reg clk = 0, reset;
wire [31:0] WriteData, DataAddr;
wire MemWrite;
wire [31:0] PC, Instr;
integer clk_cnt, stop_flag = 0;
wire [31:0] RAM_0, reg_0;

always #10 clk = ~clk;

assign PC = DUT.PC;
assign Instr = DUT.Instr;
assign RAM_0 = DUT.Data_Memory.RAM[0];
assign reg_0 = DUT.core_top.Datapath.Register_inst.REG_MEM_BLOCK[0];
assign WriteData = DUT.WriteData;
assign DataAddr = DUT.DataAddr;
assign MemWrite = DUT.MemWrite;

Single_Cycle_Top DUT(
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
