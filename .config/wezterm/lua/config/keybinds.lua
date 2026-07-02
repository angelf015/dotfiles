local wezterm = require("wezterm")
local act = wezterm.action

local function keybinds(config)
	-- Enable all default bindings first, then override
	config.disable_default_key_bindings = false

	-- Leader key (Ctrl+a like tmux)
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

	-- stylua: ignore
	config.keys = {
		-- Essential macOS shortcuts
		{ key = "c", mods = "SUPER", action = act.CopyTo('Clipboard') },
		{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
		{ key = "=", mods = "SUPER", action = act.IncreaseFontSize },
		{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
		{ key = "0", mods = "SUPER", action = act.ResetFontSize },
		{ key = "q", mods = "SUPER", action = act.QuitApplication },
		{ key = "n", mods = "SUPER", action = act.SpawnWindow },
		{ key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "r", mods = "SUPER", action = act.ReloadConfiguration },
		{ key = "k", mods = "SUPER", action = act.ClearScrollback("ScrollbackAndViewport") },

		-- Clear terminal with Ctrl+L (standard terminal behavior)
		{ key = "l", mods = "CTRL", action = act.SendKey({ key = "l", mods = "CTRL" }) },

		--==============================================================================
		-- SPLITS (tmux-style with Ctrl+a prefix)
		--==============================================================================
		-- Ctrl+a + v: split vertical (like kitty/tmux)
		{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		-- Ctrl+a + d: split horizontal
		{ key = "d", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- Ctrl+a + s: alternative for vertical split
		{ key = "s", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

		--==============================================================================
		-- NAVIGATION (vim-style: h/j/k/l with Ctrl+a prefix)
		--==============================================================================
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

		-- Direct navigation without prefix (vim-tmux-navigator style)
		{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		-- Note: Ctrl+l is reserved for clear terminal

		--==============================================================================
		-- RESIZE (with Ctrl+a + Shift+H/J/K/L)
		--==============================================================================
		{ key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

		-- Additional resize with Ctrl+Cmd+Option (matching kitty)
		{ key = "h", mods = "CTRL|CMD|ALT", action = act.AdjustPaneSize({ "Left", 3 }) },
		{ key = "j", mods = "CTRL|CMD|ALT", action = act.AdjustPaneSize({ "Down", 3 }) },
		{ key = "k", mods = "CTRL|CMD|ALT", action = act.AdjustPaneSize({ "Up", 3 }) },
		{ key = "l", mods = "CTRL|CMD|ALT", action = act.AdjustPaneSize({ "Right", 3 }) },

		--==============================================================================
		-- PANE MANAGEMENT
		--==============================================================================
		-- Ctrl+a + x: close pane (like tmux kill-pane)
		{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
		-- Ctrl+a + z: toggle zoom/maximize pane
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		-- Ctrl+a + Space: rotate panes
		{ key = " ", mods = "LEADER", action = act.RotatePanes("Clockwise") },

		--==============================================================================
		-- CONFIG RELOAD
		--==============================================================================
		-- Ctrl+a + r: reload config
		{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },
		-- Ctrl+Cmd+,: reload config (alternative)
		{ key = ",", mods = "CTRL|CMD", action = act.ReloadConfiguration },

		--==============================================================================
		-- TAB MANAGEMENT (tmux-style "windows" = wezterm "tabs")
		--==============================================================================
		-- Ctrl+a + c: create new tab
		{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		-- Ctrl+a + &: close tab with confirmation
		{ key = "&", mods = "LEADER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
		-- Ctrl+a + q: close tab without confirmation
		{ key = "q", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },

		-- TAB NAVIGATION
		-- Ctrl+a + n: next tab
		{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
		-- Ctrl+a + <: previous tab
		{ key = "<", mods = "LEADER|SHIFT", action = act.ActivateTabRelative(-1) },

		-- TAB SELECTION BY NUMBER (Ctrl+a + 1-9)
		{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
		{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
		{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
		{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
		{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
		{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
		{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
		{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
		{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },

		-- TAB RENAMING
		-- Ctrl+a + ,: rename tab
		{ key = ",", mods = "LEADER", action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}) },

		-- TAB MOVING
		-- Ctrl+a + <: move tab left
		{ key = ",", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
		-- Ctrl+a + >: move tab right
		{ key = ".", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

		-- Cmd+t: new tab (macOS style)
		{ key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },

		-- Cmd+w: close tab (macOS style)
		{ key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = false }) },

		--==============================================================================
		-- COPY MODE
		--==============================================================================
		{ key = "y", mods = "SUPER", action = act.ActivateCopyMode },
		{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },

		--==============================================================================
		-- LAYOUT SWITCHING
		--==============================================================================
		{ key = "u", mods = "CTRL|CMD|ALT", action = act.PaneSelect({ mode = "SwapWithActive" }) },
		{ key = "i", mods = "CTRL|CMD|ALT", action = act.PaneSelect },
		{ key = "o", mods = "CTRL|CMD|ALT", action = act.PaneSelect({ mode = "Activate" }) },
	}

	config.key_tables = {
		copy_mode = {
			{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "Space", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = ",", mods = "NONE", action = act.CopyMode("JumpReverse") },
			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
			{ key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
			{ key = "F", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "T", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
			{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
			{ key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
			{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
			{ key = "g", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
			{ key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{
				key = "y",
				mods = "NONE",
				action = wezterm.action_callback(function(window, pane)
					window:copy_to_clipboard_and_clear_selection()
					window:perform_action(act.CopyMode("Close"), pane)
				end),
			},
			{
				key = "c",
				mods = "SUPER",
				action = wezterm.action_callback(function(window, pane)
					window:copy_to_clipboard_and_clear_selection()
					window:perform_action(act.CopyMode("Close"), pane)
				end),
			},
		},

		search_mode = {
			{ key = "Enter", mods = "NONE", action = act.CopyMode("PriorMatch") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
			{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
			{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
			{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
		},
	}
end

return keybinds
