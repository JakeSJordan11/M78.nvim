return {
  {
    'folke/noice.nvim',
    config = function()
      require('noice').setup {
        presets = {
          command_palette = true,
          lsp_doc_border = true,
        },
        lsp = {
          progress = {
            enabled = true,
            throttle = 1000 / 30,
            view = 'mini',
          },
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        views = {
          notify = {
            replace = true,
          },
        },
      }
    end,
  },
}
