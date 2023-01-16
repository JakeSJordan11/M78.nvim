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
          ['<leader>'] = 'LEADER',
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
        prefix = '<leader>',
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      }

      local mappings = {
        ['A'] = { '<cmd>Alpha<cr>', 'Alpha' },
        ['e'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
        ['q'] = { '<cmd>q!<CR>', 'Quit' },
        ['c'] = { '<cmd>bdelete!<CR>', 'Close Buffer' },
        ['h'] = { '<cmd>nohlsearch<CR>', 'No Highlight' },
        ['P'] = { '<cmd>Telescope projects<cr>', 'Projects' },
        ['z'] = { '<cmd>Lazy<cr>', 'Lazy' },

        f = {
          name = 'Find',
          b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
          c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
          d = { '<cmd>Telescope diagnostics<cr>', 'Document Diagnostics' },
          e = { '<cmd>Telescope file_browser<cr>', 'File Explorer' },
          f = { '<cmd>Telescope find_files<cr>', 'Find files' },
          t = { '<cmd>Telescope live_grep theme=ivy<cr>', 'Find Text' },
          h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
          M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
          r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
          R = { '<cmd>Telescope registers<cr>', 'Registers' },
          k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
          C = { '<cmd>Telescope commands<cr>', 'Commands' },
        },

        p = {
          name = 'Packer',
          c = { '<cmd>PackerCompile<cr>', 'Compile' },
          i = { '<cmd>PackerInstall<cr>', 'Install' },
          s = { '<cmd>PackerSync<cr>', 'Sync' },
          S = { '<cmd>PackerStatus<cr>', 'Status' },
          u = { '<cmd>PackerUpdate<cr>', 'Update' },
        },

        g = {
          name = 'Git',
          g = { require 'utils'.Lazygit, 'Lazygit' },
          J = { '<cmd>Gitsigns next_hunk<cr>', 'Next Hunk' },
          k = { '<cmd>Gitsigns prev_hunk<cr>', 'Prev Hunk' },
          L = { '<cmd>Gitsigns blame_line<cr>', 'Blame' },
          P = { '<cmd>Gitsigns preview_hunk<cr>', 'Preview Hunk' },
          R = { '<cmd>Gitsigns reset_hunk<cr>', 'Reset Hunk' },
          r = { '<cmd>Gitsigns reset_buffer<cr>', 'Reset Buffer' },
          S = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage Hunk' },
          U = { '<cmd>Gitsigns undo_stage_hunk<cr>', 'Undo Stage Hunk' },
          o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
          b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
          c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
          f = { '<cmd>Telescope git_files<cr>', 'Git files' },
          d = { '<cmd>Gitsigns diffthis HEAD<cr>', 'Diff' },
          s = { '<cmd>Gitsigns toggle_signs<cr>', 'Toggle Signs' },
          n = { '<cmd>Gitsigns toggle_numhl<cr>', 'Toggle Number Highlight' },
        },

        l = {
          name = 'LSP',
          a = { vim.lsp.buf.code_action, 'Code Action' },
          d = {
            '<cmd>Telescope lsp_document_diagnostics<cr>',
            'Document Diagnostics',
          },
          w = {
            '<cmd>Telescope lsp_workspace_diagnostics<cr>',
            'Workspace Diagnostics',
          },
          f = { vim.lsp.buf.formatting, 'Format' },
          i = { '<cmd>LspInfo<cr>', 'Info' },
          j = { vim.diagnostic.goto_next, 'Next Diagnostic' },
          k = { vim.diagnostic.goto_prev, 'Prev Diagnostic' },
          l = { vim.lsp.codelens.run, 'CodeLens Action' },
          q = { vim.lsp.diagnostic.set_loclist, 'Quickfix' },
          r = { vim.lsp.buf.rename, 'Rename' },
          s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
          S = { '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Workspace Symbols' },
        },
        w = {
          name = 'Window',
          ['+'] = { '<cmd>wincmd +<cr>', 'Increase height' },
          ['-'] = { '<cmd>wincmd -<cr>', 'Decrease height' },
          ['='] = { '<cmd>wincmd =<cr>', 'Equally high and wide' },
          ['>'] = { '<cmd>wincmd ><cr>', 'Increase width' },
          ['|'] = { '<cmd>wincmd |<cr>', 'Max out the width' },
          ['<'] = { '<cmd>wincmd < <cr>', 'Decrease width' },
          h = { '<cmd>wincmd h<cr>', 'Go to the left window' },
          j = { '<cmd>wincmd j<cr>', 'Go to the down window' },
          k = { '<cmd>wincmd k<cr>', 'Go to the right window' },
          l = { '<cmd>wincmd l<cr>', 'Go to the up window' },
          q = { '<cmd>wincmd q<cr>', 'Quit a window' },
          s = { '<cmd>wincmd s<cr>', 'Split Window' },
          v = { '<cmd>wincmd v<cr>', 'Split Window Vertacally' },
          w = { '<cmd> wincmd w<cr>', 'Switch Windows' },
          x = { '<cmd> wincmd x<cr>', 'Swap current with next' },
        },

        t = {
          name = 'Terminal',
          f = { '<cmd>ToggleTerm direction=float<cr>', 'Float' },
          h = { '<cmd>ToggleTerm size=10 direction=horizontal<cr>', 'Horizontal' },
          v = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', 'Vertical' },
        },
      }
      which_key.setup(setup)
      which_key.register(mappings, opts)
    end,
  },
}
