-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tango (terminal.sexy)'
-- config.font = wezterm.font( 'CaskaydiaCove Nerd Font Mono')
config.font = wezterm.font_with_fallback { 'CaskaydiaCove Nerd Font Mono', 'MesloLGS NF'}
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 14
config.force_reverse_video_cursor = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
