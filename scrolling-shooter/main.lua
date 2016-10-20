-- Link to the Tutorial : http://osmstudios.com/page/your-first-love2d-game-in-200-lines-part-2-of-3
-- Still need to understand all of the bullet tracking and timef logic.

canShoot = true
canShootTimerMax = 1.0 -- This is actually measured in seconds and actually indicates the time between consecutive fires.
canShootTimer = canShootTimerMax

bulletImg = nil
bullets = {}

player = { x = 200, y = 710, speed = 150, img = nil }

----------------------------------------------------------------------
-- Loading all necesary sprites
function love.load(arg)
  player.img = love.graphics.newImage('assets/plane.png')
  bulletImg = love.graphics.newImage('assets/bullet.png')
end

----------------------------------------------------------------------
-- Updating
function love.update(dt)
  -- I always start with an easy way to exit the game
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  if love.keyboard.isDown('left','a') then
    if player.x > 0 then -- binds us to the map
		    player.x = player.x - (player.speed*dt)
    end
	elseif love.keyboard.isDown('right','d') then
    if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
		    player.x = player.x + (player.speed*dt)
    end
	end

  -- Time out how far apart our shots can be.
  canShootTimer = canShootTimer - (1 * dt) -- this is the countdown logic line and also note
  -- that the multiplier in this line is 1, if you increase it to 2 or 4 , the timer resets faster

  if canShootTimer < 0 then
    canShoot = true
  end

  if love.keyboard.isDown(' ','rctrl','lctrl','ctrl') and canShoot then
    -- create some bullets
    newBullet = { x  = player.x , y = player.y , img = bulletImg}
    table.insert(bullets,newBullet)
    canShoot = false
    canShootTimer = canShootTimerMax
  end -- end of bullet

  for i,bullet in ipairs(bullets) do
    bullet.y = bullet.y - (250 * dt)

    if bullet.y < 0 then
      table.remove(bullets,i)
    end
  end -- end of for
end -- end of update function

----------------------------------------------------------------------

function love.draw()
  love.graphics.draw(player.img,player.x,player.y)

  for i, bullet in ipairs(bullets) do
    love.graphics.draw(bullet.img, bullet.x, bullet.y)
  end


end
