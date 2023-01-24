local components = require 'plugins.windline.components'
return {
  default = {
    filetypes = { 'default' },
    active = {
      components.section.vi_modes.right,
      components.section.git_branch.right,
      components.section.file_name.right,
      components.section.lsp_errors,
      components.section.divider,
    },
    inactive = {},
  },

  winbar = {
    filetypes = { 'winbar' },
    active = {
      components.section.divider,
      components.section.git_diffs,
      components.section.file_name.left,
      components.section.git_branch.left,
      components.section.vi_modes.left,
    },
    always_active = true,
  },
}
