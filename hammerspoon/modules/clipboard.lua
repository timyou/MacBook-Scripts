hs.loadSpoon('ClipboardTool')
spoon.ClipboardTool.hist_size = 10
spoon.ClipboardTool.show_in_menubar = false
spoon.ClipboardTool.show_copied_alert = false
spoon.ClipboardTool.paste_on_select = true
spoon.ClipboardTool:start()
spoon.ClipboardTool:bindHotkeys({
  toggle_clipboard = { {'ctrl', 'alt'}, 'e' }
})
