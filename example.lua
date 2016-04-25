debug = true
plane = {
  img   = nil,
  speed = 150,
  x     = 200,
  y     = 700
}

bulletImg = nil
bullets   = {}
gun = {
  fire = true,
  rate = 0.2,
  time = 0.2
}

function love.load()
  bulletImg = love.graphics.newImage('assets/bullet.png')
  plane.img = love.graphics.newImage('assets/plane.png')
end

function love.update(dt)
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  min = 0
  max = love.graphics.getWidth() - plane.img:getWidth()

  if love.keyboard.isDown('left', 'a') and plane.x > min then
    plane.x = plane.x - plane.speed * dt
  elseif love.keyboard.isDown('right', 'd') and plane.x < max then
    plane.x = plane.x + plane.speed * dt
  end

  gun.time = gun.time - dt
  if gun.time < 0 then gun.fire = true end

  if love.keyboard.isDown('space') and gun.fire then
    bullet = {
      x = plane.x + plane.img:getWidth() / 2 - bulletImg:getWidth() / 2,
      y = plane.y
    }
    table.insert(bullets, bullet)
    gun.fire = false
    gun.time = gun.rate
  end

  for i, bullet in ipairs(bullets) do
    bullet.y = bullet.y - 250 * dt
    if bullet.y < 0 then table.remove(bullets, i) end
  end
end

function love.draw()
  love.graphics.draw(plane.img, plane.x, plane.y)

  for i, bullet in ipairs(bullets) do
    love.graphics.draw(bulletImg, bullet.x, bullet.y);
  end
end
