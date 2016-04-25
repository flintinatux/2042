local tiny = require('lib.tiny')

local function Controls()
  local system = tiny.processingSystem()

  system.filter = tiny.requireAll('controls', 'motion')

  function system:process(e, dt)
    local c, m = e.controls, e.motion

    if c.quit then love.event.push('quit') end

    if c.left then
      m.ax = -m.amax
    elseif c.right then
      m.ax = m.amax
    else
      m.ax = 0
    end
  end

  return system
end

return Controls
