`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     pixel_ctrl.v
 * Project:       Lab_Assignment_?
 * Designer:      Garrett Cross 
 *                Anton Massey
 * Email:         garrett.cross@student.csulb.edu
 * Rev. No.:      Version 1.0
 * Rev. Date:     10/4/18
 *
 * Purpose:       Pixel Controller for 8-pixel, 7-segment display with
 *                common anode. No inputs, each state cycles to the next, 
 *                which cycles the output to enable on pixel at a time while 
 *                simultaneously providing the seg_sel for the 8-to-1
 *                multiplexer Data_in selector. 
 *                First 8-bits of output [10:3] select the anode,
 *                the last 3-bits go to the mux.
 *
 * Dependencies:  480Hz Clock Input         
 *
 ****************************************************************************/

module pixel_ctrl( clk, reset, an[7:0], seg_sel[2:0] );
    
    input            clk, 
                     reset;
    
    output reg [7:0] an;
    output reg [2:0] seg_sel;
    
    reg        [2:0] D,
                     Q;
    
    //--------------------------//
    //  Next-State Combo Logic  //
    //--------------------------//
    always @ ( Q )
        case ( Q )
            3'b000 : D = 3'b001;
            3'b001 : D = 3'b010;
            3'b010 : D = 3'b011;
            3'b011 : D = 3'b100;
            3'b100 : D = 3'b101;
            3'b101 : D = 3'b110;
            3'b110 : D = 3'b111;
            3'b111 : D = 3'b000;
            default: D = 3'b000;
        endcase
    
    //------------------------//
    //  State Register Logic  //
    //------------------------//
    always @ (posedge clk or posedge reset)
        if (reset == 1'b1)
            Q = 3'b0;
        else
            Q = D;
            
    //---------------------//
    //  Ouput Combo Logic  //
    //---------------------//
    always @ ( Q )
        case ( Q )
            3'b000 : { an, seg_sel } = 11'b01111111111;
            3'b001 : { an, seg_sel } = 11'b10111111110;
            3'b010 : { an, seg_sel } = 11'b11011111101;
            3'b011 : { an, seg_sel } = 11'b11101111100;
            3'b100 : { an, seg_sel } = 11'b11110111011;
            3'b101 : { an, seg_sel } = 11'b11111011010;
            3'b110 : { an, seg_sel } = 11'b11111101001;
            3'b111 : { an, seg_sel } = 11'b11111110000;
            default: { an, seg_sel } = 11'b01111111111;
        endcase
            
endmodule
