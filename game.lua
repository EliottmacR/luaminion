require("txt_display")
require("luaminion")

t = 0 -- time since launch

function init_game()
  txt_displayer_init()
  luaminion_init()
end

function update_game(dt)
  t = t + dt
  
  if love.mouse.isDown(1) then -- right
    if not clicked then luaminion_next() clicked = true end
  else
    clicked = false
  end 
    
end

function draw_game()
  if txt_display_on then
    txt_display() return  end
end