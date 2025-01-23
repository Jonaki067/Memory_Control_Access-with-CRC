//-----------------------------------------------------------------------------
//
// Title       : control_logic
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : D:/dsd/dsd_project_poly/pro_v2/mem_access/src/control_logic.v
// Generated   : Sun Jan 19 23:26:38 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module control_logic(
    input clk,             
    input reset,           
    input e,               
    input rw,               
    input k,               
    input y,               
    output reg [11:0] state, 
    output reg x,          
    output reg s1,         
    output reg s0,         
    output reg cmp,        
    output reg l,          
           
);

    reg [11:0] next_state;

    always @(*) begin
        next_state[0] = (state[0] & ~e) | state[11] ;  
        next_state[1] = (state[0] & e );                       
        next_state[2] = (state[1] & ~rw) | state[8];                       
        next_state[3] = state[2] ;                                                 
        next_state[4] = state[3] | ~k & state[6];                                                 
        next_state[5] = state[4] & y;                                                 
        next_state[6] = state[4] & ~y;
		next_state[7] = state[6] & k;  
		next_state[8] = state[1] & rw;    
		next_state[9] = state[7] ; 
		next_state[10] = state[7] ; 
		next_state[11] = state[9] | state[10]; 
		
        next_state = next_state & ~state; 
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= 7'b0000001; 
        else
            state <= next_state; 
    end

    always @(*) begin
        x = state[0] | state[4] | state[6] | state[9];                 
        s0 = state[2] | state[4] | state[5]| state[8]| state[9];     
        s1 = state[3] | state[5] | state[6] | state[9] | state[10];            
        l = state[1] | state[3] | state[8] | state[9];    
      
    end

endmodule

			 
