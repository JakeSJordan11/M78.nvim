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
  Command = { 'NormalFg', 'NormalBg' },
  Insert = { 'NormalFg', 'NormalBg' },
  Visual = { 'NormalFg', 'NormalBg' },
  Replace = { 'NormalFg', 'NormalBg' },
  Normal = { 'NormalFg', 'NormalBg' },
}

M.section.vi_modes = {
  right = {
    hl_colors = M.section.colors,
    text = function(_, _, width)
      if width > breakpoint then
        return {
          { ' ' .. state.mode[1] .. ' ', state.mode[2] },
          { sep.right_filled, state.mode[2] },
        }
      end
      return {
        { ' ' .. state.mode[1]:sub(1, 1) .. ' ', state.mode[2] },
        { sep.right_filled, state.mode[2] },
      }
    end,
  },

  left = {
    hl_colors = M.section.colors,
    text = function(_, _, width)
      if width > breakpoint then
        return {
          { sep.left_filled, state.mode[2] },
          { ' ' .. state.mode[1] .. ' ', state.mode[2] },
        }
      end
      return {
        { sep.left_filled, state.mode[2] },
        { ' ' .. state.mode[1]:sub(1, 1) .. ' ', state.mode[2] },
      }
    end,
  },
}

M.section.git_branch = {
  right = {
    hl_colors = M.section.colors,
    text = function(bufnr, _, width)
      if width > breakpoint then
        if git_comps.is_git(bufnr) then
          return {
            { git_comps.git_branch(), state.mode[2] },
            { ' ' .. sep.right_filled, state.mode[2] },
          }
        end
      end
    end,
  },

  left = {
    hl_colors = M.section.colors,
    text = function(bufnr, _, width)
      if width > breakpoint then
        if git_comps.is_git(bufnr) then
          return {
            { sep.left_filled, state.mode[2] },
            { git_comps.git_branch(), state.mode[2] },
            { ' ', state.mode[2] },
          }
        end
      end
    end,
  },
}

M.section.file_name = {
  right = {
    hl_colors = M.section.colors,
    text = function()
      return {
        { ' ', state.mode[2] },
        { b_components.cache_file_name('', 'unique'), state.mode[2] },
        { sep.right_filled .. ' ', state.mode[2] },
      }
    end,
  },

  left = {
    hl_colors = M.section.colors,
    text = function()
      return {
        { ' ', state.mode[2] },
        { sep.left_filled .. ' ', state.mode[2] },
        { b_components.cache_file_name('', 'unique'), state.mode[2] },
      }
    end,
  },
}

M.section.lsp_errors = {
  hl_colors = M.section.colors,
  text = function(bufnr)
    if lsp_comps.check_lsp(bufnr) then
      return {
        { lsp_comps.lsp_error { format = '  %s', show_zero = true }, state.mode[2] },
        { lsp_comps.lsp_warning { format = '  %s', show_zero = true }, state.mode[2] },
        { lsp_comps.lsp_info { format = '  %s', show_zero = true }, state.mode[2] },
        { lsp_comps.lsp_hint { format = '  %s', show_zero = true }, state.mode[2] },
      }
    end
  end,
}

M.section.git_diffs = {
  hl_colors = M.section.colors,
  text = function(bufnr)
    if git_comps.is_git(bufnr) then
      return {
        { git_comps.diff_added { format = '  %s', show_zero = true }, state.mode[2] },
        { git_comps.diff_changed { format = ' 柳%s', show_zero = true }, state.mode[2] },
        { git_comps.diff_removed { format = '  %s', show_zero = true }, state.mode[2] },
      }
    end
  end,
}

M.section.divider = { b_components.divider }

return M
