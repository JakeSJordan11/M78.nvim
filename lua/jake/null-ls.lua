local null_ls = require("null-ls")
local prettier = require("prettier")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "css", "yaml" },
    }),
  },
  on_attach = function(client, _)
    if client.server_capabilities then
      vim.cmd("nnoremap <silent><buffer> <Leader>lf :lua vim.lsp.buf.format {async=true}<CR>")
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format {async=true}")
      vim.cmd("xnoremap <silent><buffer> <Leader>lf :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },

  arrow_parens = "always",
  bracket_spacing = true,
  embedded_language_formatting = "auto",
  end_of_line = "lf",
  html_whitespace_sensitivity = "css",
  jsx_bracket_same_line = false,
  jsx_single_quote = false,
  print_width = 80,
  prose_wrap = "preserve",
  quote_props = "as-needed",
  semi = true,
  single_quote = false,
  tab_width = 2,
  trailing_comma = "es5",
  use_tabs = false,
  e_indent_script_and_style = false,
})
