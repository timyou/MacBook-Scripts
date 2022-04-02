hs.window.animationDuration = 0

local mash      = {"cmd", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}

  
hs.hotkey.bind(mash, 'F', function() hs.window.focusedWindow():toggleFullScreen() end)
hs.hotkey.bind(mashshift, 'left',  function() hs.window.focusedWindow():focusWindowWest()  end)
hs.hotkey.bind(mashshift, 'right', function() hs.window.focusedWindow():focusWindowEast()  end)
hs.hotkey.bind(mashshift, 'up',    function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mashshift, 'down',  function() hs.window.focusedWindow():focusWindowSouth() end)


--
-- Chrome open two tabs 
--
-- https://superuser.com/questions/182720/keyboard-shortcut-to-pull-google-chrome-tab-into-its-own-window
hs.hotkey.bind(mash, 'x', function()
   hs.eventtap.keyStroke({"cmd"}, "l")
   hs.eventtap.keyStroke({"cmd"}, "c")
   hs.eventtap.keyStroke({"cmd"}, "n")
   hs.eventtap.keyStroke({"cmd"}, "v")
   hs.eventtap.keyStroke({}, "return")
   hs.eventtap.keyStroke({"cmd"}, "`")
   hs.eventtap.keyStroke({"cmd"}, "w")
   end)


--
-- Move Window among monitors
--
  
  function send_window_prev_monitor()
    hs.alert.show("Prev Monitor")
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():previous()
    win:moveToScreen(nextScreen)
  end
  
  function send_window_next_monitor()
    hs.alert.show("Next Monitor")
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():next()
    win:moveToScreen(nextScreen)
  end
