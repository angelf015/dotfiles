local wezterm = require("wezterm")

return function(config)
	local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
	tabline.setup({
		options = {
			theme = "nord",
			section_separators = {
				left = wezterm.nerdfonts.ple_right_half_circle_thick,
				right = wezterm.nerdfonts.ple_left_half_circle_thick,
			},
			-- Component_separators = {
			-- 	left = wezterm.nerdfonts.ple_right_half_circle_thin,
			-- 	right = wezterm.nerdfonts.ple_left_half_circle_thin,
			-- },
			tab_separators = {
				left = wezterm.nerdfonts.ple_right_half_circle_thick,
				right = wezterm.nerdfonts.ple_left_half_circle_thick,
			},
		},
		sections = {
			tabline_a = {
				{ "mode", fmt = string.lower },
			},
			tab_active = {
				-- { Attribute = { Intensity = "Bold" } },
				-- { Foreground = { Color = "pink" } },
				-- "index",
				"ResetAttributes",
				{ "process", padding = 0 },
				-- "/",
				-- { Attribute = { Intensity = "Bold" } },
				-- { "cwd", padding = { left = 0, right = 1 } },
				-- { "zoomed", padding = 0 },
			},
			-- tab_inactive = { "index", { "process", icons_only = true, padding = 0 } },
			tab_inactive = {
				-- "index",
				{ "process", padding = 0 },
				"ResetAttributes",
			},

			tabline_x = {},
			tabline_y = { "ram", "cpu" },
		},
		extensions = {
			"resurrect",
			"smart_workspace_switcher",
			"quick_domains",
			"presentation",
		},
	})
	tabline.apply_to_config(config)
	config.window_decorations = "RESIZE"
end
