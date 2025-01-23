//-----------------------------------------------------------------------------
//
// Title       : CRC
// Design      : mem_access
// Author      : Arpa
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : c:/My_Designs/pro_v2/mem_access/src/CRC.v
// Generated   : Wed Jan 15 23:25:22 2025
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
//{module {CRC}}

module CRC (clk ,poly, zeroes , data_in, crc_out);   
	
  input clk;          // Clock signal         
  input [2:0]zeroes ;
  input [3:0]data_in ; 
  input [3:0]poly ;
  output [2:0]crc_out;
  
  
  reg [2:0] q1, q2, q3, q4, q5, q6, q7, q8, q9;
  reg pop,pop1, pop2, pop3, pop4, pop5, pop6, pop7, pop8, pop9;
  reg [3:0] inter,y,y1, y2, y3, y4, y5, y6, y7, y8, y9;
  reg [2:0] ans,ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8;
  
  assign inter[0] = poly[0]; 
  assign inter[1] = poly[1];
  assign inter[2] = poly[2];
  
  
  LeftShiftRegister lr (clk, zeroes , zeroes[0], q1, pop) ; //initialize with zeroes   
  
  
  LeftShiftRegister lr1 (clk, q1 , data_in[3], q2, pop1) ;
  assign y = pop1 ? inter: zeroes;
  XOR xor1 (y,q2,ans);	   

  LeftShiftRegister lr2 (clk, ans ,  data_in[2], q3, pop2) ;
  assign y1 = pop2 ? inter: zeroes;
  XOR  xor2 (y1,q3,ans1);	  	   
   
  LeftShiftRegister lr3 (clk, ans1,  data_in[1], q4, pop3) ;
  assign y2 = pop3 ? inter: zeroes;
  XOR xor3 (y2,q4,ans2);	  
   
  LeftShiftRegister lr4 (clk, ans2 , data_in[0], q5, pop4) ;
  assign y3 = pop4 ? inter: zeroes;
  XOR xor4 (y3,q5,ans3);
 
  
  LeftShiftRegister lr5 (clk, ans3 , zeroes[2], q6, pop5) ;
  assign y4 = pop5 ? inter: zeroes;
  XOR xor5 (y4,q6,ans4);	  
	
  LeftShiftRegister lr6 (clk, ans4 , zeroes[1], q7, pop6) ;
  assign y5 = pop6 ? inter: zeroes;
  XOR xor6 (y5,q7,ans5);	 
  
  LeftShiftRegister lr7 (clk, ans5,  zeroes[1],  q8, pop7) ;
  assign y6 = pop7 ? inter: zeroes;
  XOR xor7 (y6,q8,ans6);	
  
  assign crc_out = ans6;
  
  
  

endmodule