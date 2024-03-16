return {
  {
    "folke/flash.nvim",
    keys = function()
      return {
        {
          "S",
          mode = { "n", "o", "x" },
          function()
            require("flash").treesitter()
          end,
          desc = "Flash Treesitter",
        },
      }
    end,
  },
}
