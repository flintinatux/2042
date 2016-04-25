return function(x, y)
  return {
    controls = {},
    gun      = { rate = 0.15, time = 0 },
    inputs   = { fire = 'w', left = 'a', right = 'd', quit = 'escape' },
    limited  = true,
    motion   = { vx = 0, vy = 0, ax = 0, ay = 0, vmax = 200, amax = 1000 },
    position = { x = x, y = y },
    size     = { h = 86, w = 110 },
    sprite   = 'plane'
  }
end
