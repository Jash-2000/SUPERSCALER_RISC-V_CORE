`timescale 1ns / 1ps
/*
 * Source code for RISC-V Architecture, ECE 224A - VLSI PROJECT DESIGN - UCSB Fall 2024
 * Developed by Team 10 - Parth Kulkarni, Jash Shah, Oindrila Chatterjee
 */

module Register_File_tb;

   reg clk = 0;
   reg WE3;
   reg [4:0] RA1;
   reg [4:0] RA2;
   reg [4:0] WA3;
   reg [31:0] WD3;
   wire [31:0] RD1;
   wire [31:0] RD2;

   always #5 clk = ~clk;

   Register_File Register_File_tb_inst (.clk(clk), 
					.WE3(WE3), 
					.RA1(RA1), 
					.RA2(RA2), 
					.WA3(WA3), 
					.WD3(WD3), 
					.RD1(RD1), 
					.RD2(RD2));

   initial begin
      WE3 = 1;
      WA3 = 5'b00001;
      WD3 = 32'd12345678;
      #10;
      RA1 = 5'b00001;
      RA2 = 5'b00001;
      #10;
      WE3 = 1;
      WA3 = 5'b00010;
      WD3 = 32'd87654321;
      #10;
      RA1 = 5'b00010;
      RA2 = 5'b00010;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, RD1 = %d, RD2 = %d", $time, RD1, RD2);
   end

endmodule

