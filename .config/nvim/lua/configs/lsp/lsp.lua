-- load plugins
local nvim_lsp = require('lspconfig')
local mason = require("mason")
local mason_lspconfig = require('mason-lspconfig')
local cmp = require('cmp')
local lspkind = require('lspkind')

-- setup mason
require("mason").setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- setup mason_lspconfig
mason_lspconfig.setup({
  ensure_installed = { 
    'rust_analyzer', 
    'lua_ls', 
    'tsserver', 
    'eslint', 
    'gopls', 
    --'pylyzer',
    'elixirls',
    'omnisharp',
    'cssls',
    'denols',
    'clangd',
  }, -- LSP Server to install
})
 
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- keymapping
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', {})
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {})
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {})
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {})
end

-- LSP Server Config
local servers = { 
  'rust_analyzer', 
  'lua_ls', 
  'tsserver', 
  'eslint', 
  'gopls', 
  --'pylyzer',
  'elixirls',
  'omnisharp',
  'cssls',
  'denols',
  'clangd',
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        },
        completion = {
          autoimport = {
            enable = true,
          },
        },
      },
      ["lua_ls"] = {
        {
          checkThirdParty = false,
        },
        completion = {
          workspaceWord = true,
          callSnippet = "Both",
        },
        misc = {
          parameters = {
            -- "--log-level=trace",
          },
        },
        hint = {
          enable = true,
          setType = false,
          paramType = true,
          paramName = "Disable",
          semicolon = "Disable",
          arrayIndex = "Disable",
        },
        doc = {
          privateName = { "^_" },
        },
        type = {
          castNumberToInteger = true,
        },
        diagnostics = {
          disable = { "incomplete-signature-doc", "trailing-space" },
          -- enable = false,
          groupSeverity = {
            strong = "Warning",
            strict = "Warning",
          },
          groupFileStatus = {
            ["ambiguity"] = "Opened",
            ["await"] = "Opened",
            ["codestyle"] = "None",
            ["duplicate"] = "Opened",
            ["global"] = "Opened",
            ["luadoc"] = "Opened",
            ["redefined"] = "Opened",
            ["strict"] = "Opened",
            ["strong"] = "Opened",
            ["type-check"] = "Opened",
            ["unbalanced"] = "Opened",
            ["unused"] = "Opened",
          },
          unusedLocalExclude = { "_*" },
        },
        format = {
          enable = false,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
            continuation_indent_size = "2",
          },
        },
      },

      ["tsserver"] = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "literal",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        }, 
      },
    }
  })
end

-- code sinippet support
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        path = "[Path]"
      }
    }),
  }
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.api.nvim_set_hl(0, 'CmpItemKind', { link = 'CmpItemMenuDefault' })
vim.g.rustfmt_autosave = 1

