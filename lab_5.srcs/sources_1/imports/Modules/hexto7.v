`timescale 1ns / 1ps

/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     hexto7.v
 * Project:       Lab_Assignment_?
 * Designer:      Garrett Cross
 * Email:         garrett.cross@student.csulb.edu
 * Rev. No.:      Version 1.0
 * Rev. Date:     9/30/18
 *
 * Purpose:       hex-to-7segment decoder for use with common anode display.
 *                Takes in 4-bit input X[3:0], outputs 7-bit Z[6:0]
 *
 ****************************************************************************/

module hexto7(X, Z);

    input      [3:0] X;
    output reg [6:0] Z;
    
    always @ (X)
        case (X)
            4'b0000 : Z = 7'b1000000 ;
            4'b0001 : Z = 7'b1111001 ;
            4'b0010 : Z = 7'b0100100 ;
            4'b0011 : Z = 7'b0110000 ;
            4'b0100 : Z = 7'b0011001 ;
            4'b0101 : Z = 7'b0010010 ;
            4'b0110 : Z = 7'b0000010 ;
            4'b0111 : Z = 7'b1011000 ;
            4'b1000 : Z = 7'b0000000 ;
            4'b1001 : Z = 7'b0010000 ;
            4'b1010 : Z = 7'b0001000 ;
            4'b1011 : Z = 7'b0000011 ;
            4'b1100 : Z = 7'b1000110 ;
            4'b1101 : Z = 7'b0100001 ;
            4'b1110 : Z = 7'b0000110 ;
            4'b1111 : Z = 7'b0001110 ;
            default : Z = 7'b0111111 ;           
        endcase
        
endmodule
