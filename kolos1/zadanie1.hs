-- funkcja sprawdzająca czy element występuje w liście
contains :: Int -> [Int] -> Bool
contains n [] = False
contains n (x : xs) = if n == x then True else contains n xs

-- funkcja licząca ilość list w których występuje element
count :: [[Int]] -> Int -> Int
count [] n = 0
count (x : xs) n = if contains n x then p + 1 else p where p = count xs n

-- dla liczb <= n wywołuję funkcję liczącą w ilu listach wystąpiły
wIluListach :: Int -> [[Int]] -> [Int]
wIluListach 0 xs = [0]
wIluListach n xs = map (count xs) [1 .. n]
