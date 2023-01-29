module PixelGenerator(
    input clock,
    input InFrame,
    input [31:0] colors_data,
    input [31:0] Horz_Count,
    input [31:0]  Vert_Count,
    output [7:0] VGA_B,
    output [7:0] VGA_G,
    output [7:0] VGA_R,
    output       VGA_HS,
    output		 VGA_VS
);
`define p480        //We are defining we want to use all the parameters outlined in p1080
`include "parameters.svh"


//Sets the colors, if we are on screen then set to color_data otherwise No color

assign VGA_B[7:0] = InFrame ? colors_data[23:16] : 8'h00;
assign VGA_G[7:0] = InFrame ? colors_data[15:8] : 8'h00;
assign VGA_R[7:0] = InFrame ? colors_data[7:0] : 8'h00;


//Check, added not here to flip from low to high to high to low
assign VGA_HS = !((Horz_Count > h_act + HFP) && (Horz_Count <= h_act + HFP + h_sync));
assign VGA_VS = !((Vert_Count > v_act + VFP) && (Vert_Count <= v_act + VFP + v_sync));

endmodule