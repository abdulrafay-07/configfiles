return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 3,
			max_width = 0.7,
			max_height = 0.6,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},
	},
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory (Oil)" },
		{
			"<leader>-",
			function()
				require("oil").open_float()
			end,
			desc = "Open Oil (float)",
		},
	},
}
