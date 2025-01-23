//-----------------------------------------------------------------------------
//
// Title       : d_flip_flop
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/d_flip_flop.v
// Generated   : Fri Jan 17 23:45:39 2025
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
//{module {d_flip_flop}}

module d_flip_flop ( clk, d, reset, enable, q );

    input clk;
    input d;
    input reset;
    input enable;
    output q;
    reg q;

    wire q_next;

    // Logic gates to compute next state
    assign q_next = (~reset & enable & d) | (~reset & ~enable & q);

    // Positive edge-triggered flip-flop
    always @(posedge clk) begin
        q <= q_next;
    end

endmodule

