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
    },
    inactive = {},
  },

  winbar = {
    filetypes = { 'winbar' },
    active = {
      components.divider,
      components.section.git_diffs,
      components.section.file_encoding,
      components.section.file_type,
      components.section.file_location,
    },
  },

  quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
      components.section.quickfix,
    },
    always_active = true,
    show_last_status = true,
  },
}
