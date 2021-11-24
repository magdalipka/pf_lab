para x = (x, x)

kw :: Num a => a -> a
kw = uncurry (*) . para -- złożenie pary z mnożeniem, ale para to jeden arg, a mnożenie chce dwóch, więc uncurry żeby 'rozpakować' mnożenie
-- curry z (a,b) -> c robi a -> b -> c
-- uncurry z a -> b -> c robi (a, b) -> c

pustalista :: [a] -> Bool
pustalista [] = True
pustalista (_ : _) = False

-- pustalista (x : xs) = False

-- dopasowanie do wzorca to podstawowe, wbudowane, istnieje dla każdego typu

-- x^n
pot1 :: Num a => Integer -> a -> a
pot1 0 _ = 1
pot1 n x = if even n then p else x * p where p = pot1 (n `div` 2) (x * x)

pot2 :: Num a => Integer -> (a -> a) -> (a -> a)
pot2 0 _ = id
pot2 n x = if even n then p else x . p where p = pot2 (n `div` 2) (x . x)

-- siedmiokrotna iteracja funkcji dodającej jedynkę
-- pot2 7 (+ 1) 100

-- fibonacci na macierzach:
-- fib n = fst ([0 1
--               1 1]^n * [ 0
--                          1 ])

type M = (Integer, Integer, Integer, Integer)

mnm :: M -> M -> M
mnm (a, b, c, d) (p, q, r, s) = (a * p + b * r, a * q + b * s, c * p + d * c, c * q + d * s)

mnk :: M -> Integer
mnk (a, b, c, d) = b

pot3 :: Integer -> M -> M
pot3 0 _ = (1, 0, 0, 1)
pot3 n x = if even n then p else x `mnm` p where p = pot3 (n `div` 2) (x `mnm` x)

fib :: Integer -> Integer
fib n = mnk (pot3 n (0, 1, 1, 1))
