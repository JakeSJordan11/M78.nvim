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
  max_jobs = 10,
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- AI assistance
  use "github/copilot.vim"

  -- AutoPairs
  -- use "windwp/nvim-autopairs"

  -- Bufferline
  use "akinsho/bufferline.nvim"

  -- Colorschemes
  use "themercorp/themer.lua"
  use "EdenEast/nightfox.nvim"
  use "Mofiqul/adwaita.nvim"
  use "jadnw/nightwing.nvim"
  use "jadnw/gemstones.nvim"
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "catppuccin/nvim"
  use "savq/melange"
  use "Julpikar/night-owl.nvim"
  use "CantoroMC/ayu-nvim"
  use "ellisonleao/gruvbox.nvim"
  use "rebelot/kanagawa.nvim"
  use "rockerBOO/boo-colorscheme-nvim"
  use "kwsp/halcyon-neovim"
  use "eddyekofo94/bogster.nvim"
  use "folke/tokyonight.nvim"
  use "marko-cerovac/material.nvim"
  use "sainnhe/everforest"
  use "shaeinst/roshnivim"
  use "shaeinst/roshnivim-cs"
  use "lvim-tech/lvim-colorscheme"

  -- Comments
  use "numToStr/Comment.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "andersevenrud/cmp-tmux"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"

  -- Diagnostics
  use "folke/trouble.nvim"

  -- Debugging
  -- use "mfussenegger/nvim-dap"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Icons
  use "kyazdani42/nvim-web-devicons"
  use "projekt0n/circles.nvim"

  -- Keymaps
  use "folke/which-key.nvim"

  -- LSP
  use "williamboman/nvim-lsp-installer"
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"
  -- use "MunifTanjim/prettier.nvim"

  -- Notifications
  -- use "rcarriga/nvim-notify"

  -- MiniMap
  -- use "wfxr/minimap.vim"

  -- Lua
  -- use "ckipp01/stylua-nvim"

  -- Project Management
  use "wakatime/vim-wakatime"
  use "ahmedkhalf/project.nvim"
  use "goolord/alpha-nvim"
  -- use { "kyazdani42/nvim-tree.lua", tag = "nightly" }
  use "kyazdani42/nvim-tree.lua"

  -- Rust
  use "simrat39/rust-tools.nvim"
  use "rust-lang/rust.vim"
  use {
    "saecki/crates.nvim",
    tag = "v0.2.1",
    -- requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  }

  -- Statusline
  use "windwp/windline.nvim"
  -- use "nvim-lualine/lualine.nvim"

  -- Snippets
  -- use "rafamadriz/friendly-snippets"
  use "L3MON4D3/LuaSnip"

  -- Tabline
  -- use "nanozuki/tabby.nvim"

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
  use "https://git.sr.ht/~havi/telescope-toggleterm.nvim"
  use { "akinsho/toggleterm.nvim", tag = "v2.*" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  -- use "nvim-treesitter/playground"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  -- use "windwp/nvim-ts-autotag"
  -- use "nvim-treesitter/nvim-treesitter-textobjects"
  -- use "nvim-treesitter/nvim-treesitter-refactor"
  -- use "nvim-treesitter/nvim-treesitter-context"

  -- UI
  -- use "MunifTanjim/nui.nvim"
  use "beauwilliams/focus.nvim"
  use "folke/zen-mode.nvim"
  -- use {
  -- "folke/twilight.nvim",
  -- config = function()
  -- require("twilight").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  -- }
  -- end,
  -- }
  -- use "lukas-reineke/indent-blankline.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
