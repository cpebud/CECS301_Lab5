`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     CECS301_Lab5.v
 * Project:       Lab_Assignment_5
 * Designer:      Garrett Cross
 *                Anton Massey
 * Email:         garrett.cross@student.csulb.edu
 *                LtheMagicMan@gmail.com
 * Rev. No.:      Version 1.0
 * Rev. Date:     10/18/18
 *
 * Purpose:       Register File connected to a Display Controller
 * 
 * Dependencies:  Clock Input, register_file.v, reg16.v, decoder_3to8.v, 
 *                display_ctrl.v, clk_pixel.v, pixel_ctrl.v, ad_mux.v,
 *                hexto7.v, clk_div.v, oneshot_pulse.v
 *         
 * Notes:         Clock input(clk) comes from 100MHz onboard clock,
 *                reset(reset) comes from button up, data in(W) comes from 
 *                a concatenation of 12-bits of 1s and switches 3-0, 
 *                write enable (we) comes from button down, 
 *                write address(W_addr) comes from switches 6-4, 
 *                R_addr comes from switches 15-13, S_addr comes from 
 *                switches 12-10, R is displayed to the upper 4 pixels,
 *                S is displayed to the lower 4 pixels
 *
 ****************************************************************************/

module CECS301_Lab5( clk, reset, W, we, W_addr, R_addr, S_addr, an, seg );

    input         clk, 
                  reset,
                  we;
    input  [3:0]  W;
    input  [2:0]  W_addr,
                  R_addr,
                  S_addr;
                
    output [7:0]  an;
    output [6:0]  seg;
    
    wire   [15:0] R, S;
    wire          clk_500Hz, oneshot;
    
    reg    [11:0] w_gnd = 12'hFFF;
    
    register_file RF0 ( .clk(clk),      
                        .reset(reset),  
                        .W({w_gnd, W}), 
                        .we(oneshot),    
                        .W_addr(W_addr), 
                        .R_addr(R_addr), 
                        .S_addr(S_addr), 
                        .R(R), 
                        .S(S) 
                      );
    
    display_ctrl  DC0 ( .D7(R[15:12]), 
                        .D6(R[11:8]),  
                        .D5(R[7:4]), 
                        .D4(R[3:0]),   
                        .D3(S[15:12]), 
                        .D2(S[11:8]), 
                        .D1(S[7:4]),   
                        .D0(S[3:0]),   
                        .clk(clk), 
                        .reset(reset), 
                        .an(an),       
                        .seg(seg) 
                      );
    
    clk_div       CD0 ( .clk_in(clk), 
                        .reset(reset), 
                        .clk_out(clk_500Hz) 
                      );
    
    oneshot_pulse OSP0 ( .D_in(we), 
                         .clk(clk_500Hz), 
                         .D_out(oneshot) 
                       );
    
endmodule
