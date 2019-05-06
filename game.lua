require("txt_display")

t = 0 -- time since launch

function init_game()
    txt_displayer_init()

end

function update_game(dt)
    t = t + dt
    write("current t = " .. t )
end

function draw_game()
    if txt_display_on then
        txt_display() return  end
    
end