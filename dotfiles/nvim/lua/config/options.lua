vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt

opt.relativenumber = true  -- add relative line numbers
opt.expandtab = true       -- Use spaces instead of tabs
opt.cursorline = true      -- Enable highlighting of the current line
opt.termguicolors = true   -- enable termguicolors


require("tokyonight").load()


