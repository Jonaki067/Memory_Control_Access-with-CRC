//-----------------------------------------------------------------------------
//
// Title       : Dff_tb
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/Dff_tb.v
// Generated   : Mon Jan 13 22:03:31 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
   `timescale 1ps / 1ps

module Dff_tb;

  // Testbench signals
  reg d;              // Data input
  reg clk;            // Clock signal
  wire q, q_bar;      // Outputs

  // Instantiate the D flip-flop
  Dff uut (  d,clk, q,q_bar );

  // Clock generation (toggle every 5 time units)
  always #10 clk = ~clk;

  // Testbench initialization
  initial begin
    // Initialize signals
    clk = 0;
    d = 0;

    // Display header for simulation
    $display("Time\tclk\td\tq\tq_bar");

    // Test case 1: Toggle d and observe q and q_bar
    #10 d = 1;  // Set d to 1
    #10 d = 0;  // Set d to 0
    #10 d = 1;  // Set d to 1
    #10 d = 1;  // Keep d as 1
    #10 d = 0;  // Set d to 0

    // Finish simulation
    #50 $finish;
  end

  // Monitor and display signal values
  always @(posedge clk) begin
    $display("%0t\t%b\t%b\t%b\t%b", $time, clk, d, q, q_bar);
  end

endmodule
