//-----------------------------------------------------------------------------
//
// Title       : CRC_bread
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/CRC_bread.v
// Generated   : Fri Jan 17 12:42:08 2025
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
//{module {CRC_bread}}


module CRC_bread ();

    reg clk;
    reg [3:0] poly, data_in;
	reg [2:0]  zeroes,crc_out;
   
    
    // Instantiate the CRC module  
		CRC crc (clk, poly,zeroes , data_in, crc_out);
   
    // Clock generation
    initial begin
        clk = 0;
        forever #4 clk = ~clk;
    end

    // Test cases
    initial begin
        poly = 4'b1001;  // Example polynomial
        zeroes = 4'b0000;
        data_in = 4'b1111;

      
        #70;
        $display("Data: %b, CRC: %b", data_in, crc_out);

        $stop;  // End simulation
    end

endmodule


