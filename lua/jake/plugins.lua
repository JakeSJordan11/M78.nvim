local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  compile_path = vim.fn.stdpath "data" .. "/site/pack/loader/start/packer.nvim/plugin/packer.lua",
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  profile = {
    enable = true,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- AI assistance
  use "github/copilot.vim"
  use {
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
      }
    end,
    after = "nvim-cmp",
    run = "./install.sh",
  }

  -- AutoPairs
  use "windwp/nvim-autopairs"

  -- Bufferline
  use "akinsho/bufferline.nvim"

  -- Colorschemes
  use "ellisonleao/gruvbox.nvim"
  -- use("themercorp/themer.lua")

  -- Comments
  use "numToStr/Comment.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"

  -- Diagnostics
  use "folke/trouble.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Icons
  use "kyazdani42/nvim-web-devicons"
  use "projekt0n/circles.nvim"

  -- Keymaps
  use "folke/which-key.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"
  use "MunifTanjim/prettier.nvim"

  -- Notifications
  use "rcarriga/nvim-notify"

  -- MiniMap
  use "wfxr/minimap.vim"

  -- Lua
  use "ckipp01/stylua-nvim"

  -- Project Management
  use "wakatime/vim-wakatime"
  use "ahmedkhalf/project.nvim"
  use "goolord/alpha-nvim"
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    tag = "nightly",
  }

  -- Rust
  use "simrat39/rust-tools.nvim"
  use "rust-lang/rust.vim"
  use {
    "saecki/crates.nvim",
    tag = "v0.2.1",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  }

  -- Statusline
  use "windwp/windline.nvim"

  -- Snippets
  use "rafamadriz/friendly-snippets"
  use "L3MON4D3/LuaSnip"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "tami5/sqlite.lua" },
  }

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/playground"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag"

  -- UI
  use "MunifTanjim/nui.nvim"
  use "beauwilliams/focus.nvim"
  use "folke/zen-mode.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
