
type DirectedGraph = ([Int], Int -> Int -> Bool)

-- zwraca listę wierzchołków grafu
vertices:: DirectedGraph -> [Int]
vertices g = fst g

-- spłaszczenie zagnieżdzonych list
flatList:: [[Int]] -> [Int]
flatList [] = []
flatList (x:xs) = x ++ flatList xs

-- zwraca wszystkich sąsiadów danego wierzchołka
neighbours:: DirectedGraph -> Int -> [Int]
neighbours g v = filter ((snd g) v ) [ x | x <- vertices g ]

-- dopóki są dostępne kroki do przejścia to wierzchołek zamieniam w listę jego sąsiadów
atDistance:: DirectedGraph -> Int -> Int -> [Int]
atDistance g 0 v = []
atDistance g 1 v = neighbours g v
atDistance g d v = flatList (map (atDistance g (d-1)) (neighbours g v))
