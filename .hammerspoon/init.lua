--[[ hotkey glossary
window: move active screen to left half - mash-Left
window: move active screen to right half - mash-Right
window: maximize active screen - mash-Up
window: minimize active screen - mash-Down
windoe: move active window to next screen - mash-N
screens: re-apply monitor layout - mash-M
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
function lockScreen()
  hs.caffeinate.lockScreen()
end
hs.hotkey.bind(mashshift, 'L', lockScreen)

function goToSleep()
  hs.caffeinate.systemSleep()
end
hs.hotkey.bind(mashshift, 'S', goToSleep)

-- WINDOW: move or resize active window
function moveWindowLeftHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end
hs.hotkey.bind(mash, "Left", moveWindowLeftHalf)

function moveWindowRightHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end
hs.hotkey.bind(mash, "Right", moveWindowRightHalf)

function maximizeCurrentWindow()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  win:maximize()
end
hs.hotkey.bind(mash, "Up", maximizeCurrentWindow)

function moveWindowTopHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end
hs.hotkey.bind(mashshift, "Up", moveWindowTopHalf)

function moveWindowBottomHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end
hs.hotkey.bind(mash, "Down", moveWindowBottomHalf)

-- function minimizeCurrentWindow()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()
--   win:minimize()
-- end
-- hs.hotkey.bind(mash, "Down", minimizeCurrentWindow)

function moveWindowNextScreen()
  local win = hs.window.focusedWindow()
  local new_screen = win:screen():next()
  win:moveToScreen(new_screen,true,true)
  win:maximize()
end
hs.hotkey.bind(mash, 'N', moveWindowNextScreen)

-- WINDOW: arrange app windows to available screens
-- define monitor names for layout purposes
local laptopScreen = "Color LCD"
local monitorScreen1 = "SyncMaster"
local monitorScreen2 = "DELL P2815Q"

local laptopLayout = {
    {"Google Chrome", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Safari", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"REAPER", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Spotify", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"X-AIR-Edit", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Finder", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Slack", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Atom", nil, laptopScreen, hs.layout.left50, nil, nil},
    {"iTerm2", nil, laptopScreen, hs.layout.right50, nil, nil}
}
local syncmasterLayout = {
    {"Google Chrome", nil, monitorScreen1, hs.layout.left50, nil, nil},
    {"Safari", nil, monitorScreen1, hs.layout.left50, nil, nil},
    {"Atom", nil, monitorScreen1, hs.layout.left50, nil, nil},
    {"iTerm2", nil, monitorScreen1, hs.layout.right50, nil, nil},
    {"REAPER", nil, monitorScreen1, hs.layout.maximized, nil, nil},
    {"Slack", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Finder", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Spotify", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"X-AIR-Edit", nil, laptopScreen, hs.layout.maximized, nil, nil}
}
local dellLayout = {
    {"Safari", nil, monitorScreen2, hs.layout.left50, nil, nil},
    {"Evernote", nil, monitorScreen2, hs.layout.left50, nil, nil},
    {"Atom", nil, monitorScreen2, hs.layout.left50, nil, nil},
    {"iTerm2", nil, monitorScreen2, hs.layout.maximized, nil, nil},
    {"Close.io", nil, monitorScreen2, hs.layout.maximized, nil, nil},
    {"Keynote", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Finder", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"TextEdit", nil, laptopScreen, hs.layout.right30, nil, nil},
    {"Slack", nil, laptopScreen, hs.layout.maximized, nil, nil},
    {"Google Chrome", nil, laptopScreen, hs.layout.maximized, nil, nil}
}
function applyMonitorLayout ()
  if hs.screen.findByName(monitorScreen1) then
      hs.layout.apply(syncmasterLayout)
  elseif hs.screen.findByName(monitorScreen2) then
      hs.layout.apply(dellLayout)
  else
      hs.layout.apply(laptopLayout)
  end
end
-- HOTKEY: re-apply display arrangement
hs.hotkey.bind(mash, 'M', applyMonitorLayout)
