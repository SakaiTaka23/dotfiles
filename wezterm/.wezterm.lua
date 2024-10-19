local wezterm = require('wezterm')
local act = wezterm.action
local config = wezterm.config_builder()
local mux = wezterm.mux

-- color
config.color_scheme = 'Dracula (Official)'
config.font = wezterm.font('UDEV Gothic 35NFLG')
config.font_size = 16

-- window
config.window_background_opacity = 0.7
config.macos_window_background_blur = 0
config.window_decorations = 'NONE'
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

-- payload
wezterm.on('gui-startup', function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

local function get_current_working_dir(tab)
    local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = '' }
    local HOME_DIR = os.getenv('HOME')

    return current_dir.file_path == HOME_DIR and '~'
        or string.gsub(current_dir.file_path, '(.*[/\\])(.*)', '%2')
end
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
wezterm.on('format-tab-title', function(tab, _, _, _, _, _)
    local background = '#282A36'
    local foreground = '#6272A4'
    local edge_background = 'none'

    if tab.is_active then
        background = '#6272A4'
        foreground = '#282A36'
    end
    local edge_foreground = background

    local title = get_current_working_dir(tab)

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_LEFT_ARROW },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_RIGHT_ARROW },
    }
end)

-- keybind
config.keys = {
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'LeftArrow',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Down',
    },
    {
        key = 'LeftArrow',
        mods = 'ALT',
        action = act.SendKey { key = 'b', mods = 'ALT' },
    },
    {
        key = 'RightArrow',
        mods = 'ALT',
        action = act.SendKey { key = 'f', mods = 'ALT' },
    },
}

return config
