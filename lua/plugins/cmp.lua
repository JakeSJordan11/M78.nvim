return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'dmitmel/cmp-cmdline-history',
      'hrsh7th/cmp-emoji',
      'chrisgrieser/cmp-nerdfont',
      'petertriho/cmp-git',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'Saecki/crates.nvim',
      'David-Kunz/cmp-npm',
      'onsails/lspkind.nvim',
      {
        'L3MON4D3/LuaSnip',
        dependencies = {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
        opts = {
          history = true,
          delete_check_events = 'TextChanged',
        },
        keys = {
          {
            '<C-n>',
            function()
              return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
            end,
            expr = true,
            remap = true,
            silent = true,
            mode = 'i',
          },
          {
            '<C-n>',
            function()
              require('luasnip').jump(1)
            end,
            mode = 's',
          },
          {
            '<C-p>',
            function()
              require('luasnip').jump(-1)
            end,
            mode = { 'i', 's' },
          },
        },
      },
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete { reason = 'manual' },
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            'i',
            's',
            'c',
          }),
          ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            'i',
            's',
            'c',
          }),
        },
        sources = cmp.config.sources {
          { name = 'copilot' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
          { name = 'emoji' },
          { name = 'nerdfont' },
          { name = 'npm' },
          { name = 'crates' },
          { name = 'buffer' },
        },
        formatting = {
          format = function(_, vim_item)
            lspkind.cmp_format {
              mode = 'symbol',
              max_width = 50,
              symbol_map = { Copilot = '' },
            }
            vim_item.kind = (lspkind.symbol_map[vim_item.kind] or '') .. ' ' .. vim_item.kind
            return vim_item
          end,
        },
      }
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources {
          { name = 'git' },
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mhpping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = 'nvim_lsp_document_symbol' },
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = 'cmdline' },
          { name = 'cmdline_history' },
          { name = 'path' },
        },
      })
    end,
  },
}
