-- will serve as the model
-- will work step by step
-- to advance, call "next_step()"

next_step = nil
input_step_needed = false

-- inputs have to be higly adaptable
input = {
  typ = 0,    -- will select game subpart
  choice = 0  -- and this the choice
}


players = {

  { name = "P1", hand = {}, deck = {}, trash = {} },
  { name = "P2", hand = {}, deck = {}, trash = {} },
  { name = "P3", hand = {}, deck = {}, trash = {} }

}

game = {

  cards = {}, -- stores { card_id : count, ...}
  table = {},  -- stores played card for players as such : {player_id : {card_id, ...} }
  template = {
    -- money
    {id = "copper", count = 60},
    {id = "silver", count = 60},
    {id = "gold",   count = 60},
    
    -- territories
    {id = "domain",   count = 60},
    {id = "dukedom",  count = 60},
    {id = "province", count = 60},
    
    -- cards
    {id = 1, count = 3},
    {id = 2, count = 3},
    {id = 3, count = 3},
    {id = 4, count = 3},
    {id = 5, count = 3}
  }
}




function luaminion_init()
  
  init_cards()
  
  next_step = give_players_cards

  luaminion_next()
  
end

function init_cards()

  for i, t in pairs(game.template) do
    game.cards[t.id] = t.count
  end  

end
  
function luaminion_next()
  if not next_step then return end 
  
  next_step()
end


function give_players_cards()

  distribute_cards()
  
  for i, p in pairs(players) do 
    draw_card(i, 5)
  end

  write("gave players card !")

  str = ""
  for _, p in pairs(players) do 
  
    for j, c in pairs(p.hand) do 
      str = str + "[ " .. c .. " ] "
    end
    
    print(str)
    
  end
  
  next_step = nil

end

function distribute_cards()

  for i, p in pairs (players) do
    
    -- give players copper
    for i = 1, 7 do
      if game.cards["copper"] > 0 then
        write("gave player " .. p.name.." a card cooper !")
        p.deck["cooper"] = (p.deck["cooper"] or 0) + 1 
        game.cards["copper"] = game.cards["copper"] - 1
      end
    end
    
    -- give players domain
    for i = 1, 3 do
      if game.cards["domain"] > 0 then
        write("gave player " .. p.name.." a card domain !")
        p.deck["domain"] = (p.deck["domain"] or 0) + 1 
        game.cards["domain"] = game.cards["domain"] - 1
      end
    end
    
  end

end

function draw_card( ind_p, numb_cards, id_card)
  if not ind_p or not numb_cards or not players[ind_p] then return end
  
  if not id_card then
  
    for i = 1, numb_cards do 
    
      local c = get_rnd_v_from(deck)
      
      table.insert(players[ind_p].hand, players[ind_p].deck[#players[ind_p].deck]) 
      players[ind_p].deck[#players[ind_p].deck] = nil
    end
    
  else
  
    found_indexes = {}
    
    for i, v in pairs(deck) do
      if v == id_card then 
        table.insert(found_indexes, i)
        if #found_indexes == numb_cards then
          break
        end
      end
    end
    
    for i, v in pairs(found_indexes) do
      table.insert(players[ind_p].hand,players[ind_p].deck[v]) 
      players[ind_p].deck[v] = nil    
    end
    
    write( #found_indexes .. " card(s) were found")

  end
end

function get_rnd_v_from(tab)

  for i,v in pairs(tab) return {"index" = i , "value" = v} end
  
end










--------------------------------------------------------
function say_hello()
  write("hello ! ")
  
  next_step = say_bye
end

function say_bye()
  write("bye ! ")
  
  next_step = say_hello

end

