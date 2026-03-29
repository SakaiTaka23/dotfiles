-- Hotkeyウィンドウの設定
local hotkeyWindowHeight = 1.0 -- 画面の100%の高さ
local ghosttyBundleID = "com.mitchellh.ghostty"

-- 現在のスクリーンに移動してリサイズ
local function moveAndResizeWindow(app)
    local win = app:mainWindow()

    if win == nil then
        return
    end

    -- 画面移動直後はサイズが古いことがあるので、短い間隔で数回リトライ
    local attempts = 6
    local function applyFrame()
        local screen = hs.mouse.getCurrentScreen()
        if screen == nil then
            return
        end

        local screenFrame = screen:frame()
        win:setFrame({
            x = screenFrame.x,
            y = screenFrame.y,
            w = screenFrame.w,
            h = screenFrame.h * hotkeyWindowHeight
        }, 0)

        -- 位置確定後に前面化・フォーカス
        app:activate(true)
        win:focus()

        attempts = attempts - 1
        if attempts > 0 then
            hs.timer.doAfter(0.08, applyFrame)
        end
    end
    applyFrame()
end

-- toggle で ghostty を表示/非表示する
local function toggleGhostty()
    local appName = "Ghostty"
    local app = hs.application.get(appName)

    if app == nil then
        hs.application.launchOrFocusByBundleID(ghosttyBundleID)
        -- 起動後にウィンドウを配置
        local attempts = 6
        local function tryMove()
            local newApp = hs.application.get(appName)
            if newApp and newApp:mainWindow() then
                moveAndResizeWindow(newApp)
                return
            end
            attempts = attempts - 1
            if attempts > 0 then
                hs.timer.doAfter(0.1, tryMove)
            end
        end
        hs.timer.doAfter(0.2, tryMove)
    elseif app:isFrontmost() then
        app:hide()
    else
        moveAndResizeWindow(app)
    end
end

-- Option + Space で toggle
hs.hotkey.bind({ "option" }, "space", toggleGhostty)
