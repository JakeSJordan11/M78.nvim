return {
  {
    "VonHeikemen/searchbox.nvim",
    lazy = false,
    config = function()
      require("searchbox").setup()
      vim.keymap.set('n', '<leader>/', '<cmd>SearchBoxIncSearch<CR>', { noremap = true })
    end
  }
}
