//  This circuit is used to deassert reset synchronously. 
//  If a PLL is not used, tie the pll_locked input in the instantiation.

module reset (clock, ext_reset_n, pll_locked, reset_n);

input clock;
input ext_reset_n;		// Normally this is KEY[0]
input pll_locked;		// If PLL is used, waits until PLL is locked.  Must be logic 1 if not used.
output logic reset_n;	// Active low reset with synchronous deassertion (or release).

logic q0, q1, asynch_reset_n;
assign asynch_reset_n  = ext_reset_n & pll_locked;

always_ff @ (posedge clock, negedge asynch_reset_n)
    if (asynch_reset_n == 1'b0)
        begin
            q0 <= 1'b0;  q1 <= 1'b0;  reset_n <= 1'b0;
        end
    else
        begin
            q0 <= 1'b1;  q1 <= q0;  reset_n <= q1;
        end 

endmodule