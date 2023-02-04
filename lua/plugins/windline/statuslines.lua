local components = require 'plugins.windline.components'
return {
  default = {
    filetypes = { 'default' },
    active = {
      components.vi_modes.default,
      components.git_branch.default,
      components.file_name.default,
      components.git_diffs.default,
      components.lsp_errors.default,
      components.divider,
    },
    inactive = {},
  },

  winbar = {
    filetypes = { 'winbar' },
    active = {
      components.divider,
      components.lsp_errors.winbar,
      components.git_diffs.winbar,
      components.file_name.winbar,
      components.git_branch.winbar,
      components.vi_modes.winbar,
    },
  },
}
