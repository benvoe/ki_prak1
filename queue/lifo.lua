require("Class")

LIFO = {}

function LIFO:hasNode( item ) 
  for _, e in pairs(self.elements) do
    if e.name == item then return true end
  end
  return false
end

local LIFO_mt = Class(LIFO)

function LIFO:new()
  local elements = {}
    
  local function push(self, element )
    table.insert(elements, element)
  end
    
  local function pop(self)
      return table.remove(elements, #elements)
  end
    
  return setmetatable( {elements = elements, push = push, pop = pop }, LIFO_mt )
end