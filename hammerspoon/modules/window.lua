-- 关闭动画持续时间
hs.window.animationDuration = 0

-- store original window position
local frameCache = {}


-- 判断指定屏幕是否为竖屏
function isVerticalScreen(screen)
    if (screen:rotate() == 90 or screen:rotate() == 270) then
        return true
    else
        return false
    end
end


-- 窗口移动

-- 左半屏
hs.hotkey.bind({"alt", "ctrl"}, "Left", "1/2 Left", function()
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

-- 右半屏
hs.hotkey.bind({"alt", "ctrl"}, "Right", "1/2 Right", function()
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

-- 上半屏
hs.hotkey.bind({"alt", "ctrl"}, "Up", "1/2 Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

-- 下半屏
hs.hotkey.bind({"alt", "ctrl"}, "Down", "1/2 Down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f) 
end)

-- 1/6 Top Left
hs.hotkey.bind({"alt", "ctrl"}, "e", "1/6 Left Top", function()
    local win = hs.window.focusedWindow()
    local displays = hs.screen.allScreens()
    win:moveToScreen(displays[2], false, true)

    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h / 2
    win:setFrame(f)
end)

-- 1/6 Bottom Left≈
hs.hotkey.bind({"alt", "ctrl"}, "d", "1/6 Left Bottom", function()
    local win = hs.window.focusedWindow()
    local displays = hs.screen.allScreens()
    win:moveToScreen(displays[2], false, true)

    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w / 3
    f.h = max.h / 2
    win:setFrame(f)
end)

-- 1/3 Left
hs.hotkey.bind({"alt", "ctrl"}, "s", "1/3 Left", function()
    local win = hs.window.focusedWindow()
    local displays = hs.screen.allScreens()
    win:moveToScreen(displays[2], false, true)

    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
end)

-- 2/3 Right
hs.hotkey.bind({"alt", "ctrl"}, "w", "2/3 Right", function()
    local win = hs.window.focusedWindow()
    local displays = hs.screen.allScreens()
    win:moveToScreen(displays[2], false, true)
    
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 3)
    f.y = max.y
    f.w = max.w / 3 * 2
    f.h = max.h
    win:setFrame(f)
end)

-- 左上角
hs.hotkey.bind({"alt", "ctrl"}, "q", "1/2 Left Top", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-- 左下角
hs.hotkey.bind({"alt", "ctrl"}, "a", "1/2 Left Bottom", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-- Maximize/Restore Window
hs.hotkey.bind({"alt", "ctrl"}, "x", "Max/Restore Window", function()
    local win = hs.window.focusedWindow()
    if frameCache[win:id()] then
          win:setFrame(frameCache[win:id()])
          frameCache[win:id()] = nil
    else
        frameCache[win:id()] = win:frame()
        win:maximize()
    end
end)

-- 将窗口移动到左侧屏幕
hs.hotkey.bind({"alt", "ctrl", "cmd"}, "Left", "Move To Left Screen", function()
    local win = hs.window.focusedWindow()
    if (win) then
        win:moveOneScreenWest()
    end
end)

-- 将窗口移动到右侧屏幕
hs.hotkey.bind({"alt", "ctrl", "cmd"}, "Right", "Move To Right Screen", function()
    local win = hs.window.focusedWindow()
    if (win) then
        win:moveOneScreenEast()
    end
end)


-- -- Zoom in/out 
hs.hotkey.bind({"alt", "ctrl"}, "z", "Zoom in/out", function()
        hs.eventtap.keyStroke({"alt","cmd"},"8")
end)


-- -- Layout full screen 
-- hs.hotkey.bind({"alt", "ctrl"}, "e", "Layout:ChromeX2,WebEX", function()
-- end)



--[[  Summary Keys

Q:1/2 Left Top      W:2/3 Right     E:1/6 Left Top
A:1/2 Left Bottom   S:1/3 Left      D:1/6 Left Botton
Z:Zoom in/out       X:Max/Restore   C:>MonoClip 
⌃⌥ Up,Dn,L,R:1/2 Screen     ⌃⌥⌘L/R: Monitors

]]
