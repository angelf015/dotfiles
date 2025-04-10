local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	enable_wayland = false,
	max_fps = 144,
	animation_fps = 144,
	front_end = "WebGpu",
	default_cursor_style = "BlinkingBar",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = true,
	window_decorations = "RESIZE",
	check_for_updates = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	window_background_opacity = 1.9, -- Ajuste válido
	font_size = 17,
	line_height = 1.2,
	font = wezterm.font("DankMono Nerd Font"),
	font_rules = {
		{
			italic = true,
			intensity = "Bold",
			font = wezterm.font("DankMono Nerd Font", {
				italic = true,
				weight = "Regular",
			}),
		},
	},
	enable_tab_bar = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	hyperlink_rules = {
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},
	},
	command_palette_font_size = 13,
	command_palette_bg_color = "#394b70",
	command_palette_fg_color = "#828bb8",
}
return config
