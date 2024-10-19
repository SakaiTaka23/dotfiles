function toggleApp(appName, key)
    hs.hotkey.bind({ "option" }, key, function()
        local app = hs.application.get(appName)
        if app == nil then
            hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
        elseif app:isFrontmost() then
            app:hide()
        else
            hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
        end
    end)
end

toggleApp("Wezterm", "space")

hs.window.animationDuration = 0
hs.hotkey.bind({ "ctrl", "option" }, "left", function()
    -- size focused window to left half of display
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "option", "shift" }, "left", function()
    -- size focused window to left third of display
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = (max.w / 2) * 1.5
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "option" }, "right", function()
    -- size focused window to right half of display
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "option", "shift" }, "right", function()
    -- size focused window to left third of display
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 3)
    f.y = max.y
    f.w = (max.w / 2) * 3
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "option" }, "c", function()
    -- center the focused window without resizing
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w - f.w) / 2
    f.y = max.y + (max.h - f.h) / 2
    win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "option", "shift" }, "c", function()
    -- Resize the focused window to 2/3 of the screen size and center it
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w * 2 / 3
    f.x = max.x + (max.w - f.w) / 2
    win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "option" }, "return", function()
    -- size focused window to size of desktop
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)
