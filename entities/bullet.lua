return function(x, y)
  return {
    ephemeral = true,
    motion    = { vx = 0, vy = -800, ax = 0, ay = 0 },
    position  = { x = x, y = y },
    size      = { h = 26, w = 10 },
    sprite    = 'bullet'
  }
end
