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

	-- Increase number of drawn frames
	config.max_fps = 144
	config.animation_fps = 144

	-- Set color scheme
	config.color_scheme = "nord"
	config.colors = wezterm.color.get_builtin_schemes()["nord"]
	-- config.window_background_opacity = 0.9

	-- Font style without ligatures
	config.font = require("wezterm").font_with_fallback({
		{
			family = "DankMono Nerd Font",
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
	})

	config.font_rules = {
		{
			italic = true,
			intensity = "Bold",
			font = wezterm.font("DankMono Nerd Font", {
				italic = true,
				weight = "Regular",
			}),
		},
	}

	-- Font size
	config.font_size = 16
	config.line_height = 1.2

	-- Disable window resize UI
	config.window_decorations = "RESIZE"

	-- Disable window padding
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}

	-- Dimming of inactive panes
	config.inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 0.9,
	}

	-- Underline
	config.underline_position = "150%"
	config.underline_thickness = "200%"

	-- Set terminal style for tab bar
	config.use_fancy_tab_bar = false

	-- Hide new tab button
	config.show_new_tab_button_in_tab_bar = false

	-- Increase max tab width
	config.tab_max_width = 32

	-- Update status faster
	config.status_update_interval = 500
end

return options
