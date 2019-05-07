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
  table = {},  -- stores played card for players as such : {player_id : {card_id : count, ...} }
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

--[[ 

the cards are gonna be sorted everywhere as such:
-----
{id_of_card : number_of_cards}
 =
{index      : value          }
-----

]]


function luaminion_init()
  init_game_from_template()
  next_step = init_players
  -- luaminion_next()
end
 
function luaminion_next()
  if not next_step then return end 
  next_step()
end

function init_game_from_template()
  for i, t in pairs(game.template) do
    game.cards[t.id] = t.count
  end  
end
 
function transfer_card(tab1, tab2, id_of_card)
  if not tab1 or not tab2 or not id_of_card or (not tab1[id_of_card] or tab1[id_of_card] < 1) then return false end
  
  tab1[id_of_card] =  tab1[id_of_card]       - 1
  tab2[id_of_card] = (tab2[id_of_card] or 0) + 1
  
  return true
end

function init_players()

  init_p_decks()
  init_p_hands()

  -- check every card in hand and writes content
  
  next_step = nil

end

function init_p_hands()
  for i, p in pairs(players) do draw_card(i, 5) end
  write_p_hands()
end

function init_p_decks()
  for i, p in pairs (players) do
    for i = 1, 7 do
      transfer_card(game.cards, p.deck, "copper")
    end
    for i = 1, 3 do
     transfer_card(game.cards, p.deck, "domain")
    end
  end
end

function draw_card( ind_p, numb_cards, id_card)
  if not ind_p or not numb_cards or not players[ind_p] then return end
  
  if not id_card then
  
    for i = 1, numb_cards do 
      local p = players[ind_p]
      local c = get_rnd_ind_from(p.deck)
      if not c then break end
      
      transfer_card(p.deck, p.hand, c.index) 
    end
    
  else  
    local i = 0
    while #players[ind_p].deck[id_card] > 1 and i < numb_cards and transfer_card(players[ind_p].deck, players[ind_p].hand, ind_p) do i = i + 1 end
    
  end
end

function get_rnd_ind_from(tab)
  
  local index = {}
  
  for i,v in pairs(tab) do 
    if v > 0 then 
      table.insert(index, i) 
    end 
  end
  
  if #index < 1 then return end 
  
  local i
  
  repeat 
    i = index[irnd(#index)] 
  until (tab[i] > 0) 
  
  return {index = i, value = tab[i] }
  
end

function write_p_hands(ind_p)

  if not ind_p or players[ind_p] then 
     -- print every player's hand
     
    for _, p in pairs(players) do 
    
      local str = p.name .. " has : "
      for i, v in pairs(p.hand) do 
        for j = 1, v do str = str .. "[ " .. i .. " ] " end        
      end
      write(str)      
    end
  else
     -- print one player's hand
  
    local p = players[ind_p]
    
    local str = p.name .. " has : "
    for i, v in pairs(p.hand) do 
      for j = 1, v do str = str .. "[ " .. i .. " ] " end   
    end
    write(str)
  end
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

