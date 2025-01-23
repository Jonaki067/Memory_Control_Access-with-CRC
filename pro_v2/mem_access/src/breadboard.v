//-----------------------------------------------------------------------------
//
// Title       : breadboard
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps


module LeftShiftRegister_tb;

  // Testbench signals
  reg clk;                  // Clock signal
  reg din;                  // Serial input
  reg [3:0] prev;           // Previous state input
  wire [3:0] q;             // Parallel data output
  wire pop;                 // Serial output (pop)

  // Instantiate the LeftShiftRegister module
  LeftShiftRegister uut (
    clk,
    prev,
    din,
    q,
    pop
  );

  // Clock generation (toggle every 5 time units)
  always #5 clk = ~clk;

  // Testbench initialization
  initial begin
    // Initialize signals
    clk = 0;
    //din = 0;
    //prev = 4'b0000;

    // Display header for simulation
    $display("Time\tclk\tdin\tprev\t\tq\tpop");

    // Test case 1: Apply a serial input and observe shifts
    #10 din = 1; prev = 4'b1010;  // Apply new `prev` value and serial input
   // #10 din = 0; prev = 4'b0101;                  // Change serial input
   // #10 din = 1; prev = 4'b1010;  // Update `prev` again and change serial input
    //#10 din = 1;

    // Test case 2: Hold the serial input constant and observe shifting
  //  #20 din = 0;                  // Keep `din` 0 to observe behavior

    // Finish simulation
    #20 $finish;
  end

  // Monitor and display signal values
  always @(posedge clk) begin
    $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, din, prev, q, pop);
  end

endmodule
