require "jake.alpha"
require "jake.cmp"
require "jake.colorsheme"
require "jake.comment"
require "jake.diagnostics"
require "jake.fidget"
require "jake.gitsigns"
require "jake.gui-font-resize"
require "jake.highlights"
require "jake.highlight-on-yank"
require "jake.keymaps"
require "jake.lsp"
require "jake.nvim-tree"
require "jake.neodev"
require "jake.neovide"
require "jake.options"
require "jake.plugins"
require "jake.project"
require "jake.telescope"
require "jake.toggleterm"
require "jake.treesitter"
require "jake.whichkey"
require "jake.windline"
local ui = {
  icons = {
    cmd = "⌘",
    config = "🛠",
    event = "📅",
    ft = "📂",
    init = "⚙",
    keys = "🗝",
    plugin = "🔌",
    runtime = "💻",
    source = "📄",
    start = "🚀",
    task = "📌",
  },
}

return ui
