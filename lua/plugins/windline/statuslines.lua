local components = require 'plugins.windline.components'
return {
  default = {
    filetypes = { 'default' },
    active = {
      components.divider,
    },
    inactive = {},
  },

  winbar = {
    filetypes = { 'winbar' },
    active = {
      components.divider,
      components.git_diffs,
      components.file_name,
    },
    always_active = true,
  },

  trouble = {
    filetypes = { 'Trouble' },
    active = { components.lsp_errors, components.divider },
    always_active = true,
  },
}
