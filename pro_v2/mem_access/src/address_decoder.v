//-----------------------------------------------------------------------------
//
// Title       : address_decoder
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/address_decoder.v
// Generated   : Fri Jan 17 23:47:19 2025
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
//{module {address_decoder}}
module address_decoder ( address, decoded_address );

    input [2:0] address;
    wire [2:0] address;

    output [7:0] decoded_address;
    reg [7:0] decoded_address;

    always @(*) begin
        decoded_address = 8'b0;        // Default: no row active
        decoded_address[address] = 1; // Activate selected row
    end

endmodule


