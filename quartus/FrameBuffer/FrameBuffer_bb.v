
module FrameBuffer (
	clk_clk,
	colors_valid,
	colors_data,
	colors_ready,
	pixel_clock_clk,
	pixel_clock_reset_reset_n,
	pll_0_locked_export,
	reset_reset_n,
	sdram_clk_clk,
	sdram_if_addr,
	sdram_if_ba,
	sdram_if_cas_n,
	sdram_if_cke,
	sdram_if_cs_n,
	sdram_if_dq,
	sdram_if_dqm,
	sdram_if_ras_n,
	sdram_if_we_n);	

	input		clk_clk;
	output		colors_valid;
	output	[31:0]	colors_data;
	input		colors_ready;
	input		pixel_clock_clk;
	input		pixel_clock_reset_reset_n;
	output		pll_0_locked_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_if_addr;
	output	[1:0]	sdram_if_ba;
	output		sdram_if_cas_n;
	output		sdram_if_cke;
	output		sdram_if_cs_n;
	inout	[15:0]	sdram_if_dq;
	output	[1:0]	sdram_if_dqm;
	output		sdram_if_ras_n;
	output		sdram_if_we_n;
endmodule
