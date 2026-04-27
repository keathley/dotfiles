local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:

-- or, changing the font size and color scheme.
config.font_size = 16
-- config.color_scheme = 'Solarized Dark - Patched'
config.color_scheme = 'Solarized Dark Higher Contrast'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- Finally, return the configuration to wezterm:
return config
