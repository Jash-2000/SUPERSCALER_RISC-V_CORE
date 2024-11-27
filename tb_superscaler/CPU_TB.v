`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module CPU_TB();

reg clk = 0, reset;     // Inputs to the system
integer clk_cnt=0;        // Process Variable to count the number of clock pulses. 

// Wires decalred for simulation purpose.
wire [31:0] PC, Instr;
wire SSSrc;
wire [1:0] ImmSrc;
wire [31:0] reg_0, reg_1, reg_2, reg_3, reg_4;
wire [31:0] RAM_0, RAM_1, RAM_25;
wire [31:0] ALU_Src_A, ALU_Src_B, ALU_Result;
wire [3:0] ALU_Control;

always #10 clk = ~clk;

// Assigning the wires in TB to their RTL equivalents.
assign PC = DUT.cpu_single_cycle_top.Datapath.PC;           // Program Counter by byte
assign RAM_0 = DUT.cpu_single_cycle_top.Data_Memory.RAM['d0]; // Admin key
assign RAM_1 = DUT.cpu_single_cycle_top.Data_Memory.RAM['d1]; // Pass Key
assign RAM_25 = DUT.cpu_single_cycle_top.Data_Memory.RAM['d25]; // Exit Value Memory Space
assign reg_0 = DUT.cpu_single_cycle_top.Register_inst.REG_MEM_BLOCK[5'b00000]; // Useful Information for Exit operations
assign reg_1 = DUT.cpu_single_cycle_top.Register_inst.REG_MEM_BLOCK[5'b00001];
assign reg_2 = DUT.cpu_single_cycle_top.Register_inst.REG_MEM_BLOCK[5'b00010];
assign reg_3 = DUT.cpu_single_cycle_top.Register_inst.REG_MEM_BLOCK[5'b00011];
assign reg_4 = DUT.cpu_single_cycle_top.Register_inst.REG_MEM_BLOCK[5'b00100];
assign Instr = DUT.cpu_single_cycle_top.Instr_Memory.RD;
assign SSSrc = DUT.cpu_single_cycle_top.Instr_Memory.SSSrc;
assign ImmSrc = DUT.cpu_single_cycle_top.Datapath.Extend_inst.ImmSrc;
assign ALU_Src_A = DUT.cpu_single_cycle_top.Datapath.ALU_Unit_inst.SrcA;
assign ALU_Src_B = DUT.cpu_single_cycle_top.Datapath.ALU_Unit_inst.SrcB;
assign ALU_Result = DUT.cpu_single_cycle_top.Datapath.ALU_Unit_inst.ALUResult;
assign ALU_Control = DUT.cpu_single_cycle_top.Datapath.ALU_Unit_inst.ALUControl;

CPU_Top DUT(
	.clk(clk),
	.reset(reset)
);

  
initial begin
    reset = 0; 
    #20; reset = 1; 
    #20; reset = 0;
end


always@(posedge clk)  begin    
    clk_cnt = clk_cnt + 1;
    if(RAM_25 == 'd25) begin     
        $stop;
    end
end

endmodule