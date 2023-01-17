return {
  {
    'folke/which-key.nvim',
    lazy = false,
    config = function()
      local status_ok, which_key = pcall(require, 'which-key')
      if not status_ok then
        return
      end

      local setup = {
        operators = { gc = 'Comments' },
        key_labels = {
          ['<Leader>'] = 'LEADER',
        },
        window = {
          border = 'rounded', -- none, single, double, shadow, rounded
          position = 'top', -- bottom, top
          margin = { 2, 6, 0, 6 }, -- extra window margin [top, right, bottom, left]
        },
        layout = {
          align = 'center', -- align columns left, center or right
        },
      }

      local opts = {
        mode = 'n', -- NORMAL mode
        prefix = '<Leader>',
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      }

      local mappings = {
        ['A'] = { '<Cmd>Alpha<CR>', 'Alpha' },
        ['q'] = { '<Cmd>q!<CR>', 'Quit' },
        ['c'] = { '<Cmd>bdelete!<CR>', 'Close Buffer' },
        ['h'] = { '<Cmd>nohlsearch<CR>', 'No Highlight' },
        ['P'] = { '<Cmd>Telescope projects<CR>', 'Projects' },
        ['z'] = { '<Cmd>Lazy<CR>', 'Lazy' },

        d = {
          name = 'DAP',
          b = { '<Cmd>lua require"dap".toggle_breakpoint()<CR>', 'Toggle Breakpoint' },
          c = { '<Cmd>lua require"dap".continue()<CR>', 'Continue' },
          i = { '<Cmd>lua require"dap".step_into()<CR>', 'Step Into' },
          o = { '<Cmd>lua require"dap".step_over()<CR>', 'Step Over' },
          u = { '<Cmd>lua require"dap".step_out()<CR>', 'Step Out' },
          r = { '<Cmd>lua require"dap".repl.open()<CR>', 'Repl' },
        },

        f = {
          name = 'Find',
          b = { '<Cmd>Telescope buffers<CR>', 'Buffers' },
          c = { '<Cmd>Telescope colorscheme<CR>', 'Colorscheme' },
          d = { '<Cmd>Telescope diagnostics<CR>', 'Document Diagnostics' },
          e = { '<Cmd>Telescope file_browser<CR>', 'File Explorer' },
          f = { '<Cmd>Telescope find_files<CR>', 'Find files' },
          t = { '<Cmd>Telescope live_grep<CR>', 'Find Text' },
          h = { '<Cmd>Telescope help_tags<CR>', 'Find Help' },
          M = { '<Cmd>Telescope man_pages<CR>', 'Man Pages' },
          r = { '<Cmd>Telescope oldfiles<CR>', 'Open Recent File' },
          R = { '<Cmd>Telescope registers<CR>', 'Registers' },
          k = { '<Cmd>Telescope keymaps<CR>', 'Keymaps' },
          C = { '<Cmd>Telescope commands<CR>', 'Commands' },
        },

        g = {
          name = 'Git',
          g = { require 'utils.lazygit'.lazygit, 'Lazygit' },
          J = { '<Cmd>Gitsigns next_hunk<CR>', 'Next Hunk' },
          k = { '<Cmd>Gitsigns prev_hunk<CR>', 'Prev Hunk' },
          L = { '<Cmd>Gitsigns blame_line<CR>', 'Blame' },
          P = { '<Cmd>Gitsigns preview_hunk<CR>', 'Preview Hunk' },
          R = { '<Cmd>Gitsigns reset_hunk<CR>', 'Reset Hunk' },
          r = { '<Cmd>Gitsigns reset_buffer<CR>', 'Reset Buffer' },
          S = { '<Cmd>Gitsigns stage_hunk<CR>', 'Stage Hunk' },
          U = { '<Cmd>Gitsigns undo_stage_hunk<CR>', 'Undo Stage Hunk' },
          o = { '<Cmd>Telescope git_status<CR>', 'Open changed file' },
          b = { '<Cmd>Telescope git_branches<CR>', 'Checkout branch' },
          c = { '<Cmd>Telescope git_commits<CR>', 'Checkout commit' },
          f = { '<Cmd>Telescope git_files<CR>', 'Git files' },
          d = { '<Cmd>DiffviewOpen<CR>', 'Diff' },
          s = { '<Cmd>Gitsigns toggle_signs<CR>', 'Toggle Signs' },
          n = { '<Cmd>Gitsigns toggle_numhl<CR>', 'Toggle Number Highlight' },
        },

        l = {
          name = 'LSP',
          a = { vim.lsp.buf.code_action, 'Code Action' },
          f = { vim.lsp.buf.formatting, 'Format' },
          i = { '<Cmd>LspInfo<CR>', 'Info' },
          j = { vim.diagnostic.goto_next, 'Next Diagnostic' },
          k = { vim.diagnostic.goto_prev, 'Prev Diagnostic' },
          l = { vim.lsp.codelens.run, 'CodeLens Action' },
          q = { vim.lsp.diagnostic.set_loclist, 'Quickfix' },
          r = { vim.lsp.buf.rename, 'Rename' },
          s = { '<Cmd>Telescope lsp_document_symbols<CR>', 'Document Symbols' },
          S = { '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', 'Workspace Symbols' },
        },

        s = {
          name = 'Searchbox',
          s = { '<Cmd>SearchBoxSimple<CR>', 'Simple' },
          m = { '<Cmd>SearchBoxMatchAll<CR>', 'Match All' },
          i = { '<Cmd>SearchBoxIncSearch<CR>', 'Include Serach' },
          r = { '<Cmd>SearchBoxReplace<CR>', 'Replace' },
        },

        w = {
          name = 'Window',
          ['+'] = { '<Cmd>winCmd +<CR>', 'Increase height' },
          ['-'] = { '<Cmd>winCmd -<CR>', 'Decrease height' },
          ['='] = { '<Cmd>winCmd =<CR>', 'Equally high and wide' },
          ['>'] = { '<Cmd>winCmd ><CR>', 'Increase width' },
          ['|'] = { '<Cmd>winCmd |<CR>', 'Max out the width' },
          ['<'] = { '<Cmd>winCmd < <CR>', 'Decrease width' },
          h = { '<Cmd>winCmd h<CR>', 'Go to the left window' },
          j = { '<Cmd>winCmd j<CR>', 'Go to the down window' },
          k = { '<Cmd>winCmd k<CR>', 'Go to the right window' },
          l = { '<Cmd>winCmd l<CR>', 'Go to the up window' },
          q = { '<Cmd>winCmd q<CR>', 'Quit a window' },
          s = { '<Cmd>winCmd s<CR>', 'Split Window' },
          v = { '<Cmd>winCmd v<CR>', 'Split Window Vertacally' },
          w = { '<Cmd> winCmd w<CR>', 'Switch Windows' },
          x = { '<Cmd> winCmd x<CR>', 'Swap current with next' },
        },
      }
      which_key.setup(setup)
      which_key.register(mappings, opts)
    end,
  },
}
