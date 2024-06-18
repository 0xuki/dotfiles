local function myMiniView(pattern, kind)
	kind = kind or ""
	return {
		view = "mini",
		filter = {
			event = "msg_show",
			kind = kind,
			find = pattern,
		},
	}
end

return {
	{ "MunifTanjim/nui.nvim" },
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "  ",
					initial_mode = "normal",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					path_display = { "truncate" },
					winblend = 0,
					border = {},
					orderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					-- Keymaps
					mappings = {
						i = {
							["qq"] = actions.close,
						},
						n = {
							["q"] = actions.close,
							["d"] = require("telescope.actions").delete_buffer,
						},
					},
				},
				extensions = {
					file_browser = {
						grouped = true,
						previewer = false,
						initial_browser = "tree",
						auto_depth = true,
						depth = 1,
					},
				},
			})
			-- Theming
			-- local colors = require('catppuccin.palettes').get_palette()
			-- local TelescopeColor = {
			--   TelescopeMatching = { fg = colors.flamingo },
			--   TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
			--   TelescopePromptPrefix = { fg = colors.red },
			--   TelescopePromptNormal = { bg = colors.surface0 },
			--   TelescopeResultsNormal = { bg = colors.mantle },
			--   TelescopePreviewNormal = { bg = colors.mantle },
			--   TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
			--   TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
			--   TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
			--   TelescopePromptTitle = { bg = colors.red, fg = colors.mantle },
			--   TelescopeResultsTitle = { fg = colors.mantle },
			--   TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
			-- }

			-- for hl, col in pairs(TelescopeColor) do
			--   vim.api.nvim_set_hl(0, hl, col)
			-- end
			require("telescope").load_extension("file_browser")
		end,
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"NvChad/nvterm",
		config = function()
			require("nvterm").setup({
				terminals = {
					shell = vim.o.shell,
					list = {},
					type_opts = {
						float = {
							relative = "editor",
							row = 0.3,
							col = 0.25,
							width = 0.5,
							height = 0.4,
							border = "single",
						},
						horizontal = { location = "rightbelow", split_ratio = 0.3 },
						vertical = { location = "rightbelow", split_ratio = 0.5 },
					},
				},
				behavior = {
					autoclose_on_quit = {
						enabled = false,
						confirm = true,
					},
					close_on_exit = true,
					auto_insert = true,
				},
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true

			-- empty setup using defaults
			require("nvim-tree").setup()

			-- OR setup with some options
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
					git_ignored = false,
				},
			})
		end,
	},
	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"rcarriga/nvim-notify",
		opts = { timeout = 3000 },
		config = function()
			vim.notify = require("notify")
			require("notify").setup({
				background_colour = "#EFF1F5",
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			-- local colors = {
			--   red = "#FF0000",
			--   blue = "#0000FF",
			--   green = "#00FF00",
			--   background = "#1e1e1e",
			--   foreground = "#c0c0c0",
			-- }
			--
			-- vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = colors.background, fg = colors.foreground })
			-- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = colors.background, fg = colors.foreground })

			require("noice").setup({
				messages = {
					view_search = "mini",
				},
				routes = {
					-- {
					--     view = "notify",
					--     filter = { event = "msg_showmode" },
					-- },
					-- {
					--     filter = {
					--         event = "notify",
					--         warning = true,
					--         find = "failed to run generator.*is not executable",
					--     },
					--     opts = { skip = true },
					-- },
					myMiniView("Already at .* change"),
					myMiniView("written"),
					myMiniView("yanked"),
					myMiniView("more lines?"),
					myMiniView("fewer lines?"),
					myMiniView("fewer lines?", "lua_error"),
					myMiniView("change; before"),
					myMiniView("change; after"),
					myMiniView("line less"),
					myMiniView("lines indented"),
					myMiniView("No lines in buffer"),
					myMiniView("search hit .*, continuing at", "wmsg"),
					myMiniView("E486: Pattern not found", "emsg"),
				},
				views = {
					-- コマンドラインポップアップの設定
					cmdline_popup = {
						border = {
							-- style = "none",  -- ボーダースタイルをなしに設定
							-- padding = { 1, 2 },  -- ボーダーの内側のパディングを設定
						},
						filter_options = {},
						win_options = {
							--winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",  
						},
						position = {
							row = "42%", 
							col = "50%",
						},
						size = {
							width = 60, 
							height = "auto", 
						},
					},	
					popupmenu = {
						relative = "editor", 
						position = {
							row = "58%",
							col = "50%",
						},
						size = {
							width = 60, 
							height = 10, 
						},
						border = {
							padding = { 0, 1 }, 
						},
						win_options = {
							winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
						},
					},
					-- Confirm Window 
					confirm = {
						relative = "editor", 
						position = {
							row = "88%",
							col = "50%", 
						},
						size = {
							width = 60,
							height = 1,
						},
						border = {
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" }, -- ウィンドウのハイライト設定
						},
					},
				},
				presets = {
					bottom_search = false, 
					command_palette = true, 
					long_message_to_split = true,
					inc_rename = false, 
					lsp_doc_border = true, 
				},
			})
		end,
	},
	{
		"hoob3rt/lualine.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
		},
		config = function()
			local C = require("catppuccin.palettes").get_palette("mocha")
			require("gitsigns").setup()

			local colors = {
				red = C.red,
				grey = C.surface0,
				black = C.mantle,
				white = C.text,
				light_green = C.green,
				orange = C.peach,
				green = C.spring_green,
			}
			--- catppuccin color palette https://github.com/catppuccin/catppuccin
			local theme = {
				normal = {
					a = { fg = "#dce0e8", bg = "#7287fd" },
					b = { fg = "#7c7f93", bg = "#eff1f5" },
					c = { fg = "#7c7f93", bg = "#eff1f5" },
					y = { fg = "#dce0e8", bg = "#e64553" },
					z = { fg = "#dce0e8", bg = "#dd7878" },
				},
				insert = {
					a = { fg = "#dce0e8", bg = "#7287fd" },
					b = { fg = "#7c7f93", bg = "#eff1f5" },
					c = { fg = "#7c7f93", bg = "#eff1f5" },
					y = { fg = "#dce0e8", bg = "#e64553" },
					z = { fg = "#dce0e8", bg = "#dd7878" },
				},
				visual = {
					a = { fg = "#dce0e8", bg = "#7287fd" },
					b = { fg = "#7c7f93", bg = "#eff1f5" },
					c = { fg = "#7c7f93", bg = "#eff1f5" },
					y = { fg = "#dce0e8", bg = "#e64553" },
					z = { fg = "#dce0e8", bg = "#dd7878" },
				},
				replace = {
					a = { fg = "#dce0e8", bg = "#7287fd" },
					b = { fg = "#7c7f93", bg = "#eff1f5" },
					c = { fg = "#7c7f93", bg = "#eff1f5" },
					y = { fg = "#dce0e8", bg = "#e64553" },
					z = { fg = "#dce0e8", bg = "#dd7878" },
				},
				command = {
					a = { fg = "#dce0e8", bg = "#7287fd" },
					b = { fg = "#7c7f93", bg = "#eff1f5" },
					c = { fg = "#7c7f93", bg = "#eff1f5" },
					y = { fg = "#dce0e8", bg = "#e64553" },
					z = { fg = "#dce0e8", bg = "#dd7878" },
				},
			}

			local empty = require("lualine.component"):extend()
			function empty:draw(default_highlight)
				self.status = ""
				self.applied_separator = ""
				self:apply_highlights(default_highlight)
				self:apply_section_separators()
				return self.status
			end

			-- Put proper separators and gaps between components in sections
			-- local function process_sections(sections)
			--   for name, section in pairs(sections) do
			--     local left = name:sub(9, 10) < 'x'
			--     for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
			--       table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = "#2d303e" } })
			--     end
			--     for id, comp in ipairs(section) do
			--       if type(comp) ~= 'table' then
			--         comp = { comp }
			--         section[id] = comp
			--       end
			--       comp.separator = left and { right = "" } or { left = '' }
			--     end
			--   end
			--   return sections
			-- end

			local function search_result()
				if vim.v.hlsearch == 0 then
					return ""
				end
				local last_search = vim.fn.getreg("/")
				if not last_search or last_search == "" then
					return ""
				end
				local searchcount = vim.fn.searchcount({ maxcount = 9999 })
				return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
			end

			local function modified()
				if vim.bo.modified then
					return "+"
				elseif vim.bo.modifiable == false or vim.bo.readonly == true then
					return "-"
				end
				return ""
			end

			local function mode_icon()
				return ""
			end

			local function mode_info()
				local icon = mode_icon()
				local mode_name = require("lualine.utils.mode").get_mode()
				return icon .. " " .. mode_name
			end

			local function file_icon()
				local filename = vim.fn.expand("%:t")
				local extension = vim.fn.expand("%:e")
				local icon, icon_color = require("nvim-web-devicons").get_icon_color(filename, extension)
				if icon == nil then
					icon = "󰈙"
					icon_color = "#d8dee9"
				end
				return icon .. " " .. filename
			end

			-- local function custom_diff()
			--   local gitsigns = vim.b.gitsigns_status_dict
			--   if not gitsigns then return '' end
			--
			--   local added, modified, removed = gitsigns.added or 0, gitsigns.changed or 0, gitsigns.removed or 0
			--   return string.format(
			--     ' %d  %d  %d',
			--     added, modified, removed
			--   )
			-- end

			local function unix_fileformat()
				return " Unix"
			end

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = theme,
					component_separators = "",
					section_separators = { left = " ", right = "" },
				},
				sections = {
					lualine_a = { mode_info },
					lualine_b = { file_icon },
					lualine_c = {
						{
							"branch",
							icon = "",
						},
						"diff",
						{
							"diagnostics",
							source = { "nvim" },
							sections = { "error" },
							diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
						},
						{
							"diagnostics",
							source = { "nvim" },
							sections = { "warn" },
							diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
						},
						{ modified, color = { bg = colors.red } },
						{
							"%w",
							cond = function()
								return vim.wo.previewwindow
							end,
						},
						{
							"%r",
							cond = function()
								return vim.bo.readonly
							end,
						},
						{
							"%q",
							cond = function()
								return vim.bo.buftype == "quickfix"
							end,
						},
					},
					lualine_x = { "encoding", unix_fileformat },
					lualine_y = { search_result, "filetype" },
					lualine_z = { "%l:%c", "%p%%/%L" },
				},
				inactive_sections = {
					lualine_b = { "%f %y %m" },
					lualine_x = {},
				},
				tabline = {
					-- lualine_a = {
					--   {
					--     "buffers",
					--     separator = { left = "", right = "" },
					--     right_padding = 2,
					--     symbols = { alternate_file = "" },
					--   },
					-- },
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			local hooks = require("ibl.hooks")

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "ScopeHighlight", { fg = "#95B4FF" })
				vim.api.nvim_set_hl(0, "IndentHighlight", { fg = "#c1caf4" })
			end)

			require("ibl").setup({
				scope = { highlight = { "ScopeHighlight" } },
				indent = { highlight = { "IndentHighlight" } },
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		config = function()
			local status, bufferline = pcall(require, "bufferline")
			if not status then
				return
			end

			require("bufferline").setup({
				options = {
					indicator = { style = "none" },
					separator_style = { "", "" },
					offsets = {
						{
							filetype = "NvimTree",
							text = "Explorer",
							text_align = "center",
						},
					},

					buffer_close_icon = "×",
					modified_icon = "●",
					-- close icon
					close_command = "bdelete! %d",

					-- right mouse command
					right_mouse_command = "bdelete! %d",

					-- left mouse command
					left_mouse_command = "buffer %d",

					-- middle mouse command
					middle_mouse_command = nil,

					-- LSP diagnostics
					diagnostics = "nvim_lsp",

					-- diagnostics indicator
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						return "(" .. count .. ")"
					end,
					-- close icon
					show_buffer_close_icons = true,

					-- close icon
					show_close_icon = true,

					always_show_bufferline = true,
				},
			})
		end,
	},
	{
		"goolord/alpha-nvim",
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
				dashboard.button("x", " " .. " Lazy Extras", "<cmd> LazyExtras <cr>"),
				dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
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
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				ensure_installed = {
					"rust",
					"typescript",
					"tsx",
					"javascript",
					"css",
					"c_sharp",
					"lua",
					"haskell",
					"python",
					"c",
					"html",
					"html",
					"markdown",
					"markdown_inline",
					"scala",
					"sql",
					"vim",
					"zig",
					"nix",
					"latex",
					"json",
					"go",
					"elixir",
					"dockerfile",
					"cpp",
					"astro",
					"php",
					"gleam",
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = false,
				},
				incremental_selection = {
					enable = false,
				},
				textobjects = {
					enable = true,
				},
				-- nvim-ts-autotag
				-- autotag = {
				--   enable = true,
				-- },
			})
		end,
	},
}
