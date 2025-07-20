return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>fu",
      function()
        require("fzf-lua").lsp_references()
      end,
      desc = "usages",
    },
  },
}
