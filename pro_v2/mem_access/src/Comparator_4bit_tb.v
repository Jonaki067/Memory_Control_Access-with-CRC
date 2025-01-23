//-----------------------------------------------------------------------------
//
// Title       : Comparator_4bit_tb
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/Comparator_4bit_tb.v
// Generated   : Fri Jan 17 23:52:26 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {Comparator_4bit_tb}}

module Comparator_4bit_tb;

    // Inputs to the Comparator
    reg [3:0] A;  // First 4-bit number
    reg [3:0] B;  // Second 4-bit number

    // Outputs from the Comparator
    wire C;  // A < B
    wire D;  // A = B
    wire E;  // A > B

    // Instantiate the Comparator module
    Comparator_4bit uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E)
    );

    // Test Stimulus
    initial begin
        $monitor("Time: %0t | A: %b | B: %b | A<B: %b | A=B: %b | A>B: %b", 
                 $time, A, B, C, D, E);

        // Test Case 1: A = 0000, B = 0000
        A = 4'b0000; B = 4'b0000; #10;

        // Test Case 2: A = 0001, B = 0010
        A = 4'b0001; B = 4'b0010; #10;

        // Test Case 3: A = 1010, B = 1001
        A = 4'b1010; B = 4'b1001; #10;

        // Test Case 4: A = 1111, B = 1111
        A = 4'b1111; B = 4'b1111; #10;

        // Test Case 5: A = 0110, B = 1010
        A = 4'b0110; B = 4'b1010; #10;

        // Test Case 6: A = 1000, B = 0111
        A = 4'b1000; B = 4'b0111; #10;

        // Test Case 7: A = 0101, B = 1100
        A = 4'b0101; B = 4'b1100; #10;

        // Test Case 8: A = 1110, B = 1101
        A = 4'b1110; B = 4'b1101; #10;

        // Finish simulation
        $stop;
    end

endmodule