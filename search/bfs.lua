require("Praktikum_1/Node")
require("Praktikum_1/queue/fifo")

function search_bfs( graph, start, fin )
    state = Node:new( start )
    
    if start == fin then return state:Print() end
    
    counter = 0
    frontier = FIFO:new()
    frontier:push( state )
    explored = FIFO:new()
    explored:push( state )
    foundPath = false
    repeat
        if #frontier.elements == 0 then return false end
        
        node = frontier:pop()
        counter = counter + 1
        --node:Print()
        for i, child in pairs(graph:GetNeighbours(node.name)) do
          child_node = Node:new( child[1], node:getPath(), child[2] + node:getCost() )
          if not explored:hasNode( child_node.name ) and not frontier:hasNode( child_node.name ) then
            explored:push( child_node )
            if child_node.name == fin then 
              --child_node:Print()
              foundPath = true
              break;
            end
            frontier:push( child_node )
          end
        end
    until foundPath
    print("Found Node with " .. counter .. " expanded Nodes:")
    child_node:Print()
end
