usun(_, []) ->
    {};
usun(E, [H|T]) when E==H ->
% usun(E, [E|T]) -> to to samo
  usun(E, T);
usun(E, [H|T]) when is_list(H) -> 
  [usun(E, H)] | usun(E, T)]; 
usun(E, [H|T]) ->
  [H | usun(E, T)];

removeDup([]) ->
  []
removeDup([H|T]) ->
  [H | removeDup(usun(H, T))]

qs([]) ->
  [];
qs([H|T]) ->
  qs([X || X<-T, X < H]) ++ [H] ++ qs([X || X<- T, X >= H])

map(_, []) ->
  [];
map(F, [H|T]) ->
  [F(H) | map(F, T)]
