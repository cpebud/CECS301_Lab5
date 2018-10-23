`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     addr_seq.v
 * Project:       Lab_Assignment_4
 * Designer:      
 * Email:         
 * Rev. No.:      Version 1.0
 * Rev. Date:     Current Rev. Date
 *
 * Purpose:       
 * 
 * Dependencies:  
 *         
 * Notes:         
 *
 ****************************************************************************/

module addr_seqr( clk, reset, addr );
    input clk, reset;
    output  reg [7:0] addr;
    
    always @ (posedge clk or reset)
        if (reset == 1'b1)
            addr = 8'h0;
        else
            addr = addr + 8'h1;
endmodule
