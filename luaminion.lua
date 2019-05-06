-- will serve as the model
-- will work step by step
-- to advance, call "next_step()"

next_step = nil

function luaminion_init()
  next_step = say_hello
end

function luaminion_next()
  next_step()
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

