local wezterm = require 'wezterm';
local config = wezterm.config_builder()
-- theme
config.color_scheme = 'Everforest Dark (Gogh)'
config.font = wezterm.font("UDEV Gothic 35NF")
config.font_size = 12.0
config.initial_rows = 35
config.initial_cols = 140
config.use_fancy_tab_bar = false
-- key config
config.keys = {
  {
    key = '\\',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '|',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'W',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config
