local Dictionary_file = {
  ["en-US"] = { vim.fn.getenv("HOME") .. "/.local/share/nvim/site/spell/en.utf-8.add" }, -- there is another way to find ~/.config/nvim ?
}

local function readFiles(files)
  local dict = {}
  for _, file in ipairs(files) do
    local f = io.open(file, "r")
    for l in f:lines() do
      table.insert(dict, l)
    end
  end
  return dict
end

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "typos", "cspell", "clangd", "ltex-ls" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          settings = {
            ltex = {
              dictionary = {
                ["en-US"] = readFiles(Dictionary_file["en-US"] or {}),
              },
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        ["*"] = { "typos", "cspell" },
      }
    }
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["*"] = { "typos" },
      }
    },
  },
}
