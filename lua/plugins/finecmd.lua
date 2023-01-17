return {
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    },
    lazy = false,
    config = function()
      require("fine-cmdline").setup()
      vim.keymap.set('n', '<leader><cr>', '<cmd>FineCmdline<CR>', { noremap = true })
    end
  }
}
