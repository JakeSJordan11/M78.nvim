local M = {}
local windline = require 'windline'
local state = windline.state
local helper = require 'windline.helpers'
local sep = helper.separators
local b_components = require 'windline.components.basic'
local git_comps = require 'windline.components.git'
local lsp_comps = require 'windline.components.lsp'

M.colors = {
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
}

M.vi_modes = {
  default = {
    hl_colors = M.colors,
    text = function()
      return {
        { ' ' .. state.mode[1] .. ' ', state.mode[2] .. 'Sep' },
        { sep.right_filled, state.mode[2] },
      }
    end,
  },

  winbar = {
    hl_colors = M.colors,
    text = function()
      return {
        { sep.left_filled, state.mode[2] },
        { ' ' .. state.mode[1] .. ' ', state.mode[2] .. 'Sep' },
      }
    end,
  },
}

M.git_branch = {
  default = {
    hl_colors = M.colors,
    text = function()
      return {
        { git_comps.git_branch(), state.mode[2] },
        { ' ' },
        { sep.right_filled, state.mode[2] .. 'Sep' },
      }
    end,
  },

  winbar = {
    hl_colors = M.colors,
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
    hl_colors = M.colors,
    text = function()
      return {
        { ' ' },
        { b_components.cache_file_name('', 'unique'), state.mode[2] .. 'Sep' },
        { b_components.file_icon { default = '' } },
        { ' ' },
        { sep.right_filled, state.mode[2] },
      }
    end,
  },

  winbar = {
    hl_colors = M.colors,
    text = function()
      return {
        { sep.left_filled, state.mode[2] },
        { ' ', state.mode[2] .. 'Sep' },
        { b_components.cache_file_name('', 'unique'), state.mode[2] .. 'Sep' },
        { b_components.file_icon { default = '' } },
        { ' ' },
      }
    end,
  },
}

M.lsp_errors = {
  text = function(bufnr)
    if lsp_comps.check_lsp(bufnr) then
      return {
        { lsp_comps.lsp_error { format = '  %s', show_zero = true }, 'DiagnosticError' },
        { lsp_comps.lsp_warning { format = '  %s', show_zero = true }, 'DiagnosticWarn' },
        { lsp_comps.lsp_info { format = '  %s', show_zero = true }, 'DiagnosticInfo' },
        { lsp_comps.lsp_hint { format = '  %s ', show_zero = true }, 'DiagnosticHint' },
      }
    end
  end,
}

M.git_diffs = {
  text = function()
    return {
      { git_comps.diff_added { format = '  %s', show_zero = true }, 'GitSignsAdd' },
      { git_comps.diff_changed { format = ' 柳%s', show_zero = true }, 'GitSignsChange' },
      { git_comps.diff_removed { format = '  %s ', show_zero = true }, 'GitSignsDelete' },
    }
  end,
}

M.divider = { b_components.divider, { 'NormalBg', 'NormalBg' } }

return M
