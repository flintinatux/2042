return function(x, y)
  return {
    controls = { left = 'a', right = 'd' },
    motion   = { vx = 0, vy = 0, ax = 0, ay = 0, vmax = 200, amax = 1000 },
    player   = true,
    position = { x = x, y = y },
    sprite   = 'plane'
  }
end
