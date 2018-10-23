`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 03:10:26 PM
// Design Name: 
// Module Name: Decoder_3to8_tb
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

module Decoder_3to8_tb( );
    // inputs
    reg      [2:0] in;
    reg            en;
    // outputs    
    wire     [7:0] Y;
    // local
    integer        i;
    
    decoder_3to8 uut ( Y, in, en );
     
    initial
    begin
        en = 1;
        in = 3'b0;
        i = 0;
        for(i = 0; i < 8; i = i + 1)
        begin
            #50
            in = in + 3'b001;
        end
        en = 0;
        in = 3'b0;
        i = 0;
        for(i = 0; i < 8; i = i + 1)
        begin
            #50
            in = in + 3'b001;
        end
    end
 
endmodule
