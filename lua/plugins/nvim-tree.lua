return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local nvimTree = require 'nvim-tree'
    nvimTree.setup {
      view = {
        hide_root_folder = true,
      },
    }
    local wk = require 'which-key'
    wk.register({ e = { '<Cmd>NvimTreeToggle<CR>', 'Explorer' } }, { prefix = '<leader>' })
  end,
}
