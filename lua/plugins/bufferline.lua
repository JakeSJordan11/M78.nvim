return {
  'akinsho/bufferline.nvim',
  config = function()
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'NvimTree',
          },
        },
      },
      highlights = {
        fill = {
          bg = 'bg',
          fg = 'bg',
        },
      },
    }
  end,
}
