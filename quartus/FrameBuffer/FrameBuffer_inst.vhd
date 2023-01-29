	component FrameBuffer is
		port (
			clk_clk                   : in    std_logic                     := 'X';             -- clk
			colors_valid              : out   std_logic;                                        -- valid
			colors_data               : out   std_logic_vector(31 downto 0);                    -- data
			colors_ready              : in    std_logic                     := 'X';             -- ready
			pixel_clock_clk           : in    std_logic                     := 'X';             -- clk
			pixel_clock_reset_reset_n : in    std_logic                     := 'X';             -- reset_n
			pll_0_locked_export       : out   std_logic;                                        -- export
			reset_reset_n             : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk             : out   std_logic;                                        -- clk
			sdram_if_addr             : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_if_ba               : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_if_cas_n            : out   std_logic;                                        -- cas_n
			sdram_if_cke              : out   std_logic;                                        -- cke
			sdram_if_cs_n             : out   std_logic;                                        -- cs_n
			sdram_if_dq               : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_if_dqm              : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_if_ras_n            : out   std_logic;                                        -- ras_n
			sdram_if_we_n             : out   std_logic                                         -- we_n
		);
	end component FrameBuffer;

	u0 : component FrameBuffer
		port map (
			clk_clk                   => CONNECTED_TO_clk_clk,                   --               clk.clk
			colors_valid              => CONNECTED_TO_colors_valid,              --            colors.valid
			colors_data               => CONNECTED_TO_colors_data,               --                  .data
			colors_ready              => CONNECTED_TO_colors_ready,              --                  .ready
			pixel_clock_clk           => CONNECTED_TO_pixel_clock_clk,           --       pixel_clock.clk
			pixel_clock_reset_reset_n => CONNECTED_TO_pixel_clock_reset_reset_n, -- pixel_clock_reset.reset_n
			pll_0_locked_export       => CONNECTED_TO_pll_0_locked_export,       --      pll_0_locked.export
			reset_reset_n             => CONNECTED_TO_reset_reset_n,             --             reset.reset_n
			sdram_clk_clk             => CONNECTED_TO_sdram_clk_clk,             --         sdram_clk.clk
			sdram_if_addr             => CONNECTED_TO_sdram_if_addr,             --          sdram_if.addr
			sdram_if_ba               => CONNECTED_TO_sdram_if_ba,               --                  .ba
			sdram_if_cas_n            => CONNECTED_TO_sdram_if_cas_n,            --                  .cas_n
			sdram_if_cke              => CONNECTED_TO_sdram_if_cke,              --                  .cke
			sdram_if_cs_n             => CONNECTED_TO_sdram_if_cs_n,             --                  .cs_n
			sdram_if_dq               => CONNECTED_TO_sdram_if_dq,               --                  .dq
			sdram_if_dqm              => CONNECTED_TO_sdram_if_dqm,              --                  .dqm
			sdram_if_ras_n            => CONNECTED_TO_sdram_if_ras_n,            --                  .ras_n
			sdram_if_we_n             => CONNECTED_TO_sdram_if_we_n              --                  .we_n
		);

