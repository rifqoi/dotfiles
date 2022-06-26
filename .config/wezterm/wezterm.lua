local wezterm = require("wezterm")
local colors = {
	bg = "#1d2021",
	fg = "#d4be98",
	black = "#32302f",
	red = "#ea6962",
	green = "#a9b665",
	yellow = "#d8a657",
	blue = "#7daea3",
	magenta = "#d3869b",
	cyan = "#89b482",
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
	-- colors = {
	-- 	selection_fg = "none",
	-- 	selection_bg = "rgba(50% 50% 50% 50%)",
	-- 	foreground = colors.fg,
	-- 	background = colors.bg,
	-- 	ansi = colors_f,
	-- 	cursor_fg = colors.cursor,
	-- 	cursor_bg = colors.cursor,
	-- 	cursor_border = colors.cursor,
	-- 	brights = colors_f,
	-- 	tab_bar = {
	-- 		background = colors.bg,
	-- 		active_tab = {
	-- 			bg_color = colors.black,
	-- 			fg_color = colors.fg,
	-- 			intensity = "Bold",
	-- 		},
	-- 		inactive_tab = {bg_color = "#282828", fg_color = colors.fg},
	-- 		inactive_tab_hover = {
	-- 			bg_color = "#282828",
	-- 			fg_color = colors.fg,
	-- 			italic = true,
	-- 		},
	-- 	},
	-- },
	color_scheme = "tokyonight",
	force_reverse_video_cursor = true,

	initial_rows = 28,
	initial_cols = 100,
	show_tab_index_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	exit_behavior = "Close",
}
