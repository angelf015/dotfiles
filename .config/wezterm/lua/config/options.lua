local wezterm = require("wezterm")

local function options(config)
	-- Ensure system binaries are available in PATH
	config.set_environment_variables = {
		PATH = "/usr/local/bin:/usr/bin:/bin:" .. (os.getenv("PATH") or ""),
	}

	-- Quit wezterm when all windows are closed
	config.quit_when_all_windows_are_closed = true

	-- Don't adjust window size because of tiling window manager
	config.adjust_window_size_when_changing_font_size = false

	-- Use kitty keyboard protocol over csi-u
	config.enable_kitty_keyboard = true
	config.enable_csi_u_key_encoding = false

	-- Make Option key work as expected
	config.send_composed_key_when_left_alt_is_pressed = true
	config.send_composed_key_when_right_alt_is_pressed = true

	-- Optimize scrollback for tmux usage
	config.scrollback_lines = 3000

	-- Optimize frame rate for performance
	config.max_fps = 60
	config.animation_fps = 60

	-- Set color scheme
config.color_scheme = "nord"
config.colors = wezterm.color.get_builtin_schemes()["nord"]
	config.window_background_opacity = 0.9
	config.macos_window_background_blur = 20

	-- Font style with ligatures
	config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" })

	config.font_rules = {
		{
			italic = true,
			intensity = "Bold",
			font = wezterm.font("JetBrainsMono Nerd Font Mono", {
				italic = true,
				weight = "Medium",
			}),
		},
	}

	-- Font size
	config.font_size = 15
	config.line_height = 1.2

	-- Use integrated titlebar with terminal colors
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

	-- Disable window padding
	config.window_padding = {
		left = 0,
		right = 0,
		top = 40,
		bottom = 0,
	}

	-- Disable dimming of inactive panes (tmux handles this)
	config.inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 1.0,
	}

	-- Underline
	config.underline_position = "150%"
	config.underline_thickness = "200%"

	-- Disable tab bar (using tmux instead)
	config.enable_tab_bar = false
end

return options
