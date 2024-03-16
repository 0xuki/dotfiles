return {
    'goolord/alpha-nvim',
    config = function()
        local status_ok, alpha = pcall(require, "alpha")
        if not status_ok then
        return
        end

        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
        }

        dashboard.section.buttons.val = {
          dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
          dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
          dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
          dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
          dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
          dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
          dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
          dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
          dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        local function footer()
        return "Don't Stop Until You are Proud..."
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}
