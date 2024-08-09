return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>f', group = 'Find' },
      { '<leader>fB', '<Cmd>Telescope buffers<CR>', desc = 'Buffers' },
      { '<leader>fa', '<Cmd>Telescope adjacent<CR>', desc = 'Adjacent' },
      { '<leader>fb', '<Cmd>Telescope file_browser<CR>', desc = 'Files with file browser' },
      { '<leader>fd', '<Cmd>Telescope diagnostics<CR>', desc = 'Document diagnostics' },
      { '<leader>ff', '<Cmd>Telescope find_files<CR>', desc = 'Files' },
      { '<leader>fh', '<Cmd>Telescope help_tags<CR>', desc = 'Help' },
      { '<leader>fk', '<Cmd>Telescope keymaps<CR>', desc = 'Keymaps' },
      { '<leader>fp', '<Cmd>Telescope projects<CR>', desc = 'Projects' },
      { '<leader>fr', '<Cmd>Telescope frecency<CR>', desc = 'Recent Files' },
      { '<leader>ft', '<Cmd>Telescope live_grep<CR>', desc = 'Find Text' },

      { '<leader>g', group = 'Git' },
      { '<leader>gb', '<Cmd>Telescope git_branches<CR>', desc = 'Checkout Branch' },
      { '<leader>gc', '<Cmd>Telescope git_commits<CR>', desc = 'Checkout Commit' },
      { '<leader>gm', '<Cmd>Telescope gitmoji<CR>', desc = 'Gitmoji' },
      { '<leader>gs', '<Cmd>Telescope git_status<CR>', desc = 'Git Status' },
      { '<leader>gd', '<Cmd>DiffviewOpen<CR>', desc = 'Diff' },
      {
        '<leader>gg',
        function()
          local Terminal = require('toggleterm.terminal').Terminal
          local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float', float_opts = { border = 'rounded' } }
          lazygit:toggle()
        end,
        desc = 'Lazygit',
      },

      { '<leader>gS', group = 'Signs' },
      { '<laeder>gSk', '<Cmd>Gitsigns prev_hunk<CR>', desc = 'Prev Hunk' },
      { '<leader>gSL', '<Cmd>Gitsigns blame_line<CR>', desc = 'Blame' },
      { '<leader>gSn', '<Cmd>Gitsigns toggle_numhl<CR>', desc = 'Toggle Number Highlight' },
      { '<leder>gSP', '<Cmd>Gitsigns preview_hunk<CR>', desc = 'Preview Hunk' },
      { '<leader>gSR', '<Cmd>Gitsigns reset_hunk<CR>', desc = 'Reset Hunk' },
      { '<leader>gSr', '<Cmd>Gitsigns reset_buffer<CR>', desc = 'Reset Buffer' },
      { '<leader>gSS', '<Cmd>Gitsigns stage_hunk<CR>', desc = 'Stage Hunk' },
      { '<leader>gSs', '<Cmd>Gitsigns toggle_signs<CR>', desc = 'Toggle Signs' },
      { '<leader>gSU', '<Cmd>Gitsigns undo_stage_hunk<CR>', desc = 'Undo Stage Hunk' },

      { '<leader>x', group = 'Trouble' },
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions / references / ... (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },

      { 'g', group = 'Goto' },
      { 'gi', vim.lsp.buf.implementation, desc = 'Implementation' },
      { 'gD', vim.lsp.buf.declaration, desc = 'Declaration' },
      { 'gd', vim.lsp.buf.definition, desc = 'Definition' },
      { 'gr', vim.lsp.buf.references, desc = 'References' },

      { 'K', vim.lsp.buf.hover, desc = 'Hover' },
      { '<C-k>', vim.lsp.buf.signature_help, desc = 'Signature Help' },
      { '<leader>l', group = 'LSP' },
      { '<leader>la', vim.lsp.buf.code_action, desc = 'Code Action' },
      { '<leader>lD', vim.lsp.buf.type_definition, desc = 'Type Definition' },

      {
        '<leader>lf',
        function()
          local lsp_format = require 'plugins.lsp.format'
          lsp_format.format()
        end,
        desc = 'Format',
      },
      { '<leader>lj', vim.diagnostic.goto_next, desc = 'Next Diagnostic' },
      { '<leader>lk', vim.diagnostic.goto_prev, desc = 'Previous Diagnostic' },
      { '<leader>ll', vim.lsp.codelens.run, desc = 'CodeLens Action' },
      { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename' },
      { '<leader>li', '<Cmd>LspInfo<CR>', desc = 'Lsp Info' },

      { '<leader>a', '<Cmd>Alpha<CR>', desc = 'Alpha' },
      { '<leader>e', '<Cmd>NvimTreeToggle<CR>', desc = 'Explorer' },
      { '<leader>m', '<Cmd>Mason<CR>', desc = 'Mason' },
      { '<leader>z', '<Cmd>Lazy<CR>', desc = 'Lazy' },
    },
  },
  keys = {
    {
      '<lader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
