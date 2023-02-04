return {
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        opts = {
          fps = 120,
          stages = 'slide',
          timeout = 2000,
        },
      },
    },
    config = function()
      require('noice').setup {
        presets = {
          command_palette = true,
          lsp_doc_border = true,
        },
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
      }
    end,
  },
}
