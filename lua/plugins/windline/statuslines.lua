local components = require 'plugins.windline.components'
return {
  default = {
    filetypes = { 'default' },
    active = {
      components.section.vi_modes,
      components.section.git_branch,
      components.section.file_name,
      components.section.lsp_errors,
      components.divider,
      components.section.git_diffs,
      components.section.file_encoding,
      components.section.file_type,
      components.section.file_location,
    },
    inactive = {},
  },

  winbar = {
    filetypes = { 'winbar' },
    active = {
      components.section.vi_modes,
      components.section.git_branch,
      components.section.file_name,
      components.section.lsp_errors,
      components.divider,
      components.section.git_diffs,
      components.section.file_encoding,
      components.section.file_type,
      components.section.file_location,
    },
    always_active = true,
  },
}
