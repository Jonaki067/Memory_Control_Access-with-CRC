//-----------------------------------------------------------------------------
//
// Title       : XOR_
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/XOR_.v
// Generated   : Thu Jan 16 23:39:26 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps


module XOR (y,current,ans);	
	
	input [3:0] y;
	input [2:0]	current;
	output [2:0] ans;
	
	assign ans[0]  = current[0] ^ y[0]; 

	assign ans[1]  = current[1]  ^ y[1];
	assign ans[2]  = current[2]  ^ y[2];


//}} End of automatically maintained section

// Enter your statements here //

endmodule
