return {
  {
    'zbirenbaum/copilot.lua',
    dependencies = {
      {
        'zbirenbaum/copilot-cmp',
        config = true,
      },
    },
    lazy = false,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
