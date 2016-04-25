local systems = require('systems.index')
local tiny    = require('lib.tiny')

local function drawFilter   (_, s) return     s.draw end
local function updateFilter (_, s) return not s.draw end

local function Base()
  local state = {}

  state.world = tiny.world()
  for i = 1, #systems do state.world:add(systems[i]()) end

  function state:draw()
    self.world:update(love.timer.getDelta(), drawFilter)
  end

  function state:init()
    -- instantiate entities
  end

  function state:update(dt)
    self.world:update(dt, updateFilter)
  end

  return state
end

return Base
