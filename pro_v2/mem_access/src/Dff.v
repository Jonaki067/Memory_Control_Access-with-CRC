//-----------------------------------------------------------------------------
//
// Title       : Dff
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/Dff.v
// Generated   : Sun Jan 12 02:50:01 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps



module Dff(d, clk, q, q_bar);

  input d, clk;
  output reg q, q_bar;

  always @(posedge clk)
  begin
      q <= d;         // Non-blocking assignment for sequential logic
      q_bar <= ~d;    // Complement of q assigned to q_bar
  end

endmodule


//}} End of automatically maintained section

// Enter your statements here //

