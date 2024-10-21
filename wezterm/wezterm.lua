local wezterm = require("wezterm")

return {
	default_prog = { "/usr/bin/zsh" },
	front_end = "WebGpu",
	color_scheme = "Catppuccin Mocha",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	colors = {
		cursor_bg = "#c4ccff",
	},
	font = wezterm.font("JetBrains Mono", { weight = "DemiBold" }),
	font_size = 12,
	enable_wayland = true,
	warn_about_missing_glyphs = false,
	window_padding = {
		right = 4,
		left = 4,
		bottom = 0,
	},
	use_resize_increments = true,

	-- allow_square_glyphs_to_overflow_width = "",
	-- cell_width = 1,
	-- window_decorations = "RESIZE",
	-- dpi = 100,
	-- freetype_load_target = "Light",
	-- freetype_load_flags = "NO_AUTOHINT",
	-- line_height = 0.9,
}
