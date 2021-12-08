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

func3 f l = l ++ map f l

func3a f l = (++) l (map f l)

-- func3a f l =