return {
  { 'folke/trouble.nvim',
    opts = function()
      vim.keymap.set({ 'n', 'v' }, '<Leader>ld', '<Cmd>TroubleToggle<CR>', { silent = true })
    end
  }
}
