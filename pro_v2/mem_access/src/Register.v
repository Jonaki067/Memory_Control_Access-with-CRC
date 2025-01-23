//-----------------------------------------------------------------------------
//
// Title       : register
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/Register.v
// Generated   : Wed Jan 15 23:20:45 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {register}}

module register(clk, data, out );

  input clk;          // Clock signal        
  input [3:0]data ;
  output [3:0] out;     // Parallel data output (4-bit)
  
  wire d0, d1, d2, d3,q1_bar,q2_bar,q3_bar,q4_bar; 
  
 
  Dff dff1 (data[0], clk, d0, q1_bar);
  Dff dff2 (data[1], clk, d1, q2_bar);
  Dff dff3 (data[2], clk, d2, q3_bar);
  Dff dff4 (data[3], clk, d3, q4_bar);

  
  // Output of the shift register
  assign out = {d3, d2, d1, d0};
  
endmodule
//}} End of automatically maintained section


