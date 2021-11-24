{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

-- jest ważna kolejność warunków
ostatni1 [x] = x
ostatni1 (_ : xs) = ostatni1 xs

-- kolejność warunków nie jest ważna
ostatni2 (_ : y : ys) = ostatni2 (y : ys)
ostatni2 [x] = x

-- co z listą pustą?
ostatni [] = error "Lista pusta"

-- error:: [Char] -> a
-- ta funkcja normalnie nie ma prawa bytu, bo skąd wziąć `a`, ale kompilator traktuje ją jako pasującą wszędzie

-- połączenie [[1, 2], [3, 4], [5]] w [1, 2, 3, 4, 5]
join :: [[x]] -> [x]
-- join [x, y] = x ++ y
-- join (x : xs) = x ++ join xs
join [] = []
join (x : xs) = x ++ join xs

-- wszystkie trójki pitagorejskie, elementy < n
trójki :: Integer -> [(Integer, Integer, Integer)]
trójki n = [(x, y, z) | x <- [1 .. n], y <- [x + 1 .. n], z <- [y + 1 .. n], x * x + y * y == z * z]

-- lista silni
lsilnia 1 = [1]
lsilnia n = (n * y) : y : ys where (y : ys) = lsilnia (n -1)

-- ścieżka do elementu w drzewie
data Tree a = Empty | Node a (Tree a) (Tree a)

findPath :: Eq a => a -> Tree a -> [a]
findPath _ Empty = []
findPath n (Node x l r) =  if n == x 
  then [x] 
  else let lw = findPath n l
    let pw = findPath n r
        

-- t=Node 10 (Node 5 (Node 4 Empty Empty) (Node 6 Empty Empty)) (Node 20 Empty Empty)

