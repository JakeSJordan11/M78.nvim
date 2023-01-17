return {
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    },
    lazy = false,
    config = function()
      require("fine-cmdline").setup()
      vim.keymap.set('n', '<Leader><CR>', '<Cmd>FineCmdline<CR>', { noremap = true })
    end
  }
}
