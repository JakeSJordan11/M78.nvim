return {
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    },
    lazy = false,
    config = function()
      require("fine-cmdline").setup()
    end
  }
}
