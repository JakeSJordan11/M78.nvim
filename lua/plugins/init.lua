return {
  'nvim-lua/plenary.nvim',
  {
    'nvim-tree/nvim-web-devicons',
    config = { default = true },
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    config = true,
  },
}
