//-----------------------------------------------------------------------------
//
// Title       : shift_reg
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/shift_reg.v
// Generated   : Sun Jan 12 02:51:57 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module LeftShiftRegister(clk, prev , din, q, pop);

  input clk;          // Clock signal
  input din;          // Serial data input
  input [2:0]prev ;
  output [2:0] q;     // Parallel data output (4-bit)
  output pop;
  wire d0, d1, d2, d3,q1_bar,q2_bar,q3_bar,q4_bar; 
  
  assign pop = prev[2];	
  
  Dff dff1 (din, clk, d0, q1_bar);
  Dff dff2 (prev[0], clk, d1, q2_bar);
  Dff dff3 (prev[1], clk, d2, q3_bar);
 

  
  // Output of the shift register
  assign q = { d2, d1, d0};
  
endmodule
