require("Class")

FIFO = {}

function FIFO:hasNode( item ) 
  for _, e in pairs(self.elements) do
    if e.name == item then return true end
  end
  return false
end


local FIFO_mt = Class(FIFO)

function FIFO:new()
  local elements = {}
    
  local function push(self, element )
    table.insert(elements, element)
  end
    
  local function pop(self)
    return table.remove(elements,1)
  end
    
  return setmetatable( {elements = elements, push = push, pop = pop }, FIFO_mt )
end