return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'VimEnter',
    opts = {
      suggestion = {
        accept = false,
        next = false,
        prev = false,
        auto_trigger = true,
      },
    },
  },
}
