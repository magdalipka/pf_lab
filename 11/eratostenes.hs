sieve [] = []
sieve (x : xs) = x : sieve [y | y <- xs, y `mod` x /= 0]

-- sieve [2 ..]
-- sieve [2 .. 100]