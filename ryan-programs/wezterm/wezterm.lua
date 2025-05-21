local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

config.font = wezterm.font { 
  family = 'Iosevka',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 14

config.color_scheme = 'Ayu Light (Gogh)'

config.window_frame = {
  font = wezterm.font { 
    family = 'Iosevka',
    weight = 'Bold',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  },
  font_size = 13,
  active_titlebar_bg = '#f3f3f3',
  inactive_titlebar_bg = '#f3f3f3',
}

config.window_close_confirmation = 'NeverPrompt'

config.initial_rows = 37
config.initial_cols = 185

config.colors = {
  cursor_fg = '#000000',
  cursor_bg = '#becee3',
  cursor_border = '#becee3',

  selection_bg = 'rgba(111, 111, 111, 0.2)',

  tab_bar = {
    inactive_tab_edge = '#dddddd',
    active_tab = {
      bg_color = '#ebcf60',
      fg_color = '#555555',
    },
    inactive_tab = {
      bg_color = '#cfcfcf',
      fg_color = '#555555',
    },
    inactive_tab_hover = {
      bg_color = '#cfcfcf',
      fg_color = '#000000',
    },
    new_tab = {
      bg_color = '#cfcfcf',
      fg_color = '#555555',
    },
    new_tab_hover = {
      bg_color = '#cfcfcf',
      fg_color = '#000000',
    },
  },
}

function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local pane_title = basename(pane.foreground_process_name)
  local idx = tostring(tab.tab_index + 1)
  return {
    {Text=idx .. ": " .. ((pane_title and pane_title ~= "") and pane_title or "unset")},
  }
end)

return config

