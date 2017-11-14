require("Class")

Node = {}

  function Node:setPath( new_path )
    self.path = new_path
  end
  
  function Node:getPath()
    path = self.name .. "(" .. self.cost .. ")"
    if self.path ~= "" then 
      path = self.path .. "->" .. path 
    end
    return path
  end
  
  function Node:addCost( add_cost )
    self.cost = self.cost + add_cost
  end
  
  function Node:getCost()
    return self.cost
  end
  
  function Node:getCostWithH()
    position = Graph:split_string( self.name, '-')
    dx = 20 - position[1]
    dy = 20 - position[2]
    
    h = math.sqrt(dx*dx + dy*dy)
    return self.cost + h
  end
  
  function Node:Print()
    print( self.name .. " - " .. self:getPath() .. " - " .. self.cost )
  end

local Node_mt = Class(Node)

function Node:new( node_name, node_path, node_cost )
  
  local name = node_name
  local path = node_path or ""
  local cost = node_cost or 0
    
  return setmetatable( { name = name, path = path, cost = cost }, Node_mt )
end