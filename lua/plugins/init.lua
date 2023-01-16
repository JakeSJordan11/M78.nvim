return {
  'nvim-lua/plenary.nvim',
  -- 'MunifTanjim/nui.nvim',
  {
    'nvim-tree/nvim-web-devicons',
    config = { default = true },
  },
  { 'nacro90/numb.nvim', event = 'BufReadPre', config = true },
  --[[ {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = true,
  }, ]]
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    enabled = true,
    config = { default = true }, -- same as config = true
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    config = true,
  },
}
