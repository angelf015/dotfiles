local wezterm = require("wezterm")

local function keybinds(config)
	-- Disable default bindings
	config.disable_default_key_bindings = true

	-- stylua: ignore
	config.keys = {
		-- Essential Wezterm actions (tmux handles panes/tabs/windows)
    { key = "c", mods = "SUPER", action = wezterm.action.CopyTo('Clipboard') },
		{ key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
    { key = "=", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "SUPER", action = wezterm.action.ResetFontSize },
		{ key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },
		{ key = "n", mods = "SUPER", action = wezterm.action.SpawnWindow },
    { key = "d", mods = "SHIFT|SUPER", action = wezterm.action.ShowDebugOverlay },
		{ key = "f", mods = "SUPER", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
		{ key = "y", mods = "SUPER", action = wezterm.action.ActivateCopyMode },
		{ key = "r", mods = "SUPER", action = wezterm.action.ReloadConfiguration },
		{
      key = "r",
      mods = "SHIFT|SUPER",
      action = wezterm.action_callback(function()
        wezterm.plugin.update_all()
        wezterm.action.ReloadConfiguration()
      end),
    },
	}

	config.key_tables = {
		copy_mode = {
			{ key = "Tab", mods = "NONE", action = wezterm.action.CopyMode("MoveForwardWord") },
			{ key = "Tab", mods = "SHIFT", action = wezterm.action.CopyMode("MoveBackwardWord") },
			{ key = "Enter", mods = "NONE", action = wezterm.action.CopyMode("MoveToStartOfNextLine") },
			{ key = "Escape", mods = "NONE", action = wezterm.action.CopyMode("Close") },
			{ key = "Space", mods = "NONE", action = wezterm.action.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "$", mods = "NONE", action = wezterm.action.CopyMode("MoveToEndOfLineContent") },
			{ key = "$", mods = "SHIFT", action = wezterm.action.CopyMode("MoveToEndOfLineContent") },
			{ key = ",", mods = "NONE", action = wezterm.action.CopyMode("JumpReverse") },
			{ key = "0", mods = "NONE", action = wezterm.action.CopyMode("MoveToStartOfLine") },
			{ key = ";", mods = "NONE", action = wezterm.action.CopyMode("JumpAgain") },
			{ key = "F", mods = "NONE", action = wezterm.action.CopyMode({ JumpBackward = { prev_char = false } }) },
			{ key = "F", mods = "SHIFT", action = wezterm.action.CopyMode({ JumpBackward = { prev_char = false } }) },
			{ key = "G", mods = "NONE", action = wezterm.action.CopyMode("MoveToScrollbackBottom") },
			{ key = "G", mods = "SHIFT", action = wezterm.action.CopyMode("MoveToScrollbackBottom") },
			{ key = "H", mods = "NONE", action = wezterm.action.CopyMode("MoveToViewportTop") },
			{ key = "H", mods = "SHIFT", action = wezterm.action.CopyMode("MoveToViewportTop") },
			{ key = "L", mods = "NONE", action = wezterm.action.CopyMode("MoveToViewportBottom") },
			{ key = "L", mods = "SHIFT", action = wezterm.action.CopyMode("MoveToViewportBottom") },
			{ key = "M", mods = "NONE", action = wezterm.action.CopyMode("MoveToViewportMiddle") },
			{ key = "M", mods = "SHIFT", action = wezterm.action.CopyMode("MoveToViewportMiddle") },
			{ key = "O", mods = "NONE", action = wezterm.action.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "O", mods = "SHIFT", action = wezterm.action.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "T", mods = "NONE", action = wezterm.action.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "T", mods = "SHIFT", action = wezterm.action.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "V", mods = "NONE", action = wezterm.action.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "V", mods = "SHIFT", action = wezterm.action.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "^", mods = "NONE", action = wezterm.action.CopyMode("MoveToStartOfLineContent") },
			{ key = "^", mods = "SHIFT", action = wezterm.action.CopyMode("MoveToStartOfLineContent") },
			{ key = "b", mods = "NONE", action = wezterm.action.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "ALT", action = wezterm.action.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "CTRL", action = wezterm.action.CopyMode("PageUp") },
			{ key = "c", mods = "CTRL", action = wezterm.action.CopyMode("Close") },
			{ key = "d", mods = "CTRL", action = wezterm.action.CopyMode({ MoveByPage = 0.5 }) },
			{ key = "e", mods = "NONE", action = wezterm.action.CopyMode("MoveForwardWordEnd") },
			{ key = "f", mods = "NONE", action = wezterm.action.CopyMode({ JumpForward = { prev_char = false } }) },
			{ key = "f", mods = "ALT", action = wezterm.action.CopyMode("MoveForwardWord") },
			{ key = "f", mods = "CTRL", action = wezterm.action.CopyMode("PageDown") },
			{ key = "g", mods = "NONE", action = wezterm.action.CopyMode("MoveToScrollbackTop") },
			{ key = "g", mods = "CTRL", action = wezterm.action.CopyMode("Close") },
			{ key = "h", mods = "NONE", action = wezterm.action.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = wezterm.action.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = wezterm.action.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = wezterm.action.CopyMode("MoveRight") },
			{ key = "m", mods = "ALT", action = wezterm.action.CopyMode("MoveToStartOfLineContent") },
			{ key = "o", mods = "NONE", action = wezterm.action.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "q", mods = "NONE", action = wezterm.action.CopyMode("Close") },
			{ key = "t", mods = "NONE", action = wezterm.action.CopyMode({ JumpForward = { prev_char = true } }) },
			{ key = "u", mods = "CTRL", action = wezterm.action.CopyMode({ MoveByPage = -0.5 }) },
			{ key = "v", mods = "NONE", action = wezterm.action.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "CTRL", action = wezterm.action.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "w", mods = "NONE", action = wezterm.action.CopyMode("MoveForwardWord") },
			{
				key = "y",
				mods = "NONE",
				action = wezterm.action.Multiple({
					{ CopyTo = "ClipboardAndPrimarySelection" },
					{ CopyMode = "Close" },
				}),
			},
			{
				key = "c",
				mods = "SUPER",
				action = wezterm.action.Multiple({
					{ CopyTo = "ClipboardAndPrimarySelection" },
					{ CopyMode = "Close" },
				}),
			},
		},

		search_mode = {
			{ key = "Enter", mods = "NONE", action = wezterm.action.CopyMode("PriorMatch") },
			{ key = "Escape", mods = "NONE", action = wezterm.action.CopyMode("Close") },
			{ key = "n", mods = "CTRL", action = wezterm.action.CopyMode("NextMatch") },
			{ key = "p", mods = "CTRL", action = wezterm.action.CopyMode("PriorMatch") },
			{ key = "r", mods = "CTRL", action = wezterm.action.CopyMode("CycleMatchType") },
			{ key = "u", mods = "CTRL", action = wezterm.action.CopyMode("ClearPattern") },
		},
	}
end

return keybinds
