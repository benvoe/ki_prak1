require("Praktikum_1/Queue")
require("Praktikum_1/Romania-Graph")
require("Praktikum_1/search/bfs")
require("Praktikum_1/search/dfs")
require("Praktikum_1/search/ucs")
require("Praktikum_1/search/a_stern")
require("Praktikum_1/Node")

--romania:Print();

--romania:PrintNeighbours("Pi")



--[[ PROBMLEM 1 : Routenplanung in Rumänien

print("Breitensuche:")
search_bfs( romania, "Bu", "Ti" )

print("\nTiefensuche:")
search_dfs( romania, "Bu", "Ti" )

print("\nUniforme Kostensuche:")
search_ucs( romania, "Bu", "Ti" )

--]]


--[[ PROBLEM 2 : Pfadplanung für mobile Roboter

 matrix = {--1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 1
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 2
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 3
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 4
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 5
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 6
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 7
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 8
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 9
            {1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 10
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 11
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 12
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 13
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 14
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 15
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 16
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 17
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 18
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 19
            {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1} -- 20
  }
  
   matrix2 = {--1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 20
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 19
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 18
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 17
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 16
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 15
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 14
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 13
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 12
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 11
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1}, -- 10
             {1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 9
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 8
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 7
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 6
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 5
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 4
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 3
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, -- 2
             {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}  -- 1
  }
  

my_graph = matrix_to_graph( matrix )

--my_graph:PrintNeighbours("3-9")


print("Breath First Search")
search_bfs( my_graph, '1-1', '20-20' )

print("\nDebth First Search")
search_dfs( my_graph, '1-1', '20-20' )

print("\nUniforme Kostensuche")
search_ucs( my_graph, '1-1', '20-20' )

print("\nA*-Suche")
search_a_stern( my_graph, '1-1', '20-20' )

--]]





--[[ TESTCODE for FIFO, LIFO and PRIO

romania:Print();

t1, t2, t3 = unpack(romania:GetNeighbours("Ar"))

print(unpack(t1))
print(unpack(t2))
print(unpack(t3))


node = Node:new( "Aachen" )



node:Print()

node:addCost( 4 )
node:setPath( "ich->bin->in" )

node:Print()

node:addCost( 120 )

node:Print()

print(node:getPath())

--]]




--[[ TESTCODE for FIFO, LIFO and PRIO

print("FIFO-Queue:")

local fifo1 = newQueue("fifo")

fifo1:push("Hamburger")
fifo1:push("Cheseburger")
fifo1:push("Pommes")
fifo1:push("Salat")
fifo1:push("Gurke")
fifo1:push("Wrap")

print(fifo1:pop())
print(fifo1:pop())
fifo1:push(3)
print(fifo1:pop())
fifo1:push(2)
print(fifo1:pop())
print(fifo1:pop())
print(fifo1:pop())
print(fifo1:pop())
print(fifo1:pop())


print()
print("LIFO-Queue:")

local lifo1 = newQueue("lifo")

lifo1:push(1)
lifo1:push(2)
lifo1:push(3)
lifo1:push(4)
lifo1:push(3)
lifo1:push(6)

print(lifo1:pop())
print(lifo1:pop())
lifo1:push(3)
print(lifo1:pop())
lifo1:push(2)
print(lifo1:pop())
print(lifo1:pop())
print(lifo1:pop())
print(lifo1:pop())
print(lifo1:pop())


print()
print("PRIO-Queue:")

local prioQ = newQueue("prio")

prioQ:push(1, 6)
prioQ:push(2, 5)
prioQ:push(12, 1)
prioQ:push(13, 2)
prioQ:push(3, 4)
prioQ:push(4, 6)
prioQ:push(10, 2)
prioQ:push(11, 1)
prioQ:push(3, 5)
prioQ:push(6, 4)

print(prioQ:pop())
print(prioQ:pop())
print(prioQ:pop())
print(prioQ:pop())
print(prioQ:pop())
print(prioQ:pop())
print(prioQ:pop())
print(prioQ:pop())
print(prioQ:pop())
print(prioQ:pop())

--]]