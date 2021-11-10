-- silnia
s :: Integer -> Integer
s 0 = 1
s n = n * s (n -1)

f :: [Int] -> Int
f [] = 13
f (x : xs) = 2 * x + f xs
