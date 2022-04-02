hs.window.animationDuration = 0

--
-- Grid Position
--

positions = {
    upper50Left50  = {x=0,    y=0, w=0.5,  h=0.5},
    upper50Right15 = {x=0.85, y=0, w=0.15, h=0.5},
    upper50Right50 = {x=0.5,  y=0, w=0.5,  h=0.5},
    
    lower50Left50  = {x=0,    y=0.5, w=0.5, h=0.5},
    lower50Right50 = {x=0.5,  y=0.5, w=0.5, h=0.5},
    
    chat = {x=0.5, y=0.5, w=0.5, h=0.5}
    }

--
-- Layouts
--

layouts = {
    {
      name="Coding",
      description="For fun and profit",
      small={
        {"Firefox", nil, screen, hs.layout.left70,  nil, nil},
        {"nvALT",   nil, screen, hs.layout.right30, nil, nil},
      },
      large={
        {"Firefox", nil, screen, hs.layout.left50,        nil, nil},
        {"nvALT",   nil, screen, {x=0.7,y=0,w=0.3,h=0.5}, nil, nil}, --upper50Right30
      }
    },
    {
      name="Blogging",
      description="Time to write",
      small={
        {"Firefox",  nil, screen, hs.layout.left50,  nil, nil},
        {"iTerm2",   nil, screen, hs.layout.right50, nil, nil},
      }
    },
    {
      name="Work",
      description="Pedal to the metal",
      small={
        {"Firefox", nil, screen, hs.layout.maximized, nil, nil},
        {"Slack",   nil, screen, hs.layout.maximized, nil, nil},
        {"nvALT",   nil, screen, hs.layout.right30,   nil, nil},
      },
      large={
        {"Firefox",   nil,        screen, hs.layout.left50,         nil, nil},
        {"Firefox", "DevTools - ", screen, positions.lower50Right50, nil, nil},
        {"Slack",     nil,        screen, positions.chat,           nil, nil},
        {"nvALT",     nil,        screen, positions.upper50Right15, nil, nil},
      }
    }
  }
  currentLayout = null
  --layouts[3]['name'] -> Work
  --layouts[3]['small'][2][1] --> Slack 

  function applyLayout(layout)
    local screen = hs.screen.mainScreen()
    local layoutSize = layout.small

    if layout.large and screen:currentMode().w > 1500 then
      layoutSize = layout.large
    end
  
    currentLayout = layout
    hs.layout.apply(layoutSize, function(windowTitle, layoutWindowTitle)
      return string.sub(windowTitle, 1, string.len(layoutWindowTitle)) == layoutWindowTitle
    end)
  end
  

  layoutChooser = hs.chooser.new( function(selection)
    if not selection then return end
    -- Show a window of options (layouts) and let user to choose.
    applyLayout(layouts[selection.index])
  end)

  i = 0
  layoutChooser:choices(hs.fnutils.imap(layouts, function(layout)
    i = i + 1
  
    return {
      index=i,
      text=layout.name,
      subText=layout.description
    }
  end))
  layoutChooser:rows(#layouts)
  layoutChooser:width(20)
  layoutChooser:subTextColor({red=0, green=0, blue=0, alpha=0.4})


hs.screen.watcher.new( function()
    if not currentLayout then return end 
    applyLayout(currentLayout)
end):start()

hs.hotkey.bind({"cmd", "ctrl"}, ";", function()
    layoutChooser:show()
end)
