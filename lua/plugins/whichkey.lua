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
        ['h'] = { '<Cmd>nohlsearch<CR>', 'No Highlight' },
        ['q'] = { '<Cmd>q!<CR>', 'Quit' },
        ['z'] = { '<Cmd>Lazy<CR>', 'Lazy' },
        ['<CR>'] = { '<Cmd>FineCmdline<CR>', 'Fine Cmdline' },
        ['w'] = { '<C-w>', 'window' },

        d = {
          name = 'DAP',
          b = { '<Cmd>lua require"dap".toggle_breakpoint()<CR>', 'Toggle Breakpoint' },
          c = { '<Cmd>lua require"dap".continue()<CR>', 'Continue' },
          i = { '<Cmd>lua require"dap".step_into()<CR>', 'Step Into' },
          o = { '<Cmd>lua require"dap".step_over()<CR>', 'Step Over' },
          r = { '<Cmd>lua require"dap".repl.open()<CR>', 'Repl' },
          u = { '<Cmd>lua require"dap".step_out()<CR>', 'Step Out' },
        },

        f = {
          name = 'Find',
          b = { '<Cmd>Telescope file_browser<CR>', 'File Browser' },
          C = { '<Cmd>Telescope commands<CR>', 'Commands' },
          c = { '<Cmd>Telescope colorscheme<CR>', 'Colorscheme' },
          d = { '<Cmd>Telescope diagnostics<CR>', 'Document Diagnostics' },
          f = { '<Cmd>Telescope find_files<CR>', 'Find files' },
          h = { '<Cmd>Telescope help_tags<CR>', 'Find Help' },
          k = { '<Cmd>Telescope keymaps<CR>', 'Keymaps' },
          M = { '<Cmd>Telescope man_pages<CR>', 'Man Pages' },
          p = { '<Cmd>Telescope projects<CR>', 'Projects' },
          R = { '<Cmd>Telescope registers<CR>', 'Registers' },
          r = { '<Cmd>Telescope oldfiles<CR>', 'Open Recent File' },
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

        l = {
          name = 'LSP',
          a = 'Code Action',
          d = { '<Cmd>TroubleToggle<CR>', 'Trouble' },
          f = 'Format',
          i = { '<Cmd>LspInfo<CR>', 'Info' },
          j = { vim.diagnostic.goto_next, 'Next Diagnostic' },
          k = { vim.diagnostic.goto_prev, 'Prev Diagnostic' },
          l = { vim.lsp.codelens.run, 'CodeLens Action' },
          q = { vim.lsp.diagnostic.set_loclist, 'Quickfix' },
          r = 'Rename',
        },

        s = {
          name = 'Search',
          i = { '<Cmd>SearchBoxIncSearch<CR>', 'Include Serach' },
          m = { '<Cmd>SearchBoxMatchAll<CR>', 'Match All' },
          r = { '<Cmd>SearchBoxReplace<CR>', 'Replace' },
          s = { '<Cmd>SearchBoxSimple<CR>', 'Simple' },
        },
      }
      wk.setup(setup)
      wk.register(mappings, opts)
    end,
  },
}
