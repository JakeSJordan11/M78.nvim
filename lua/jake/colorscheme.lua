local themes = {
  aurora     = "aurora",
  ayu        = "ayu",
  blue       = "blue",
  bogster    = "bogster",
  catppuccin = "catppuccin",
  codemonkey = "codemonkey",
  darkblue   = "darkblue",
  darkplus   = "darkplus",
  default    = "default",
  delek      = "delek",
  desert     = "desert",
  elflord    = "elflord",
  evening    = "evening",
  everforest = "everforest",
  gruvbox    = "gruvbox",
  halcyon    = "halcyon",
  industry   = "industry",
  kanagawa   = "kanagawa",
  koehler    = "koehler",
  lunar      = "lunar",
  lvim       = "lvim",
  material   = "material",
  melange    = "melange",
  morning    = "morning",
  murphy     = "murphy",
  night_owl  = "night-owl",
  nightfly   = "nightfly",
  none       = "none",
  neon       = "neon",
  onedarker  = "onedarker",
  pablo      = "pablo",
  peachpuff  = "peachpuff",
  ron        = "ron",
  rvcs       = "rvcs",
  shine      = "shine",
  slate      = "slate",
  spacedark  = "spacedark",
  system76   = "system76",
  tokyonight = "tokyonight",
  tomorrow   = "tomorrow",
  torte      = "torte",
  zellner    = "zellner",
}

local colorscheme = themes.gruvbox

vim.api.nvim_set_var(colorscheme .. "_italic_comments", true)
vim.api.nvim_set_var(colorscheme .. "_italic_keywords", true)
vim.api.nvim_set_var(colorscheme .. "_italic_functions", true)
vim.api.nvim_set_var(colorscheme .. "_sidebars", { "qf", "vista_kind", "terminal", "packer" })
vim.api.nvim_set_var(colorscheme .. "_style", "night")

local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
  update_interval = 500,
  set_dark_mode = function()
    vim.opt.background = 'dark'
    vim.colorscheme = colorscheme
  end,
  set_light_mode = function()
    vim.opt.background = 'light'
    vim.colorscheme = colorscheme
  end,
})

auto_dark_mode.init()

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
