local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  profile = {
    enable = true,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself

  -- AI assistance
  use("github/copilot.vim")
  use({
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require("cmp_tabnine.config")
      tabnine:setup({
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
      })
    end,
    after = "nvim-cmp",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  })

  -- AutoPairs
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

  -- Bufferline
  use("akinsho/bufferline.nvim")

  -- Colorschemes
  use("f-person/auto-dark-mode.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
  use("lunarvim/darkplus.nvim")
  use("catppuccin/nvim")
  use("savq/melange")
  use("Julpikar/night-owl.nvim")
  use("CantoroMC/ayu-nvim")
  use("rebelot/kanagawa.nvim")
  use("rockerBOO/boo-colorscheme-nvim")
  use("kwsp/halcyon-neovim")
  use("eddyekofo94/bogster.nvim")
  use("folke/tokyonight.nvim")
  use("marko-cerovac/material.nvim")
  use("sainnhe/everforest")
  use("shaeinst/roshnivim")
  use("shaeinst/roshnivim-cs")
  use("lvim-tech/lvim-colorscheme")
  use("rafamadriz/neon")
  use("bluz71/vim-nightfly-guicolors")

  -- Comments
  use("numToStr/Comment.nvim") -- Easily comment stuff

  -- Completion
  use({ "hrsh7th/nvim-cmp", commit = "d93104244c3834fbd8f3dd01da9729920e0b5fe7" }) -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- Icons
  use("kyazdani42/nvim-web-devicons")
  use("projekt0n/circles.nvim")

  -- Keymaps
  use("folke/which-key.nvim")

  -- LSP
  use ("williamboman/nvim-lsp-installer")
  use("neovim/nvim-lspconfig") -- enable LSP
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  })

  -- Notifications
  use("rcarriga/nvim-notify")

  -- MiniMap
  use("wfxr/minimap.vim")

  -- Project Management
  use("wakatime/vim-wakatime")
  use("ahmedkhalf/project.nvim")
  use("goolord/alpha-nvim")
  use("kyazdani42/nvim-tree.lua")

  -- Rust
  use("simrat39/rust-tools.nvim")
  use("rust-lang/rust.vim")

  -- Statusline
  use("windwp/windline.nvim")
  -- use("nvim-lualine/lualine.nvim")

  -- Snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- Spotify
  use("KadoBOT/nvim-spotify")

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope-file-browser.nvim")

  -- Terminal
  use("akinsho/toggleterm.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/playground")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("windwp/nvim-ts-autotag")

  -- UI
  use("MunifTanjim/nui.nvim")
  use("beauwilliams/focus.nvim")
  use("folke/zen-mode.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
