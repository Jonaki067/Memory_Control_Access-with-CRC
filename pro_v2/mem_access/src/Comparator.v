//-----------------------------------------------------------------------------
//
// Title       : Comparator
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/Comparator.v
// Generated   : Fri Jan 17 23:50:46 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {Comparator_4bit}}

module Comparator_4bit (
    input [3:0] A,      // First 4-bit input
    input [3:0] B,      // Second 4-bit input
    output C,           // Output: A < B
    output D,           // Output: A = B
    output E            // Output: A > B
);

    // Internal signals for comparisons at each bit level
    wire [3:0] A_lt_B;  // A < B at each bit
    wire [3:0] A_gt_B;  // A > B at each bit
    wire [3:0] A_eq_B;  // A = B at each bit

    // Bit-by-bit comparison
    assign A_lt_B[3] = ~A[3] & B[3];  // MSB: A[3] < B[3]
    assign A_gt_B[3] = A[3] & ~B[3];  // MSB: A[3] > B[3]
    assign A_eq_B[3] = ~(A[3] ^ B[3]); // MSB: A[3] = B[3] (XNOR)

    assign A_lt_B[2] = ~A[2] & B[2];  // Bit 2: A[2] < B[2]
    assign A_gt_B[2] = A[2] & ~B[2];  // Bit 2: A[2] > B[2]
    assign A_eq_B[2] = ~(A[2] ^ B[2]); // Bit 2: A[2] = B[2]

    assign A_lt_B[1] = ~A[1] & B[1];  // Bit 1: A[1] < B[1]
    assign A_gt_B[1] = A[1] & ~B[1];  // Bit 1: A[1] > B[1]
    assign A_eq_B[1] = ~(A[1] ^ B[1]); // Bit 1: A[1] = B[1]

    assign A_lt_B[0] = ~A[0] & B[0];  // LSB: A[0] < B[0]
    assign A_gt_B[0] = A[0] & ~B[0];  // LSB: A[0] > B[0]
    assign A_eq_B[0] = ~(A[0] ^ B[0]); // LSB: A[0] = B[0]

    // Combine the results to determine overall comparison
    assign C = A_lt_B[3] | 
               (A_eq_B[3] & A_lt_B[2]) | 
               (A_eq_B[3] & A_eq_B[2] & A_lt_B[1]) | 
               (A_eq_B[3] & A_eq_B[2] & A_eq_B[1] & A_lt_B[0]);

    assign E = A_gt_B[3] | 
               (A_eq_B[3] & A_gt_B[2]) | 
               (A_eq_B[3] & A_eq_B[2] & A_gt_B[1]) | 
               (A_eq_B[3] & A_eq_B[2] & A_eq_B[1] & A_gt_B[0]);

    assign D = A_eq_B[3] & A_eq_B[2] & A_eq_B[1] & A_eq_B[0];

endmodule