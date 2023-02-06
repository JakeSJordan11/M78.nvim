local components = require 'plugins.windline.components'
return {
  default = {
    filetypes = { 'default' },
    active = {
      components.vi_modes.default,
      components.git_branch.default,
      components.file_name.default,
      components.lsp_errors,
      components.divider,
    },
    inactive = {},
  },

  winbar = {
    filetypes = { 'winbar' },
    active = {
      components.divider,
      components.git_diffs,
      components.file_name.winbar,
      components.git_branch.winbar,
      components.vi_modes.winbar,
    },
  },

  terminal = {
    filetypes = { 'terminal', 'toggleterm' },
    active = {
      components.divider,
    },
  },

  trouble = {
    filetypes = { 'Trouble', 'winbar' },
    active = {
      components.lsp_errors.default,
      components.divider,
    },
  },
}
