text_displayer = { -- command lines like display 
    lines = {}, -- list of lines
    interlines = 7,
    font_size = 16,
    top_displayed_ind = 1
}

txt_display_on = false -- set in init  
std_height = 0 -- set in init

function txt_displayer_init()
    std_height = str_height("!")
    setNewFont(text_displayer.font_size)
    love.graphics.setNewFont(text_displayer.font_size)
    txt_display_on = true
    --fill_txt_displayer()
end

function write(string)
    if not string then return end
    table.insert(text_displayer.lines, string)

    print("#text_displayer. lines = "..  #text_displayer. lines)
    print(" text_displayer. top_displayed_ind = " ..  text_displayer. top_displayed_ind)
    print(" std_height+ text_displayer. interlines = " ..  std_height+ text_displayer. interlines)
    print(" GH " ..  GH)

    if (#text_displayer. lines - text_displayer. top_displayed_ind) * (std_height+ text_displayer. interlines) > GH then 
        text_displayer. top_displayed_ind = text_displayer. top_displayed_ind + 1 
    end
end

function txt_display()
    for i = text_displayer.top_displayed_ind, #text_displayer.lines  do
        love.graphics.print( text_displayer.lines[ i ], 0,  (i - text_displayer.top_displayed_ind)  * ( std_height + text_displayer.interlines ) )
    end
end


function fill_txt_displayer()

    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
    write("text_displayer init done !")
end
