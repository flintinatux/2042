local assets = require('assets.index')
local tiny   = require('lib.tiny')

local function Sprite()
  local system = tiny.processingSystem({ draw = true })

  system.filter = tiny.requireAll('position', 'sprite')

  function system:process(e, dt)
    local img  = assets[e.sprite]
    local pos  = e.position
    local w, h = img:getDimensions()
    love.graphics.draw(img, pos.x - w/2, pos.y - h/2)
  end

  return system
end

return Sprite
