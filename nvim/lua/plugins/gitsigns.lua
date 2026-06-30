return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 150,
			virt_text_pos = "right_align",
		},

		current_line_blame_formatter = "<author> • <author_time:%Y-%m-%d> • <summary> • <abbrev_sha>",

		word_diff = true,

		preview_config = {
			border = "rounded",
		},
	},
}
