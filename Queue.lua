require("Class")
require("Praktikum_1/queue/fifo")
require("Praktikum_1/queue/lifo")
require("Praktikum_1/queue/prio")


function newQueue( principle )
  if ( principle ~= "fifo" and principle ~= "lifo" and principle ~= "prio" ) then return nil end
  
  local object = {}
  object.elements = {}
    
  -- Selected FIFO-Queue
  if principle == "fifo" then
    return FIFO:new()
    
  -- Selected LIFO-Queue  
  elseif principle == "lifo" then
    return LIFO:new()
    
  -- Selected PRIO-Queue  
  elseif principle == "prio" then
    return PRIO:new()
    
  end
  
end