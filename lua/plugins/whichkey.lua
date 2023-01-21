return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require 'which-key'
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

      local setup = {
        window = {
          border = 'rounded',
          position = 'top',
          margin = { 2, 6, 0, 6 },
        },
        layout = {
          align = 'center',
        },
      }

      local opts = {
        mode = 'n',
        prefix = '<Leader>',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      }

      local mappings = {
        ['A'] = { '<Cmd>Alpha<CR>', 'Alpha' },
        ['b'] = { '<Cmd>Telescope buffers<CR>', 'Buffers' },
        ['c'] = { '<Cmd>bdelete!<CR>', 'Close Buffer' },
        ['m'] = { '<Cmd>Mason<CR>', 'Mason' },
        ['z'] = { '<Cmd>Lazy<CR>', 'Lazy' },

        f = {
          name = 'Find',
          b = { '<Cmd>Telescope file_browser<CR>', 'Files with file browser' },
          C = { '<Cmd>Telescope commands<CR>', 'Commands' },
          c = { '<Cmd>Telescope colorscheme<CR>', 'Colorschemes' },
          d = { '<Cmd>Telescope diagnostics<CR>', 'Document diagnostics' },
          f = { '<Cmd>Telescope find_files<CR>', 'Files' },
          h = { '<Cmd>Telescope help_tags<CR>', 'Help' },
          k = { '<Cmd>Telescope keymaps<CR>', 'Keymaps' },
          M = { '<Cmd>Telescope man_pages<CR>', 'Man Pages' },
          p = { '<Cmd>Telescope projects<CR>', 'Projects' },
          R = { '<Cmd>Telescope registers<CR>', 'Registers' },
          r = { '<Cmd>Telescope oldfiles<CR>', 'Recent Files' },
          t = { '<Cmd>Telescope live_grep<CR>', 'Find Text' },
        },

        g = {
          name = 'Git',
          b = { '<Cmd>Telescope git_branches<CR>', 'Checkout branch' },
          c = { '<Cmd>Telescope git_commits<CR>', 'Checkout commit' },
          d = { '<Cmd>DiffviewOpen<CR>', 'Diff' },
          f = { '<Cmd>Telescope git_files<CR>', 'Git files' },
          g = {
            function()
              lazygit:toggle()
            end,
            'Lazygit',
          },
          J = { '<Cmd>Gitsigns next_hunk<CR>', 'Next Hunk' },
          k = { '<Cmd>Gitsigns prev_hunk<CR>', 'Prev Hunk' },
          L = { '<Cmd>Gitsigns blame_line<CR>', 'Blame' },
          n = { '<Cmd>Gitsigns toggle_numhl<CR>', 'Toggle Number Highlight' },
          o = { '<Cmd>Telescope git_status<CR>', 'Open changed file' },
          P = { '<Cmd>Gitsigns preview_hunk<CR>', 'Preview Hunk' },
          R = { '<Cmd>Gitsigns reset_hunk<CR>', 'Reset Hunk' },
          r = { '<Cmd>Gitsigns reset_buffer<CR>', 'Reset Buffer' },
          S = { '<Cmd>Gitsigns stage_hunk<CR>', 'Stage Hunk' },
          s = { '<Cmd>Gitsigns toggle_signs<CR>', 'Toggle Signs' },
          U = { '<Cmd>Gitsigns undo_stage_hunk<CR>', 'Undo Stage Hunk' },
        },
      }
      wk.setup(setup)
      wk.register(mappings, opts)
    end,
  },
}
