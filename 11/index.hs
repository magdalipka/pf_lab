odwr 0.0 = Nothing
odwr x = Just (1 / x)

Just 3 >>= odwr >>= dziel 5.5 -- -> Just 16.5
Just 0 >>= odwr >>= dziel 5.5 -- -> Nothing

data Nmzk a = Nj a | Nblad String deriving (Show)

(>>>) :: Nmzk a -> (a -> Nmzk b) -> Nmzk b
Nj x >>> f = f x -- Nasze just
Nblad k >>> _ = Nblad k

dziel :: Float -> Float -> Nmzk Float
dziel _ 0.0 = Nblad "dzielenie przez 0"
dziel x y = Nj (x / y)

odwr :: Float -> Nmzk Float
odwr 0.0 = Nblad "Odwracanie zera"
odwr x = Nj (1 / x)

Nj 2 >>> odwr >>> (\x -> Nj (x -1)) >>> dziel 5.5
