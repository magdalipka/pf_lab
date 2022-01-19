q :: Int -> [Int] -> [Int] -> [Int] -> [Int]
q p [] x y = quick x ++ [p] ++ quick y
q p (a : as) x y =
  if a < p
    then q p as (p : x) y
    else q p as x (p : y)

quick :: [Int] -> [Int]
quick [] = []
quick (x : xs) = q x xs [] []

sort :: [Int] -> [Int]
sort [] = []
sort (x : xs) = (sort [a | a <- xs, a < x]) ++ [x] ++ sort [a | a <- xs, a > x]
