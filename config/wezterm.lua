local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- theme
config.color_scheme = "Everforest Dark (Gogh)"
config.font = wezterm.font("UDEV Gothic NF")
config.font_size = 11.0
config.initial_rows = 35
config.initial_cols = 140
config.use_ime = true
config.window_background_opacity = 0.90
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
-- key config
config.keys = {
  {
    key = "\\",
    mods = "ALT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "|",
    mods = "ALT|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "ALT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "W",
    mods = "CTRL",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
}

return config
