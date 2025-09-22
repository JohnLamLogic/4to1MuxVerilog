`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2025 04:09:39 PM
// Design Name: 
// Module Name: mux2to1_df
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


module mux2to1_df(
    input In0,
    input In1,
    input S,
    output Out
    );
    
    assign Out = (S) ? In1 : In0;
    
endmodule
