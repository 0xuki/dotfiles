local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}

-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#82AAFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#82AAFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#82AAFF", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#1e66f5", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#1e66f5", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#1e66f5", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#dd7878", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#dd7878", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#dd7878", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#df8e1d", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#df8e1d", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#dc8a78", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#df8e1d", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#df8e1d", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#7287fd", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#7287fd", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#d20f39", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#d20f39", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#d20f39", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#df8e1d", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#df8e1d", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#df8e1d", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#ea76cb", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#ea76cb", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#ea76cb", bg = "NONE" })

return {
    {
        "williamboman/mason.nvim",
        config = function()
            local mason = require("mason")
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
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_lspconfig = require('mason-lspconfig')
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
                'zls',
              }, -- LSP Server to install
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local nvim_lsp = require('lspconfig')
            
            -- カーソルがホバリングしたときにエラーメッセージを表示
            vim.o.updatetime = 250
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focusable = false })]]

            -- エラーメッセージをステータスラインの上に表示
            vim.diagnostic.config({
                virtual_text = false, -- 行内のバーチャルテキストを無効化
                signs = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            local on_attach = function(client, bufnr)
              local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
              -- keymapping
              buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', {})
              buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {})
              buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {})
              buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})
              buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {})

                buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
                buf_set_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
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
              'zls',
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
                    checkThirdParty = false,
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
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            -- code sinippet support
            cmp.setup({
              snippet = {
                expand = function(args)
                  require('luasnip').lsp_expand(args.body)
                end,
              },
              completion = {
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                col_offset = -3,
                side_padding = 0,
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
              window = {
                completion = cmp.config.window.bordered({
                  scrollbar = false,
                  border = 'rounded'
                }),
                documentation = cmp.config.window.bordered({
                  border = 'rounded'
                }),
              },
              formatting = {
                mode = 'symbol',
                maxwidth = 40,
                ellipsis_char = '...',
                show_labelDetails = true,
                with_text = true,
                fields = { "kind", "abbr" },
                format = function(entry, vim_item)
                    local icon = cmp_kinds[vim_item.kind] or ''
                    vim_item.kind = icon .. vim_item.kind
                    vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
                    return vim_item
                end,
              }
            })

            cmp.setup.cmdline('/', {
              mapping = cmp.mapping.preset.cmdline(),
              sources = {
                { name = 'buffer' }
              },
              window = {
                completion = cmp.config.window.bordered({
                  scrollbar = false,
                  border = 'rounded'
                }),
                documentation = cmp.config.window.bordered({
                  border = 'rounded'
                }),
              },
              formatting = {
                mode = 'symbol',
                maxwidth = 40,
                ellipsis_char = '...',
                show_labelDetails = true,
                with_text = true,
                fields = { "kind", "abbr" },
                format = function(entry, vim_item)
                    local icon = cmp_kinds[vim_item.kind] or ''
                    vim_item.kind = icon .. vim_item.kind
                    vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
                    return vim_item
                end,
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
              }),
              window = {
                completion = cmp.config.window.bordered({
                  scrollbar = false,
                  border = 'rounded'
                }),
                documentation = cmp.config.window.bordered({
                  border = 'rounded'
                }),
              },
              formatting = {
                mode = 'symbol',
                maxwidth = 40,
                ellipsis_char = '...',
                show_labelDetails = true,
                with_text = true,
                fields = { "kind", "abbr" },
                format = function(entry, vim_item)
                    local icon = cmp_kinds[vim_item.kind] or ''
                    vim_item.kind = icon .. vim_item.kind
                    vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
                    return vim_item
                end,
              }
            })
        end,
    },
    { 'nvim-lua/plenary.nvim' },
    { 'hrsh7th/nvim-compe' },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
    { 'onsails/lspkind-nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
}

