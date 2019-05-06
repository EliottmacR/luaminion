text_displayer = { -- command lines like display 
    lines = {}, -- list of lines
    top_displayed_ind = 0
}

function init()
    write("text_displayer init done !")
end

function write(string)
    if not string then return end
    table.insert(text_displayer.lines, string)
end

function txt_display()
    love.graphics.setBackgroundColor( 0, 0, 0)
    setNewFont(32)
    for i = 1, text_displayer do
        lprint(text_displayer.lines[i])
    end
end