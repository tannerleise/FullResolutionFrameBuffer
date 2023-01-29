//PD Jtag to avalon master bridge (Good)
//FIFO    (Good, not sure if allow back pressure should be clicked)
//PLL     (SETUP) make sure to export clock1 to for the input to the external sd ram (this is the phase shifted clock)
//DMA     (SETUP, not sure if the width is right, just went for a number bigger than horz*vert*3)
//SDRAM   (SETUP)

//All the stuff in platform designer is looking pretty good I think
//---------------------------------------------------------------------------------------------------------------------
//Next steps now
//We need to hook everything up in the code



//NOTES FOR NEXT OFFICE HOURS
//We've made alot of progress, I still don't know if we are instatiated properly, I think we are good tho
//Now what really needs to get done is to see how we load the sd ram with our image and how to talk with all the dma
//registers.



module Lab7(
    input        CLOCK_50,
    input  [3:0] KEY,
    //-----------------------------------------
    //SDRAM
    //-----------------------------------------
    output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,
    //-----------------------------------------
    //VGA
    //-----------------------------------------
	output		 VGA_BLANK_N, //Must be Tied High ----
	output [7:0] VGA_B,       //Blue
	output		 VGA_CLK,     //This should be connected to pixel clock -------
	output [7:0] VGA_G,       //Green
	output       VGA_HS,      //Horizontal Sync
	output [7:0] VGA_R,       //Red
	output		 VGA_SYNC_N,  //This should be tied low ------
	output		 VGA_VS       //Vertical Sync
);
//Count holders
logic [31:0] Vert_Count;
logic [31:0] Horz_Count;

logic InFrame;
//Used for the pll
logic pll_locked;
logic buffer_pll_locked;
//VGA stuff
logic nsync = 1'b0;
logic blank = 1'b1;

//tying those high and low accordingly
assign VGA_SYNC_N = nsync;
assign VGA_BLANK_N = blank;

//Holders for FrameBuffer
logic colors_valid;
logic [31:0]colors_data;    //We want to used 


video_pll U0(.refclk(CLOCK_50), .rst(1'b0), .outclk_0(VGA_CLK), .locked(pll_locked)); //This is the pll that is used for the pixels

//Not sure if this is instatiated properly, confused about some of the signals with what they do
FrameBuffer U3(
		.clk_clk(CLOCK_50),                         //clk.clk
		.colors_valid(colors_valid),                //colors.valid
        .colors_data(colors_data),                  //32 bits of color data
		.colors_ready(InFrame),       				//This will tell us if we want data or not
		.pixel_clock_clk(VGA_CLK),                  //pixel_clock.clk
		.pixel_clock_reset_reset_n(KEY[0]),         //pixel_clock_reset.reset_n
		.pll_0_locked_export(buffer_pll_locked),    //pll_0_locked.export
		.reset_reset_n(KEY[0]),                     //reset.reset_n
		.sdram_clk_clk(DRAM_CLK),
		.sdram_if_addr(DRAM_ADDR),          
		.sdram_if_ba(DRAM_BA),     
		.sdram_if_cas_n(DRAM_CAS_N),   
		.sdram_if_cke(DRAM_CKE),         
		.sdram_if_cs_n(DRAM_CS_N),       
		.sdram_if_dq(DRAM_DQ),       
		.sdram_if_dqm({DRAM_UDQM, DRAM_LDQM}),   
		.sdram_if_ras_n(DRAM_RAS_N),  
		.sdram_if_we_n(DRAM_WE_N)
	);

//Count should be working, just changed the parameters and the logic for the sync pulses 
count U1(.clock(VGA_CLK), .reset_n(KEY[0]), .pll_locked(pll_locked), .Vert_Count(Vert_Count[31:0]), .Horz_Count(Horz_Count[31:0]), .InFrame(InFrame));

//--------------------
//There are edits that need to be made with this snazzy fella right here
//Added a colors_data input, not sure if thats right
//-------------------
PixelGenerator U2(.clock(VGA_CLK), .InFrame(InFrame), .colors_data(colors_data), .Horz_Count(Horz_Count), .Vert_Count(Vert_Count), .VGA_B(VGA_B), .VGA_G(VGA_G), .VGA_R(VGA_R), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS));

endmodule
