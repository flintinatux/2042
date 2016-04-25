local Bullet = require('entities.bullet')
local tiny   = require('lib.tiny')

local function Gun()
  local system = tiny.processingSystem()

  system.filter = tiny.requireAll('controls', 'gun')

  function system:process(e, dt)
    if not e.controls.fire then return end

    local gun = e.gun
    gun.time = gun.time - dt
    if gun.time > 0 then return end

    local p = e.position
    system.world:add(Bullet(p.x, p.y - 40))
    gun.time = gun.rate
  end

  return system
end

return Gun
