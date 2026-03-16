local open_ghostty = function()
    local appName = "Ghostty"
    local app = hs.application.get(appName)

    if app == nil or app:isHidden() or not (app:isFrontmost()) then
        hs.application.launchOrFocus(appName)
    else
        app:hide()
    end
end
hs.hotkey.bind({ "option" }, "space", open_ghostty)
