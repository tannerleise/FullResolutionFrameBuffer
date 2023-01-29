	FrameBuffer u0 (
		.clk_clk                   (<connected-to-clk_clk>),                   //               clk.clk
		.colors_valid              (<connected-to-colors_valid>),              //            colors.valid
		.colors_data               (<connected-to-colors_data>),               //                  .data
		.colors_ready              (<connected-to-colors_ready>),              //                  .ready
		.pixel_clock_clk           (<connected-to-pixel_clock_clk>),           //       pixel_clock.clk
		.pixel_clock_reset_reset_n (<connected-to-pixel_clock_reset_reset_n>), // pixel_clock_reset.reset_n
		.pll_0_locked_export       (<connected-to-pll_0_locked_export>),       //      pll_0_locked.export
		.reset_reset_n             (<connected-to-reset_reset_n>),             //             reset.reset_n
		.sdram_clk_clk             (<connected-to-sdram_clk_clk>),             //         sdram_clk.clk
		.sdram_if_addr             (<connected-to-sdram_if_addr>),             //          sdram_if.addr
		.sdram_if_ba               (<connected-to-sdram_if_ba>),               //                  .ba
		.sdram_if_cas_n            (<connected-to-sdram_if_cas_n>),            //                  .cas_n
		.sdram_if_cke              (<connected-to-sdram_if_cke>),              //                  .cke
		.sdram_if_cs_n             (<connected-to-sdram_if_cs_n>),             //                  .cs_n
		.sdram_if_dq               (<connected-to-sdram_if_dq>),               //                  .dq
		.sdram_if_dqm              (<connected-to-sdram_if_dqm>),              //                  .dqm
		.sdram_if_ras_n            (<connected-to-sdram_if_ras_n>),            //                  .ras_n
		.sdram_if_we_n             (<connected-to-sdram_if_we_n>)              //                  .we_n
	);

