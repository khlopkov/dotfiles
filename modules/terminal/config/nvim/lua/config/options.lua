vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt

opt.relativenumber = true -- add relative line numbers
vim.wo.number = true      -- Show focused line nubmer
opt.expandtab = true      -- Use spaces instead of tabs
opt.cursorline = true     -- Enable highlighting of the current line
opt.termguicolors = true  -- enable termguicolors
opt.spell = true          -- enable spellcheck

require("tokyonight").load()
