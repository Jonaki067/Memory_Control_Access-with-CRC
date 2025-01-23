//-----------------------------------------------------------------------------
//
// Title       : ram_8x4
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/ram_8x4.v
// Generated   : Fri Jan 17 23:49:41 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {ram_8x4}}

module ram_8x4 ( clk, reset, address, data_in, write_enable, read_enable, data_out );

    input clk;
    wire clk;

    input reset;
    wire reset;

    input [2:0] address;
    wire [2:0] address;

    input [3:0] data_in;
    wire [3:0] data_in;

    input write_enable;
    wire write_enable;

    input read_enable;
    wire read_enable;

    output [3:0] data_out;
    wire [3:0] data_out;

    // Internal signals
    wire [7:0] address_decoder_out;
    wire [31:0] flip_flop_outputs;
    wire [31:0] flip_flop_enable;
    reg [3:0] read_data;

    // Address Decoder Instantiation (Positional Mapping)
    address_decoder dec_inst (address, address_decoder_out);

    // D Flip-Flop Instantiations (Positional Mapping)
    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin : ROW
            for (j = 0; j < 4; j = j + 1) begin : COLUMN
                assign flip_flop_enable[i * 4 + j] = write_enable & address_decoder_out[i];
                d_flip_flop dff_inst (
                    clk, 
                    data_in[j], 
                    reset, 
                    flip_flop_enable[i * 4 + j], 
                    flip_flop_outputs[i * 4 + j]
                );
            end
        end
    endgenerate

    // Read Logic
    always @(*) begin
        if (read_enable) begin
            read_data[0] = flip_flop_outputs[address * 4 + 0];
            read_data[1] = flip_flop_outputs[address * 4 + 1];
            read_data[2] = flip_flop_outputs[address * 4 + 2];
            read_data[3] = flip_flop_outputs[address * 4 + 3];
        end else begin
            read_data = 4'bz; // High-impedance when read is disabled
        end
    end

    assign data_out = read_data;

endmodule

