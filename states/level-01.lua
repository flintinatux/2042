local Base   = require('states.base')
local Player = require('entities.player')

local function Level01()
  local state = Base()

  function state:init()
    self.world:add(
      Player(225, 725)
    )
  end

  return state
end

return Level01
