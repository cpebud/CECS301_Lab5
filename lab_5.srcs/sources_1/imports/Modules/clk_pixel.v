`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     clk_pixel.v
 * Project:       Lab_Assignment_?
 * Designer:      Garrett Cross
 * Email:         garrett.cross@student.csulb.edu
 * Rev. No.:      Version 1.2.1
 * Rev. Date:     10/5/2018
 *
 * Purpose:       Clock Divider. Division is accomplished by using the 
 *                clock to cycle through a counter to a given value, 
 *                at which point the output goes high.
 *
 * Dependencies:  100MHz Clock Input
 *         
 * Notes:         Configured as a pixel clock for controlling 
 *                an 8-pixel display.
 *                Currently takes 100MHz clock input and outputs 480Hz clock
 *
 ****************************************************************************/

module clk_pixel( clk_in, reset, clk_out );
    
    input   clk_in,
            reset;
    
    output  clk_out;
    
    reg     clk_out;
    integer i;
    
    //******************************************************************//
    //  The following verilog code will "divide" an incoming clock      //
    //  by the 32-bit decimal value specified in the "if condition"     //
    //                                                                  //
    //  The value of the counter that counts the incoming clock ticks   //
    //  is equal to [ (Incoming Freq / Outgoing Freq) / 2 ]             //
    //******************************************************************//
    
    always @ (posedge clk_in or posedge reset) begin
        if (reset == 1'b1) begin
            i = 0;
            clk_out = 0;
        end
        // got a clock, so increment the counter and
        // test to see if half a period has elapsed
        else begin
            i = i + 1;
            if (i >= (100 * 10**6)/(2 * (480))) begin
                clk_out = ~clk_out;
                i = 0;
            end // if
        end // else
    end // always
     
endmodule