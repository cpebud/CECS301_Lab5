`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     ad_mux.v
 * Project:       Lab_Assignment_?
 * Designer:      Garrett Cross
 * Email:         garrett.cross@student.csulb.edu
 * Rev. No.:      Version 1.0
 * Rev. Date:     10/08/18
 *
 * Purpose:       8-to-1 Multiplexer
 *          
 * Notes:         Designed for use as an address multiplexer 
 *                in a display controller.
 *
 ****************************************************************************/
 
module ad_mux( D7, D6, D5, D4, D3, D2, D1, D0, sel, Y );

    input      [3:0] D7, D6, D5, D4, D3, D2, D1, D0;
    input      [2:0] sel;
    
    output reg [3:0] Y;
    
    always @ ( sel )
        case ( sel )
            3'b000 : Y = D0;
            3'b001 : Y = D1;
            3'b010 : Y = D2;
            3'b011 : Y = D3;
            3'b100 : Y = D4;
            3'b101 : Y = D5;
            3'b110 : Y = D6;
            3'b111 : Y = D7;
            default: Y = 4'h0;
        endcase
         
endmodule
