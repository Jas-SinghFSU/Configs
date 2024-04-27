local wezterm = require 'wezterm'

return {
  default_prog = { "/usr/bin/zsh" },
  color_scheme = "Catppuccin Mocha",
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  colors = {
    cursor_bg = "#c4ccff",
  },
  font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = 'Bold' }),
  font_size = 12,
  enable_wayland = true,
  warn_about_missing_glyphs = false,
  cell_width = 0.9,
  -- window_decorations = "RESIZE",
  -- dpi = 210,
  freetype_load_target = "Light",
  -- freetype_load_flags = "NO_AUTOHINT",
  -- line_height = 0.9,
}
