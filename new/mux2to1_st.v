`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2025 09:36:30 PM
// Design Name: 
// Module Name: mux2to1_st
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


module mux2to1_st(
    input [1:0] In,
    input S,
    output Out
    );
    
    wire x, y, z;
    and(x, In[1], S);
    not(z, S);
    and(y, In[0], z);
    or(Out, x, y);

endmodule
