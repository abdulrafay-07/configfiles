local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "rose-pine-moon"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15.0
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE|MACOS_FORCE_ENABLE_SHADOW"
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.colors = {
	tab_bar = {
		background = "#191724",

		active_tab = {
			bg_color = "#26233a",
			fg_color = "#e0def4",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#191724",
			fg_color = "#6e6a86",
		},

		inactive_tab_hover = {
			bg_color = "#211f2f",
			fg_color = "#908caa",
		},

		new_tab = {
			bg_color = "#191724",
			fg_color = "#6e6a86",
		},

		new_tab_hover = {
			bg_color = "#26233a",
			fg_color = "#e0def4",
		},
	},
}

wezterm.on("format-tab-title", function(tab)
	local title = tab.active_pane.title

	if title == "" then
		title = "zsh"
	end

	local index = tab.tab_index + 1

	return {
		{ Foreground = { Color = tab.is_active and "#e0def4" or "#6e6a86" } },
		{ Text = "  " .. index .. ": " .. title .. "  " },
	}
end)

wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()

	local screen = wezterm.gui.screens().active

	gui_window:set_position(screen.x, screen.y)
	gui_window:set_inner_size(screen.width, screen.height)
end)

-- ============================================================
-- Dim unfocused windows
-- ============================================================

local UNFOCUSED_FOREGROUND_TEXT_HSB = {
	hue = 1.0,
	saturation = 0.25,
	brightness = 0.45,
}

local UNFOCUSED_WINDOW_BACKGROUND_OPACITY = 0.62

local function same_text_hsb(actual, expected)
	if actual == nil or expected == nil then
		return actual == expected
	end

	return actual.hue == expected.hue
		and actual.saturation == expected.saturation
		and actual.brightness == expected.brightness
end

wezterm.on("window-focus-changed", function(window)
	local overrides = window:get_config_overrides() or {}
	local text_hsb, opacity

	if not window:is_focused() then
		text_hsb = UNFOCUSED_FOREGROUND_TEXT_HSB
		opacity = UNFOCUSED_WINDOW_BACKGROUND_OPACITY
	end

	if same_text_hsb(overrides.foreground_text_hsb, text_hsb) and overrides.window_background_opacity == opacity then
		return
	end

	overrides.foreground_text_hsb = text_hsb
	overrides.window_background_opacity = opacity

	window:set_config_overrides(overrides)
end)

return config
