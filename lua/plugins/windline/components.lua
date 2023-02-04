local M = {}
local b_components = require 'windline.components.basic'
local git_comps = require 'windline.components.git'
local lsp_comps = require 'windline.components.lsp'

M.git_branch = {
  text = function()
    return {
      { git_comps.git_branch(), { 'NormalFg', 'NormalBg' } },
    }
  end,
}

M.file_name = {
  text = function()
    return {
      { '%t', { 'NormalFg', 'NormalBg' } },
    }
  end,
}

M.lsp_errors = {
  text = function(bufnr)
    if lsp_comps.check_lsp(bufnr) then
      return {
        { lsp_comps.lsp_error { format = '  %s', show_zero = true }, { 'DiagnosticError', 'NormalBg' } },
        { lsp_comps.lsp_warning { format = '  %s', show_zero = true }, { 'DiagnosticWarn', 'NormalBg' } },
        { lsp_comps.lsp_info { format = '  %s', show_zero = true }, { 'DiagnosticInfo', 'NormalBg' } },
        { lsp_comps.lsp_hint { format = '  %s ', show_zero = true }, { 'DiagnosticHint', 'NormalBg' } },
      }
    end
  end,
}

M.git_diffs = {
  text = function()
    return {
      { git_comps.diff_added { format = ' %s ', show_zero = true }, { 'DiffAdded', 'NormalBg' } },
      { git_comps.diff_changed { format = '柳%s ', show_zero = true }, { 'DiffChanged', 'NormalBg' } },
      { git_comps.diff_removed { format = ' %s ', show_zero = true }, { 'DiffRemoved', 'NormalBg' } },
    }
  end,
}

M.divider = { b_components.divider, { 'NormalBg', 'NormalBg' } }

return M
