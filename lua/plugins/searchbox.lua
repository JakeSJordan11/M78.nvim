return {
  {
    "VonHeikemen/searchbox.nvim",
    lazy = false,
    config = function()
      require("searchbox").setup()
      vim.keymap.set('n', '<Leader>/', '<Cmd>SearchBoxIncSearch<CR>', { noremap = true })
    end
  }
}
