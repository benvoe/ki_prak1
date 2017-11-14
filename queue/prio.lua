require("Class")

PRIO = {}

function PRIO:hasNode( item ) 
  for _, e in pairs(self.elements) do
    if e[2].name == item then return true end
  end
  return false
end

local PRIO_mt = Class(PRIO)

function PRIO:new()
  local elements = {}
    
  local function push(self, value, priority )
    table.insert( elements, { priority, value } )
  end
    
  local function pop(self)
    sortList()
    return table.remove(elements,#elements)[2]
  end
  
  function sortList(self)
      for i = 1, #elements do
        local remember = i
        for j = i+1, #elements do
          --print(elements[remember][1] .. " < " .. elements[j][1])
          if elements[remember][1] < elements[j][1] then
            remember = j
          end
        end
        local rememberElement = elements[i]
        elements[i] = elements[remember]
        elements[remember] = rememberElement
      end
    end
    
  return setmetatable( { elements = elements, push = push, pop = pop }, PRIO_mt )
end

function newElement ( value, priority )
  local object = {}
  object.val = value
  object.prio = priority
        
  return object
end
