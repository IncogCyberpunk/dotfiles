-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

config.keys = {
	-- Disable the default <A-Enter> behavior
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- or, changing the font size and color scheme.
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMono NF",
		weight = 500,
		style = "Italic",
	},
	"Lohit Nepali",
})
config.font_size = 11
config.color_scheme = "Catppuccin Mocha"
config.max_fps = 120
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120
config.warn_about_missing_glyphs = false

config.window_close_confirmation = "NeverPrompt"
-- Finally, return the configuration to wezterm:
return config
