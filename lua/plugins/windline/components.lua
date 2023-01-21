local M = {}
local windline = require 'windline'
local state = windline.state
local helper = require 'windline.helpers'
local sep = helper.separators
local b_components = require 'windline.components.basic'
local git_comps = require 'windline.components.git'
local lsp_comps = require 'windline.components.lsp'

local breakpoint = 100

M.section = {}
M.section.colors = {
  a = {

    Command = { 'black1', 'white2' },
    Insert = { 'black1', 'white2' },
    Visual = { 'black1', 'white2' },
    Replace = { 'black1', 'white2' },
    Normal = { 'black1', 'white2' },

    CommandSep = { 'white2', 'cyan7' },
    InsertSep = { 'white2', 'yellow8' },
    VisualSep = { 'white2', 'yellow5' },
    ReplaceSep = { 'white2', 'blue5' },
    NormalSep = { 'white2', 'red6' },
  },

  b = {

    Command = { 'white1', 'cyan7' },
    Insert = { 'white1', 'yellow8' },
    Visual = { 'white1', 'yellow5' },
    Replace = { 'white1', 'blue5' },
    Normal = { 'white1', 'red6' },

    CommandSep = { 'cyan7', 'black2' },
    InsertSep = { 'yellow8', 'cyan7' },
    VisualSep = { 'yellow5', 'yellow7' },
    ReplaceSep = { 'blue5', 'blue7' },
    NormalSep = { 'red6', 'red8' },
  },

  c = {

    Command = { 'white1', 'black2' },
    Insert = { 'white1', 'cyan7' },
    Visual = { 'white1', 'yellow7' },
    Replace = { 'white1', 'blue7' },
    Normal = { 'white1', 'red8' },

    CommandSep = { 'black2', 'NormalBg' },
    InsertSep = { 'cyan7', 'NormalBg' },
    VisualSep = { 'yellow7', 'NormalBg' },
    ReplaceSep = { 'blue7', 'NormalBg' },
    NormalSep = { 'red8', 'NormalBg' },
  },
  e = {

    Command = { 'white1', 'black2' },
    Insert = { 'white1', 'cyan7' },
    Visual = { 'white1', 'yellow7' },
    Replace = { 'white1', 'blue7' },
    Normal = { 'white1', 'red8' },

    CommandSep = { 'black2', 'NormalBg' },
    InsertSep = { 'cyan7', 'NormalBg' },
    VisualSep = { 'yellow7', 'NormalBg' },
    ReplaceSep = { 'blue7', 'NormalBg' },
    NormalSep = { 'red8', 'NormalBg' },
  },
  f = {

    error = { 'red', 'NormalBg' },
    warning = { 'yellow', 'NormalBg' },
    info = { 'blue', 'NormalBg' },
  },
  g = {

    green = { 'green', 'NormalBg' },
    red = { 'red', 'NormalBg' },
    blue = { 'blue', 'NormalBg' },
  },
}

M.section.vi_modes = {
  hl_colors = M.section.colors.a,
  text = function(_, _, width)
    if width > breakpoint then
      return {
        { ' ' .. state.mode[1] .. ' ', state.mode[2] },
        { sep.right_filled, state.mode[2] .. 'Sep' },
      }
    end
    return {
      { ' ' .. state.mode[1]:sub(1, 1) .. ' ', state.mode[2] },
      { sep.right_filled, state.mode[2] .. 'Sep' },
    }
  end,
}

M.section.git_branch = {
  hl_colors = M.section.colors.b,
  text = function(bufnr, _, width)
    if width > breakpoint then
      if git_comps.is_git(bufnr) then
        return {
          { git_comps.git_branch(), state.mode[2] },
          { ' ' },
          { sep.right_filled, state.mode[2] .. 'Sep' },
        }
      end
      return {
        { ' ' .. ' ...', state.mode[2] },
        { ' ' },
        { sep.right_filled, state.mode[2] .. 'Sep' },
      }
    end
    return { { sep.right_filled, state.mode[2] .. 'Sep' } }
  end,
}

M.section.file_name = {
  hl_colors = M.section.colors.c,
  text = function()
    return {
      { ' ', state.mode[2] },
      { b_components.cache_file_name('[No Name]', 'unique') },
      { ' ' },
      { sep.right_filled, state.mode[2] .. 'Sep' },
    }
  end,
}

M.section.lsp_errors = {
  hl_colors = M.section.colors.f,
  text = function(bufnr)
    if lsp_comps.check_lsp(bufnr) then
      return {
        { '  ', 'error' },
        { lsp_comps.lsp_error { format = '%s', show_zero = true }, 'error' },
        { '  ', 'warning' },
        { lsp_comps.lsp_warning { format = '%s', show_zero = true }, 'warning' },
        { '  ', 'info' },
        { lsp_comps.lsp_info { format = '%s', show_zero = true }, 'info' },
      }
    end
    return nil
  end,
}

M.divider = { b_components.divider, { 'NormalFg', 'NormalBg' } }

M.section.git_diffs = {
  hl_colors = M.section.colors.g,
  text = function(bufnr)
    if git_comps.is_git(bufnr) then
      return {
        { git_comps.diff_added { format = '  %s', show_zero = true }, 'green' },
        { git_comps.diff_removed { format = '  %s', show_zero = true }, 'red' },
        { git_comps.diff_changed { format = '  %s ', show_zero = true }, 'blue' },
      }
    end
  end,
}
M.section.file_encoding = {
  hl_colors = M.section.colors.c,
  text = function(_, _, width)
    if width > breakpoint then
      return {
        { sep.left_filled, state.mode[2] .. 'Sep' },
        { ' ', state.mode[2] },
        { b_components.file_encoding() },
        { ' ' },
        { b_components.file_format { icon = true } },
        { ' ' },
      }
    end
    return {
      { sep.left_filled, state.mode[2] .. 'Sep' },
    }
  end,
}

M.section.file_type = {
  hl_colors = M.section.colors.b,
  text = function(_, _, width)
    if width > breakpoint then
      return {
        { sep.left_filled, state.mode[2] .. 'Sep' },
        { b_components.cache_file_type { icon = true }, state.mode[2] },
        { ' ' },
      }
    end
    return { { sep.left_filled, state.mode[2] .. 'Sep' } }
  end,
}

M.section.file_location = {
  hl_colors = M.section.colors.a,
  text = function(_, _, width)
    if width > breakpoint then
      return {
        { sep.left_filled, state.mode[2] .. 'Sep' },
        { '', state.mode[2] },
        { b_components.progress_lua },
        { ' ' },
        { b_components.line_col_lua },
      }
    end
    return {
      { sep.left_filled, state.mode[2] .. 'Sep' },
      { ' ', state.mode[2] },
      { b_components.line_col_lua, state.mode[2] },
    }
  end,
}

return M
