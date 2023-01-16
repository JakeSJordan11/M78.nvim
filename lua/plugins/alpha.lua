return {
  'goolord/alpha-nvim',
  lazy = false,
  config = function()
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
      "         You'll Find it Bud, I Promise    ",
      "",
      "    ooooooooooooooooooooooooooooooooooooo",
      "    8                                .d88',",
      "    8   oooooooooooooooooooooooooooo 8888',",
      "    8  8888888888888888888888888P\"   8888',",
      "    8  8888888888888888888888P\"      8888',",
      "    8  8888888888888888888P\"         8888',",
      "    8  8888888888888888P\"            8888',",
      "    8  8888888888888P\"               8888',",
      "    8  8888888888P\"                  8888',",
      "    8  8888888P\"                     8888',",
      "    8  8888P\"                        8888',",
      "    8 d8888888888888888888888888888888888',",
      "    8 88888888888888888888888888888888888/",
      "           8ooooooooooooooocgmm8888\\'",
      "       ooooooooooooooooooooooooooooooo,",
      "      d                       ...oood8b',",
      "     d              ...oood888888888888b',",
      "    d     ...oood88888888888888888888888b',",
      "   dood8888888888888888888888888888888888b'",
    }
    dashboard.section.buttons.val = {
      dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    for _, value in ipairs(dashboard.section.buttons.val) do
      value.opts.hl = "Constant"
    end
    dashboard.opts.opts.noautocmd = true
    require 'alpha'.setup(dashboard.opts)
  end,
}
