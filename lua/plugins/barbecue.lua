local spec = {
  "utilyre/barbecue.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
}

function spec.config()
  require("barbecue").setup()
end

return spec
