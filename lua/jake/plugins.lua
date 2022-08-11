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

  -- Bufferline
  use "akinsho/bufferline.nvim"

  -- Colorschemes
  use "jadnw/nightwing.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "rockerBOO/boo-colorscheme-nvim"
  use "catppuccin/nvim"
  use "savq/melange"
  use "Julpikar/night-owl.nvim"
  use "eddyekofo94/bogster.nvim"
  use "folke/tokyonight.nvim"
  use "sainnhe/everforest"

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

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Keymaps
  use "folke/which-key.nvim"

  -- LSP
  use "williamboman/nvim-lsp-installer"
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Navigation
  use "kyazdani42/nvim-tree.lua"
  use "ThePrimeagen/harpoon"
  use "ahmedkhalf/project.nvim"
  use "goolord/alpha-nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-ui-select.nvim"

  -- Project Management
  use "wakatime/vim-wakatime"

  -- Rust
  use "simrat39/rust-tools.nvim"
  use "rust-lang/rust.vim"
  use "saecki/crates.nvim"

  -- Statusline
  use "windwp/windline.nvim"

  -- Snippets
  use "L3MON4D3/LuaSnip"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag"

  -- Window Management
  use "beauwilliams/focus.nvim"

  -- Dependencies
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
