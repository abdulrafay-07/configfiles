-- options are automatically loaded before lazy.nvim startup
-- default options that are always set: https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/config/options.lua
-- add any additional options here

-- Soft-wrap long lines instead of letting them overflow horizontally.
vim.opt.wrap = true

-- linebreak     -> wrap at word boundaries instead of splitting words.
vim.opt.linebreak = true

-- breakindent   -> keep wrapped lines indented for better readability.
vim.opt.breakindent = true

vim.lsp.inlay_hint.enable(true)
