vim.api.nvim_set_keymap("n", "<leader>s", ":SearchBoxIncSearch<CR>", { noremap = true })

vim.api.nvim_set_keymap("x", "<leader>s", ":SearchBoxIncSearch visual_mode=true<CR>", { noremap = true })
