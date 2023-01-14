return {
  {
    'ktunprasert/gui-font-resize.nvim',
    cmd = { 'GUIFontSizeUp', 'GUIFontSizeDown', 'GUIFontSizeSet' },
    keys = {
      { '<C-=>', '<cmd>GUIFontSizeUp<CR>', desc = 'Scale Font Up' },
      { '<C-->', '<cmd>GUIFontSizeDown<CR>', desc = 'Scale Font Down' },
      { '<C-0>', '<cmd>GUIFontSizeSet<CR>', desc = 'Set Font Scale' },
    },
    opts = {
      default_size = 18,
      change_by = 1,
      bounds = {
        maximum = 32,
        minimum = 12,
      },
    },
  },
}
