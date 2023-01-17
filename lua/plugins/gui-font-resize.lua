return {
  {
    'ktunprasert/gui-font-resize.nvim',
    cmd = { 'GUIFontSizeUp', 'GUIFontSizeDown', 'GUIFontSizeSet' },
    keys = {
      { '<D-=>', '<Cmd>GUIFontSizeUp<CR>', desc = 'Scale Font Up' },
      { '<D-->', '<Cmd>GUIFontSizeDown<CR>', desc = 'Scale Font Down' },
      { '<D-0>', '<Cmd>GUIFontSizeSet<CR>', desc = 'Set Font Scale' },
    },
    opts = {
      default_size = 16,
      change_by = 1,
      bounds = {
        maximum = 32,
        minimum = 12,
      },
    },
  },
}
