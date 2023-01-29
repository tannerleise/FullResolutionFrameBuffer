//Count Works Properly in 1080p
module count(
    input clock,
    input reset_n,              //This will be KEY[0]
    input pll_locked,
    output [31:0] Vert_Count,
    output [31:0] Horz_Count,    //We need 11 bits to hold the Horz Counter 
    output logic InFrame               //A bit to tell us if we are in range
);

`define p720        //We are defining we want to use all the parameters outlined in p720
`include "parameters.svh"


logic [31:0]hcnt;
logic [31:0]vcnt;

logic [31:0] lenH = horz_length;
logic [31:0] lenV = vert_length;

logic reset_sync;

//May need to change the pll locked number since we are using a pll for the imput clock
reset U0(.clock(clock), .ext_reset_n(reset_n), .pll_locked(pll_locked), .reset_n(reset_sync));

always_ff @ (posedge clock, negedge reset_sync)
begin

if(reset_sync == 0)             //If reset button KEY[0] is pressed down
begin
    vcnt <= 0;             //Reset the counter value to 0
    hcnt <= 0;             //Reset the counter value to 0
end

else if(vcnt == lenV && hcnt == lenH)    
begin
    vcnt <= 0;
    hcnt <= 0;
    InFrame <= 1;
end

else if(hcnt == lenH)    
begin
    vcnt <= vcnt + 1;
    hcnt <= 0;
    //This controls when vcnt is off screen
    if(vcnt >= v_act)
       InFrame <= 0;
    else 
        InFrame <= 1;
end


//Did the equal because the counter went up to 1280 then at 1281 lowered, we want it to be 1280 it goes low at
else if(hcnt >= h_act)
begin 
    hcnt <= hcnt + 1;
    InFrame <= 0;
end


else if(vcnt > v_act)
begin
    hcnt <= hcnt + 1;
    InFrame <= 0;
end


else
begin
    InFrame <= 1;
    hcnt <= hcnt + 1; //Otherwise count up of the rising edge of the clock
end

end

assign Vert_Count [31:0] = vcnt [31:0]; 
assign Horz_Count [31:0] = hcnt[31:0]; 

endmodule