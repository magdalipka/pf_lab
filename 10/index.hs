-- http://users.umiacs.umd.edu/~hal/docs/daume02yaht.pdf

import Data.Char (isAlpha, toLower)

lowerString1 s = map toLower s

lowerString2 = map toLower

-- f s = g (h s)
-- f = g.h
lcaseLetters1 s = map toLower (filter isAlpha s)

lcaseLetters2 s = (map toLower . filter isAlpha) s

lcaseLetters3 = map toLower . filter isAlpha

func1 x l = map (\y -> y * x) l

func1a x = map (\y -> y * x)

func1b x = map (* x)

func1c x = map ((*) x)

func1d = map . (*)

func2 f g l = filter f (map g l)

func2a f g l = (filter f . map g) l

func2b f g = filter f . map g

func2c f g = (.) (filter f) (map g)

func2d f g = ((.) (filter f) . map) g

func2e f = (.) (filter f) . map

func2f f = (.) ((.) (filter f)) map

func2g f = flip (.) map ((.) (filter f))

func2h f = (flip (.) map) ((.) (filter f))

func2i f = (flip (.) map . (.) . filter) f

func2j = flip (.) map . (.) . filter

func2z = (. map) . (.) . filter

map2 f = foldr (\ a b -> f a : b) []
map2a f = foldr (\a b -> f a : b) []
map2b f = foldr (\a b -> (:) (f a) b) []
map2c f =  foldr (\a -> (:) (f a)) []
map2d f = foldr (\a -> ((:) . f) a) []
map2e f =  foldr ((:) . f) []

(++) [] ys = ys
(++) (x:xs) ys = x : (xs ++ ys)

-- =>
(++) [] = id
(++) (x:xs) ys = x : ((++) xs ys)
(++) (x:xs) ys = (x:) ((++) xs ys)
(++) (x:xs) ys = ((x:) . (++) xs) ys
(++) (x:xs) = (x:) . (++) xs

-- albo z foldem
(++) = foldr (\ a b -> (a:) .b ) id
==> (++) = foldr (\a b -> (a:) . b) id
==> (++) = foldr (\a b -> (.) (a:) b) id
==> (++) = foldr (\a -> (.) (a:)) id
==> (++) = foldr (\a -> (.) ((:) a)) id
==> (++) = foldr (\a -> ((.) . (:)) a) id
==> (++) = foldr ((.) . (:)) id

concat = foldr (++) []
