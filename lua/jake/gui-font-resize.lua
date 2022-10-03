local options = {
  default_size = 24, -- absolute size it will fallback to when :GUIFontSizeSet is not specified
  change_by = 1, -- step value that will inc/dec the fontsize by
  bounds = {
    maximum = 32, -- maximum font size, when you try to set a size bigger than this it will default to max
    minimum = 8, -- any modification lower than 8 will spring back to 8
  },
}

require("gui-font-resize").setup({ options })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-=>", "<cmd>GUIFontSizeUp<CR>", opts)
vim.keymap.set("n", "<C-->", "<cmd>GUIFontSizeDown<CR>", opts)
vim.keymap.set("n", "<C-0>", "<cmd>GUIFontSizeSet<CR>", opts)
