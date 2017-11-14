require("Praktikum_1/Node")
require("Praktikum_1/queue/prio")
require("Praktikum_1/queue/fifo")

function search_a_stern( graph, start, fin )
    state = Node:new( start )
    
    if start == fin then return state:Print() end
    
    counter = 0
    frontier = PRIO:new()
    frontier:push( state, state:getCost() )
    explored = FIFO:new()
    explored:push( state )
    foundPath = false
    repeat
        if #frontier.elements == 0 then return false end
        
        node = frontier:pop()
        counter = counter + 1
        --node:Print()
        --print(node:getCostWithH() .. 'vs.' .. node:getCost())
        for i, child in pairs(graph:GetNeighbours(node.name)) do
          child_node = Node:new( child[1], node:getPath(), child[2] + node:getCost() )
          if not explored:hasNode( child_node.name ) and not frontier:hasNode( child_node.name ) then
            explored:push( child_node )
            if child_node.name == fin then 
              --child_node:Print()
              foundPath = true
              break;
            end
            frontier:push( child_node, child_node:getCostWithH() )
          end
        end
    until foundPath
    print("Found Node with " .. counter .. " expanded Nodes:")
    child_node:Print()
end


function matrix_to_graph ( matrix )
  directed = false
  vertices = {}
  edges = {}
  
  for i, x in ipairs(matrix) do
    c = i
    for j, y in ipairs(x) do
      --print(i .. "-" .. j .. ", " .. y)
      if y == 1 then
        table.insert(vertices, i .. "-" .. j)
        --print(matrix[i][j])
        if i < #x and matrix[i+1][j] == 1 then 
          table.insert(edges, {i .. '-' .. j, i+1 .. '-' .. j, 1})
        end
        if j < #x and matrix[i][j+1] == 1 then
          table.insert(edges, {i .. '-' .. j, i .. '-' .. j+1, 1})        
        end
      end
    end
  end

   return Graph:new( vertices, edges, directed );
end

