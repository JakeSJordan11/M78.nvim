local M = {}
local windline = require 'windline'
local state = windline.state
local helper = require 'windline.helpers'
local sep = helper.separators
local b_components = require 'windline.components.basic'
local git_comps = require 'windline.components.git'
local lsp_comps = require 'windline.components.lsp'

local width_breakpoint = 100

M.vi_modes = {
  default = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function(_, _, width)
      if width > width_breakpoint then
        return {
          { ' ' .. state.mode[1] .. ' ', state.mode[2] .. 'Sep' },
          { sep.right_filled, state.mode[2] },
        }
      end
      return {
        { ' ' .. state.mode[1]:sub(1, 1) .. ' ', state.mode[2] .. 'Sep' },
        { sep.right_filled, state.mode[2] },
      }
    end,
  },

  winbar = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function(_, _, width)
      if width > width_breakpoint then
        return {
          { sep.left_filled, state.mode[2] },
          { ' ' .. state.mode[1] .. ' ', state.mode[2] .. 'Sep' },
        }
      end
      return {
        { sep.left_filled, state.mode[2] },
        { ' ' .. state.mode[1]:sub(1, 1) .. ' ', state.mode[2] .. 'Sep' },
      }
    end,
  },
}

M.git_branch = {
  default = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function()
      return {
        { git_comps.git_branch(), state.mode[2] },
        { ' ' },
        { sep.right_filled, state.mode[2] .. 'Sep' },
      }
    end,
  },

  winbar = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function()
      return {
        { sep.left_filled, state.mode[2] .. 'Sep' },
        { git_comps.git_branch(), state.mode[2] },
        { ' ', state.mode[2] },
      }
    end,
  },
}

M.file_name = {
  default = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function()
      return {
        { ' ' },
        { b_components.cache_file_name('', 'unique'), state.mode[2] .. 'Sep' },
        { sep.right_filled .. ' ', state.mode[2] },
      }
    end,
  },

  winbar = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function()
      return {
        { ' ', state.mode[2] },
        { sep.left_filled, state.mode[2] },
        { ' ', state.mode[2] .. 'Sep' },
        { b_components.cache_file_name('', 'unique'), state.mode[2] .. 'Sep' },
      }
    end,
  },
}

M.lsp_errors = {
  default = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function(bufnr)
      if lsp_comps.check_lsp(bufnr) then
        return {
          { lsp_comps.lsp_error { format = '  %s', show_zero = true }, state.mode[2] .. 'Sep' },
          { lsp_comps.lsp_warning { format = '  %s', show_zero = true }, state.mode[2] .. 'Sep' },
          { lsp_comps.lsp_info { format = '  %s', show_zero = true }, state.mode[2] .. 'Sep' },
          { lsp_comps.lsp_hint { format = '  %s ', show_zero = true }, state.mode[2] .. 'Sep' },
          { sep.right_filled .. ' ', state.mode[2] },
        }
      end
    end,
  },
  winbar = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function(bufnr)
      if lsp_comps.check_lsp(bufnr) then
        return {
          { sep.left_filled, state.mode[2] },
          { lsp_comps.lsp_error { format = '  %s', show_zero = true }, state.mode[2] .. 'Sep' },
          { lsp_comps.lsp_warning { format = '  %s', show_zero = true }, state.mode[2] .. 'Sep' },
          { lsp_comps.lsp_info { format = '  %s', show_zero = true }, state.mode[2] .. 'Sep' },
          { lsp_comps.lsp_hint { format = '  %s ', show_zero = true }, state.mode[2] .. 'Sep' },
        }
      end
    end,
  },
}

M.git_diffs = {
  default = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function()
      return {
        { git_comps.diff_added { format = ' %s', show_zero = true }, state.mode[2] },
        { git_comps.diff_changed { format = ' 柳%s', show_zero = true }, state.mode[2] },
        { git_comps.diff_removed { format = '  %s ', show_zero = true }, state.mode[2] },
        { sep.right_filled, state.mode[2] .. 'Sep' },
      }
    end,
  },
  winbar = {
    hl_colors = {
      Command = { 'NormalFg', 'NormalBg' },
      Insert = { 'NormalFg', 'NormalBg' },
      Visual = { 'NormalFg', 'NormalBg' },
      Replace = { 'NormalFg', 'NormalBg' },
      Normal = { 'NormalFg', 'NormalBg' },

      CommandSep = { 'NormalBg', 'NormalFg' },
      InsertSep = { 'NormalBg', 'NormalFg' },
      VisualSep = { 'NormalBg', 'NormalFg' },
      ReplaceSep = { 'NormalBg', 'NormalFg' },
      NormalSep = { 'NormalBg', 'NormalFg' },
    },
    text = function()
      return {
        { sep.left_filled, state.mode[2] .. 'Sep' },
        { git_comps.diff_added { format = '  %s', show_zero = true }, state.mode[2] },
        { git_comps.diff_changed { format = ' 柳%s', show_zero = true }, state.mode[2] },
        { git_comps.diff_removed { format = '  %s', show_zero = true }, state.mode[2] },
      }
    end,
  },
}

M.divider = { b_components.divider }

return M
