local wezterm = require("wezterm")

local colors = {
	bg = "#0b0f10",
	fg = "#C5C8C9",
	black = "#32302f",
	red = "#ee6a70",
	green = "#96d6b0",
	yellow = "#ffb29b",
	blue = "#7ba5dd",
	magenta = "#cb92f2",
	cyan = "#7fc8db",
	white = "#d4be98",
	cursor = "#e6d5ae",
}
local colors_f = {
	colors.black,
	colors.red,
	colors.green,
	colors.yellow,
	colors.blue,
	colors.magenta,
	colors.cyan,
	colors.white,
}
wezterm.on("format-tab-title",
           function(tab, tabs, panes, config, hover, max_width)
	return " " .. tab.active_pane.title .. " "
end)

return {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 14,
	window_close_confirmation = "NeverPrompt",
	window_padding = {left = 16, right = 16, top = 16, bottom = 16},
	window_decorations = "RESIZE",
	audible_bell = "Disabled",
	tab_max_width = 25,
	colors = {
		foreground = colors.fg,
		background = colors.bg,
		ansi = colors_f,
		cursor_fg = colors.cursor,
		cursor_bg = colors.cursor,
		cursor_border = colors.cursor,
		brights = colors_f,
		tab_bar = {
			background = colors.bg,
			active_tab = {
				bg_color = colors.black,
				fg_color = colors.fg,
				intensity = "Bold",
			},
			inactive_tab = {bg_color = "#282828", fg_color = colors.fg},
			inactive_tab_hover = {
				bg_color = "#282828",
				fg_color = colors.fg,
				italic = true,
			},
		},
	},
	-- color_scheme = "Gruvbox Dark",
	force_reverse_video_cursor = true,

	initial_rows = 28,
	initial_cols = 100,
	show_tab_index_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	exit_behavior = "Close",
}
