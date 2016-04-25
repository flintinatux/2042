local hitbox = require('lib.hitbox')
local tiny   = require('lib.tiny')

local function Ephemeral()
  local system = tiny.processingSystem()

  system.filter = tiny.requireAll('ephemeral')

  function system:process(e, dt)
    local t, b, l, r = hitbox(e)
    local w, h = love.graphics.getDimensions()

    if t > h or b < 0 or l > w or r < 0 then
      system.world:remove(e)
    end
  end

  return system
end

return Ephemeral
