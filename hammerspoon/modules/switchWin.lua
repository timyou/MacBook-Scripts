hs.window.switcher.ui.showTitles = true
hs.window.switcher.ui.showThumbnails = false
hs.window.switcher.ui.thumbnailSize = 128
hs.window.switcher.ui.showSelectedThumbnail = false

local wf = hs.window.filter.new():setDefaultFilter{}
local switcher = hs.window.switcher.new(wf)

hs.hotkey.bind('alt','tab', function()
	switcher:next()
  end)
