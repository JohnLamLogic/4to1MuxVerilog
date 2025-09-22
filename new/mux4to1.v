`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2025 04:52:54 PM
// Design Name: 
// Module Name: mux4to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux4to1(
    input [3:0] In,
    input [1:0] S,
    output Out
    );
    
    
    wire w0, w1;       // Intermediate outputs

    // First stage: two structural 2:1 muxes
    mux2to1_st m0 (
        .In({In[1], In[0]}),
        .S(S[0]),
        .Out(w0)
    );

    mux2to1_st m1 (
        .In({In[3], In[2]}),
        .S(S[0]),
        .Out(w1)
    );

    // Second stage: one dataflow 2:1 mux
    mux2to1_df m2 (
        .In0(w0),
        .In1(w1),
        .S(S[1]),
        .Out(Out)
    );
    
endmodule
