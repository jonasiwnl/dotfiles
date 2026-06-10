local clicking = false
local clickTimer = nil

local function startClicking()
  clicking = true
  clickTimer = hs.timer.doEvery(0.001, function()  -- 100 clicks/sec
    local pos = hs.mouse.absolutePosition()
    hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, pos):post()
    hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, pos):post()
  end)
end

local function stopClicking()
  clicking = false
  if clickTimer then
    clickTimer:stop()
    clickTimer = nil
  end
end

hs.hotkey.bind({}, "9", startClicking)
hs.hotkey.bind({}, "0", stopClicking)
