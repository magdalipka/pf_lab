fib (n, a, b, v) = if i == n then a else fib (n, b, a + b . i + 1)
-- złożoność 2^2^k - k to ilość bitów w n

-- to samo:

fib: Integer -> Integer 
fib n =
iter(n, g)(0, 1)
where g(a, b) = (b, a+b)

g: R^2 -> R^2
[
  0 1
  1 1
] * [
  a
  b
] = [
  b
  a+b
]

g(n)[
  0
  1
] = G^n([
  0
  1
])

-- złożoność k (ale k operacji mnożenia macierzy)

------------------------------------------------------------
-- c:

int pot(int n, int x) {
  int t = x;
  int w = 1;
  while(n>0) {
    if(n%2 == 1) {
      w*=t;
    }
    t *= t;
    n/= 2; --albo shift, chodzi o cyt. "urwanie" ostatniego bitu
  }
  return w;
}

-- złożoność k obiegów pętli i wykonanie w śroku więc k^2

-- pseudo haskell:

pot(0, x) = 1
pot(n, x) = if even(n) then pot(n/2, x^2)
                       else x * pot(n/2, x^2)

-- haskell:
pot(0, x) = 1
pot(n, x) = if even n then p else x*p
  where p=pot(n `div` 2, x*x)

-- generyczne:
pot(0, x) = id
pot(n, x) = if even n then p else x.p
  where p=pot(n `div` 2, x.x)
