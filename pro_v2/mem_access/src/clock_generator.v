//-----------------------------------------------------------------------------
//
// Title       : clock_generator
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/clock_generator.v
// Generated   : Fri Jan 17 23:46:31 2025
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
//{module {clock_generator}}

module clock_generator ( clk );

    output clk;
    reg clk;

    initial clk = 0;

    always #4 clk = ~clk;

endmodule
