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

  -- Dap And Mason
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"

  -- Nvim Kickstart Plugins
  use "j-hui/fidget.nvim"
  use "folke/neodev.nvim"
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use "tpope/vim-sleuth"

  -- Testing
  use "rcarriga/nvim-notify"

  -- AI assistance
  use "github/copilot.vim"

  -- Cmdline
  use "MunifTanjim/nui.nvim"

  -- Colorschemes
  use "jadnw/nightwing.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "rockerBOO/boo-colorscheme-nvim"
  use "catppuccin/nvim"
  use "savq/melange"
  use "Julpikar/night-owl.nvim"
  use "eddyekofo94/bogster.nvim"
  use "luisiacc/gruvbox-baby"
  use "Shatur/neovim-ayu"
  use "rafamadriz/neon"
  use "yonlu/omni.vim"
  use "sainnhe/sonokai"
  use "sainnhe/edge"
  use "baliestri/aura-theme"
  use "aswathkk/DarkScene.vim"

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
  use "dmitmel/cmp-cmdline-history"
  use "hrsh7th/cmp-emoji"
  use "chrisgrieser/cmp-nerdfont"
  use "petertriho/cmp-git"
  use "hrsh7th/cmp-nvim-lsp-document-symbol"
  use "hrsh7th/cmp-nvim-lsp-signature-help"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Diagnostics
  use "folke/trouble.nvim"

  -- Font size updater
  use "ktunprasert/gui-font-resize.nvim"

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Keymaps
  use "folke/which-key.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Navigation
  use "kyazdani42/nvim-tree.lua"
  use "ahmedkhalf/project.nvim"
  use "goolord/alpha-nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use "nvim-telescope/telescope-ui-select.nvim"

  -- Project Management
  use "wakatime/vim-wakatime"

  -- Statusline
  use "windwp/windline.nvim"

  -- Snippets
  use "L3MON4D3/LuaSnip"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
  use "windwp/nvim-ts-autotag"

  -- Zen
  use "folke/zen-mode.nvim"

  -- Dependencies
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
