local wezterm = require("wezterm")

local function options(config)
	-- Ensure system binaries are available in PATH
	config.set_environment_variables = {
		PATH = "/usr/local/bin:/usr/bin:/bin:" .. (os.getenv("PATH") or ""),
		TERM = "xterm-256color",
	}

	-- Quit wezterm when all windows are closed
	config.quit_when_all_windows_are_closed = true

	-- Don't adjust window size because of tiling window manager
	config.adjust_window_size_when_changing_font_size = false

	-- Use kitty keyboard protocol over csi-u
	config.enable_kitty_keyboard = true
	config.enable_csi_u_key_encoding = false

	-- Make Option key work as expected (right option as alt like in kitty)
	config.send_composed_key_when_left_alt_is_pressed = true
	config.send_composed_key_when_right_alt_is_pressed = false

	-- Scrollback lines (matching kitty: 10000)
	config.scrollback_lines = 10000

	-- Optimize frame rate for performance
	config.max_fps = 60
	config.animation_fps = 60

	-- Set color scheme (Nord theme)
	config.color_scheme = "nord"
	config.colors = wezterm.color.get_builtin_schemes()["nord"]
	config.window_background_opacity = 1.9
	config.macos_window_background_blur = 8

	-- Font style with ligatures (matching kitty: size 13)
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

	-- Font size (matching kitty: 13)
	config.font_size = 13
	config.line_height = 1.2

	-- Use integrated titlebar with terminal colors
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

	-- Window padding (matching kitty: 1 5 2 2)
	config.window_padding = {
		left = 5,
		right = 2,
		top = 41,
		bottom = 2,
	}

	-- Disable dimming of inactive panes (tmux handles this)
	config.inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 1.0,
	}

	-- Underline
	config.underline_position = "150%"
	config.underline_thickness = "200%"

	-- Cursor style (matching kitty: beam cursor with blink)
	config.default_cursor_style = "BlinkingBar"
	config.cursor_blink_rate = 500
	config.cursor_blink_ease_in = "Constant"
	config.cursor_blink_ease_out = "Constant"
	config.cursor_thickness = "1.5pt"

	-- Disable audio bell
	config.audible_bell = "Disabled"

	-- Tab bar settings (hide tab bar, using tmux instead)
	config.enable_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true

	-- Start shell with tmux (matching kitty behavior)
	config.default_prog = { "zsh", "--login" }
end

return options
