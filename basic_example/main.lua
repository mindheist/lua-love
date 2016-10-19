--[[
Tutorial Link : http://www.headchant.com/2010/11/27/love2d-tutorial-part-1-invaders-must-die/

How to Run this Code or Making the .LOVE file

1. Go INTO your current project folder.
2. Select all the files and subfolders add them to a .zip file, for example to tut0.zip
3. Rename the tut0.zip file to tut0.love.
4. If you double click the resulting file it should be executed

 --]]

 --[[

 When beginning to write games using LÖVE, the most important parts of the API are the callbacks:
   love.load to do one-time setup of your game,
   love.update which is used to manage your game's state frame-to-frame,
   love.draw which is used to render the game state onto the screen.
 --]]

----------------------------------------------------------------------

function love.load()
-- Define the hero
hero = {}     -- tables in Lua : https://www.lua.org/pil/2.5.html
hero.x = 300  -- X and Y co-ordinates at which the hero would initially spawn. Play around with these co-ordinates to see it spawn at different locations.
hero.y = 400
hero.speed = 100

-- Define the enemies , use a nested table here
enemies = {}
  for i=0,7 do
    enemy = {}
    enemy.width = 40
    enemy.height = 20
    enemy.x = i * (enemy.width + 60 ) + 100
    enemy.y = enemy.height + 100
    table.insert(enemies,enemy)
  end
end
----------------------------------------------------------------------

function love.update(dt)
  -- https://love2d.org/wiki/love.keyboard.isDown
  if love.keyboard.isDown("left") then
    hero.x = hero.x - hero.speed*dt
  elseif love.keyboard.isDown("right") then
    hero.x = hero.x + hero.speed*dt
  end
end

----------------------------------------------------------------------

function love.draw()
  -- https://love2d.org/wiki/love.graphics.rectangle : draws a rectangle
  -- https://love2d.org/wiki/love.graphics.setColor  : sets color
  love.graphics.setColor(255,0,0,255)
  love.graphics.rectangle("fill",0,465,800,150)

  love.graphics.setColor(255,255,0,255)
  love.graphics.rectangle("fill",hero.x,hero.y,30,15)

  love.graphics.setColor(0,255,255,255)
  for i,v in ipairs(enemies) do
    love.graphics.rectangle("fill",v.x,v.y,v.width,v.height)
  end

end
----------------------------------------------------------------------

-- There is a follow up tutorial to this at http://www.headchant.com/2010/12/31/love2d-tutorial-part-2-pew-pew/
-- Unfortunately its not the most well written 
