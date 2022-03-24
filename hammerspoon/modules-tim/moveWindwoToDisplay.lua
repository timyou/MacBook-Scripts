-- Hitting CTRL+ALT+CMD+ 3 moves the currently focused window to display 3, same as if you would choose "Display 3" in the Dock's Option menu.
function moveWindowToDisplay(d)
  return function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    win:moveToScreen(displays[d], false, true)
  end
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "1", moveWindowToDisplay(1))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "2", moveWindowToDisplay(2))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "3", moveWindowToDisplay(3))

-- cycle the focused window through the screens
hs.hotkey.bind({'alt', 'ctrl', 'cmd'}, 'n', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
  -- compute the unitRect of the focused window relative to the current screen and move the window to the next screen setting the same unitRect 
end)

