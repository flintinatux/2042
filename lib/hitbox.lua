return function(e)
  local p, s = e.position, e.size

  local t = p.y - s.h / 2
  local b = p.y + s.h / 2
  local l = p.x - s.w / 2
  local r = p.x + s.w / 2

  return t, b, l, r
end
