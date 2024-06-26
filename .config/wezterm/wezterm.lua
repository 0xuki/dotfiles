local wezterm = require "wezterm"
local act = wezterm.action
local xcursor_size = 32
local xcursor_theme = "macOS-BigSur"
return {
  check_for_updates = false,
  font_size = 17,
  freetype_load_flags = 'NO_HINTING',
  freetype_load_target = 'Normal',
  line_height = 1.0,
  font = wezterm.font_with_fallback {
    { family = 'JetBrains Mono Nerd Font', weight = 'Medium', italic = false },
    { family = "Cica", assume_emoji_presentation = true },
    'Noto Color Emoji',
    'Noto Sans CJK JP',
  },

  adjust_window_size_when_changing_font_size = false,
  animation_fps = 1,
  default_cursor_style = "SteadyBlock",
  cursor_blink_ease_in = 'EaseIn',
  cursor_blink_ease_out = 'EaseOut',
  color_scheme = "Catppuccin Latte",
  enable_scroll_bar = false,
  enable_tab_bar = false,
  enable_wayland = false,
  front_end = "WebGpu",
  use_fancy_tab_bar = false,
  xcursor_theme = xcursor_theme,
  xcursor_size = xcursor_size,
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.7,
  scrollback_lines = 8000,
  warn_about_missing_glyphs = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
--        leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 },
--        keys = {
--        { key = 'w', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true }, },
--        { key = 'h', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
--        { key = 'v', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
--        { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
--        { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
--        { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize },
--        { key = 'C', mods = 'CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection', },
--        { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
--        { key = 'Space', mods = 'CTRL', action = wezterm.action.ShowTabNavigator },
--        },
  mouse_bindings = {
  { event = { Up = { streak = 1, button = 'Left' } }, mods = 'NONE', action = act.CompleteSelection 'Clipboard', },},
}

