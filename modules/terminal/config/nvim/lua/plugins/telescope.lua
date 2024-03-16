local Util = require("lazyvim.util")
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fu", Util.telescope("lsp_references"), desc = "usages" },
    },
  },
}
