function newWindow()
 local app = hs.application.find("Firefox")
 app:selectMenuItem( {"File", "New Window"} )
end

hs.hotkey.bind({'alt', 'ctrl', 'cmd'}, 'n', newWindow)



---
--- hs.application.open(app[, wait, [waitForFirstWindow]]) -> hs.application object
---
--- launch Terminal, wait for launch, create new window
---

local application = require("hs.application")
local timer = require ("hs.timer")

local checkTimerTimeoutCounter = 0

checkTimer = timer.new(0.1, function()
    if checkTimerTimeoutCounter == 10 then
        checkTimer:stop()
        checkTimerTimeoutCounter = 0
        return
    end
    local apps = application.applicationsForBundleID("com.apple.Terminal")
    local terminal = apps and apps[1]
    if terminal then        
        if terminal:activate() then 
            local focusedWindow = terminal:focusedWindow()
            if focusedWindow then
                focusedWindow:maximize()
                checkTimer:stop()
                checkTimerTimeoutCounter = 0
                return
            else            
                -- Terminal is activated, but there's no windows:
                terminal:selectMenuItem({"Shell", "New Window", "Basic"})
            end
        end
    end
    checkTimerTimeoutCounter = checkTimerTimeoutCounter + 1
end)

hs.hotkey.bind({"control", "option", "command"}, "q", function()
    local apps = application.applicationsForBundleID("com.apple.Terminal")
    local terminal = apps and apps[1]
    if terminal then
        checkTimer:start()
        return
    else
        if application.launchOrFocusByBundleID("com.apple.Terminal") then
            checkTimer:start()
            return
        end
    end
end)
