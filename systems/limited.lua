local hitbox = require('lib.hitbox')
local tiny   = require('lib.tiny')

local buffer = 4

local function Limited()
  local system = tiny.processingSystem()

  system.filter = tiny.requireAll('limited')

  function system:process(e, dt)
    local t, b, l, r = hitbox(e)
    local w, h = love.graphics.getDimensions()
    local m = e.motion

    if t < 0 + buffer and (m.vy < 0 or m.ay < 0) or
       b > h + buffer and (m.vy > 0 or m.ay > 0) then m.vy, m.ay = 0, 0 end

    if l < 0 + buffer and (m.vx < 0 or m.ax < 0) or
       r > w + buffer and (m.vx > 0 or m.ax > 0) then m.vx, m.ax = 0, 0 end
  end

  return system
end

return Limited
