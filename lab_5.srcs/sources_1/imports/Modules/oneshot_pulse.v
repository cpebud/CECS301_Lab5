`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:     oneshot_pulse.v
 * Project:       Lab_Assignment_?
 * Designer:      Garrett Cross
 * Email:         garrett.cross@student.csulb.edu
 * Rev. No.:      Version 1.3
 * Rev. Date:     9/30/2018
 *
 * Purpose:       To provide a debounced, one-shot pulse to use in testing
 *                circuits. Debouncing is accomplished by sampling the 
 *                button input every clock pulse (2 ms) for 10 cycles 
 *                (20 ms total sampling time). Each clock pulse, the sample
 *                is shifted in and checked against previous samples. 
 *                If, after a low input, it receives 9 samples of high 
 *                input, it will output high, and on the 10th sample of
 *                high input will output low, ensuring a single pulse of
 *                the same clock period. 
 *
 * Dependencies:  500Hz Clock Input (2 ms period)
 *
 ****************************************************************************/

module oneshot_pulse( D_in, clk, reset, D_out );

    input   D_in, clk, reset;
    
    output  D_out;
    
    reg     q9, q8, q7, q6, q5, q4, q3, q2, q1, q0;
    
    always @ (posedge clk or posedge reset)
        if (reset == 1'b1)
            {q9,q8,q7,q6,q5,q4,q3,q2,q1,q0} <= 10'b0;
        else begin
            // shift in the new sample that's on the D-in input
            q9 <= q8; q8 <= q7; q7 <= q6; q6 <= q5; q5 <= q4;
            q4 <= q3; q3 <= q2; q2 <= q1; q1 <= q0; q0 <= D_in;
    end
        
    // create the debounced, one-shot output pulse
    assign D_out = !q9 & q8 & q7 & q6 & q5 &
                    q4 & q3 & q2 & q1 & q0;
                            
endmodule