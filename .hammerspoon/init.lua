--[[ hotkey glossary
window: move active screen to left half - mash-"Left"
window: move active screen to left half - mash-"Right"
window: maximize active screen - mash-"Up"
window: minimize active screen - mash-"Down"
screens: re-apply monitor layout - mash-S
system: lock screen - mashshift-L
system: put machine into sleep mode - mashshift-S
]]--

--[[ to get table values in Hammerspoon console
APPS = hs.window.runningApplications
for key,value in pairs(APPS) do print(key,value) end
]]--

hs.window.animationDuration = 0

-- Set up hotkey combinations
local mash      = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "ctrl", "shift"}

-- Define monitor names for layout purposes
local laptopScreen = "Color LCD"
local monitorScreen1 = "SyncMaster"
-- local monitorScreen2 = "Dell "

-- Define audio device names for headphone/speaker switching
local speakerDevice = "UMC+XR18"
local mixerDevice = "X18/XR18"

-- CORE: reload changes to init.lua config
-- set up auto reload of init.lua changes
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- HOTKEY: lock screen shortcut
hs.hotkey.bind(mashshift, 'L', function()
  hs.caffeinate.lockScreen()
end)

-- HOTKEY: lock screen shortcut
hs.hotkey.bind(mashshift, 'S', function()
  hs.caffeinate.systemSleep()
end)

-- WINDOW: move or resize active screen
--  move active screen to left half {"cmd", "alt", "ctrl"}, "Left"
--  maximize active screen to entire screen {"cmd", "alt", "ctrl"}, "Up"
--  move active screen to left half {"cmd", "alt", "ctrl"}, "Right"
--  move active screen to left half {"cmd", "alt", "ctrl"}, "Down"
hs.hotkey.bind(mash, "Left", function()
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

hs.hotkey.bind(mash, "Right", function()
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

hs.hotkey.bind(mash, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  win:maximize()
end)

hs.hotkey.bind(mash, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  win:minimize()
end)

-- WINDOW: arrange app windows to available screens
local laptopLayout = {
    {"Google Chrome", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Safari", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Atom", nil, laptopScreen, hs.layout.left50, nil, nil},
    {"REAPER", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Spotify", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"X-AIR-Edit", nil, laptopScreen, hs.layout.maximized, nil, nil}
}
local syncmasterLayout = {
    {"Google Chrome", nil, monitorScreen1, hs.layout.maximized, nil, nil},
    {"Safari", nil, monitorScreen1, hs.layout.right50, nil, nil},
    {"Atom", nil, monitorScreen1, hs.layout.left50, nil, nil},
    {"REAPER", nil, monitorScreen1, hs.layout.maximized, nil, nil},
    {"Spotify", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"X-AIR-Edit", nil, laptopScreen, hs.layout.maximized, nil, nil}
}
if hs.screen.findByName("SyncMaster") then
    hs.layout.apply(syncmasterLayout)
else
    hs.layout.apply(laptopLayout)
end
-- HOTKEY: re-apply display arrangement
hs.hotkey.bind(mash, 'D', function()
  hs.layout.apply(syncmasterLayout)
end)
