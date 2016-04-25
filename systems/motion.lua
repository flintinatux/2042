local tiny = require('lib.tiny')

local function Motion()
  local system = tiny.processingSystem()

  system.filter = tiny.requireAll('motion', 'position')

  function system:process(e, dt)
    local m, p = e.motion, e.position
    local friction = 0

    if m.amax and m.vmax then friction = -(m.amax / m.vmax) end

    if m.ax or friction then m.vx = m.vx * (1 + friction * dt) + m.ax * dt end
    if m.ay or friction then m.vy = m.vy * (1 + friction * dt) + m.ay * dt end

    p.x = p.x + m.vx * dt
    p.y = p.y + m.vy * dt
  end

  return system
end

return Motion
