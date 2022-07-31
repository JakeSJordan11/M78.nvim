--[[ require("gemstones").setup {
  gem = "apatite",
} ]]
-- values: "emerald" | "amber" | "apatite" | "crystal" | "diamond"| "kunzite" | "obsidian" | "ruby" | "sapphire" | "topaz"
-- local colorscheme = "none"
-- local colorscheme = "ayu"
-- local colorscheme = "adwaita"
-- local colorscheme = "bogster"
-- local colorscheme = "boo"
-- local colorscheme = "catppuccin"
-- local colorscheme = "codemonkey"
-- local colorscheme = "everforest"
-- local colorscheme = "gruvbox"
-- local colorscheme = "halcyon"
-- local colorscheme = "kanagawa"
-- local colorscheme = "lvim"
-- local colorscheme = "melange"
-- local colorscheme = "night-owl"
local colorscheme = "nightwing"
-- local colorscheme = "nightfox"
-- local colorscheme = "rvcs"
-- local colorscheme = "tokyonight"
-- local colorscheme = "gemstones"
-- local colorscheme = "system76"

-- vim.api.nvim_set_var(colorscheme .. "_italic_comments", true)
-- vim.api.nvim_set_var(colorscheme .. "_italic_keywords", true)
-- vim.api.nvim_set_var(colorscheme .. "_italic_functions", true)
-- vim.api.nvim_set_var(colorscheme .. "_sidebars", { "qf", "vista_kind", "terminal", "packer" })
-- vim.api.nvim_set_var(colorscheme .. "_style", "night")

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
