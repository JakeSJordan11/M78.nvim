local status_ok, zen = pcall(require, "zen-mode")
if not status_ok then
  return
end

zen.setup {
  window = {
    backdrop = 1,
    options = {
      number = false,
      relativenumber = false,
    },
  },
}

vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<cr>", { nowait = true, silent = true, noremap = true })
