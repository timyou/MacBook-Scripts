local hyper = {'ctrl', 'option'}

hs.window.animationDuration = 0 -- don't waste time on animation when resize window

-- Key to launch application.
local key2App = {
    h = {'/Applications/iTerm.app', 'English', 2},
    k = {'/Applications/Google Chrome.app', 'English', 1},
    l = {'/System/Library/CoreServices/Finder.app', 'English', 1},
    f = {'/Applications/Chromium.app', 'English', 1},
    w = {'/Applications/WeChat.app', 'Chinese', 1},
    a = {'/Applications/wechatwebdevtools.app', 'English', 2},
    d = {'/Applications/Dash.app', 'English', 1},
    s = {'/Applications/System Preferences.app', 'English', 1},
    p = {'/Applications/Preview.app', 'Chinese', 2},
    b = {'/Applications/MindNode.app', 'Chinese', 1},
    n = {'/Applications/NeteaseMusic.app', 'Chinese', 1},
    m = {'/Applications/Sketch.app', 'English', 2},
}

-- Show launch application's keystroke.
local showAppKeystrokeAlertId = ""

local function showAppKeystroke()
    if showAppKeystrokeAlertId == "" then
        -- Show application keystroke if alert id is empty.
        local keystroke = ""
        local keystrokeString = ""
        for key, app in pairs(key2App) do
            keystrokeString = string.format("%-10s%s", key:upper(), app[1]:match("^.+/(.+)$"):gsub(".app", ""))

            if keystroke == "" then
                keystroke = keystrokeString
            else
                keystroke = keystroke .. "\n" .. keystrokeString
            end
        end

        showAppKeystrokeAlertId = hs.alert.show(keystroke, hs.alert.defaultStyle, hs.screen.mainScreen(), 10)
    else
        -- Otherwise hide keystroke alert.
        hs.alert.closeSpecific(showAppKeystrokeAlertId)
        showAppKeystrokeAlertId = ""
    end
end

hs.hotkey.bind(hyper, "z", showAppKeystroke)



hs.hotkey.bind(hyper, '/', function()
        hs.hints.windowHints()
end)
