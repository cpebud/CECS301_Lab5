`timescale 1ns / 100ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     RegisterFile_tb.v
 * Project:       Lab_Assignment_?
 * Designer:      Garrett Cross
 * Email:         garrett.cross@student.csulb.edu
 * Rev. No.:      Version 1.0
 * Rev. Date:     10/15/18
 *
 * Purpose:       To test the inputs and outputs of the register_file.v
 * 
 * Dependencies:  register_file.v, reg16.v, decoder_3to8.v         
 *
 ****************************************************************************/

module RegisterFile_tb ( );
    reg         clk, reset, we;
    reg  [15:0] W;
    reg  [2:0]  W_addr, R_addr, S_addr;
    
    wire [15:0] R, S;
    
    integer     i, j, k;
    
    register_file uut ( clk, reset, W, we, W_addr, R_addr, S_addr, R, S );
    
    always #5 clk = ~clk;
    
    initial
    begin
        { i, j, k } = 0;
        clk = 0;
        reset = 0;
        we = 0;
        W = 0;
        W_addr = 0;
        R_addr = 0;
        S_addr = 0;
           
        @(negedge clk)
            reset = 1;
        @(negedge clk)
            reset = 0;
        for( i = 0 ; i < 4 ; i = i + 1 )
        begin
            @(negedge clk)
            begin
                R_addr = i;
                S_addr = i + 4; 
            end
        end
        
        @(negedge clk)
            R_addr = 0;
            S_addr = 0;
            
        
        for( j = 0 ; j < 8 ; j = j + 1 )
        begin
            @(negedge clk)
            begin
                we = 1;
                W_addr = j;
                W = ~j;
            end
        end
        
        @(negedge clk)
        begin
            we = 0;
            W = 0;
            W_addr = 0;
        end
            
       for( i = 0 ; i < 4 ; i = i + 1 )
       begin
           @(negedge clk)
           begin
               R_addr = i;
               S_addr = i + 4; 
           end
       end
       
       @(negedge clk)
       begin
           W_addr = 0;
           R_addr = 0;
           S_addr = 0;
       end        
    end 
    
endmodule    