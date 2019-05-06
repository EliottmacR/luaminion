require("game")  -- where all the fun happens
require("loving") -- love2d adaptation

GW = 1000
GH = 600
border = 60
zoom = 1

function love.load()
  love.math.setRandomSeed(os.time())
  init_game()
end

function love.draw()
  -- love.graphics.push()  
  
  -- WINDOW STUFF --
    local width  = love.graphics.getWidth()
    local height = love.graphics.getHeight()
        
    -- sets zoom so game sticks to either height or width
    zoom = height/(GH+  border)
    if (width < (GW + border) * zoom) then zoom = width / (GW + border) end
      
    -- centers screen
    love.graphics.translate(0.5 * (width - (GW + border/2 ) * zoom),  0.5 * (height - (GH + border/2) * zoom))
    love.graphics.scale(zoom)  
    
    -- after this point, everything is in 800 x 600
    
    color( 1, 1, 1 )
  --
  
  draw_game()
  
  -- love.graphics.pop()  
end

function love.update(dt)
  update_game(dt)
end

function get_mouse_pos()

  local truex , truey = love.mouse.getPosition()
  
  local width  = love.graphics.getWidth()
  local height = love.graphics.getHeight()
  local x = (truex - (width -  (GW  + border/2) * zoom) / 2) / zoom
  local y = (truey - (height - (GH + border/2) * zoom) / 2) / zoom
  
  return x, y

end