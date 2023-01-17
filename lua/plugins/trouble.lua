return {
  { 'folke/trouble.nvim',
    opts = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>ld', '<cmd>TroubleToggle<cr>', { silent = true })
    end
  }
}
