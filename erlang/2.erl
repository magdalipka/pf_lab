-module(z1).
-export([start/1, ping/1]).

start(N) ->
  Pn = spawn(z1, ping, [tba]),
  start(N-1, Pn, Pn).

start(0, Pp, Pn) ->
  Pn ! {go, Pp},
  Pn ! 1,
  done;

start(N, Pp, Pn) ->
  P = spawn(z1, ping, [Pp]),
  start(N-1, P, Pn).

ping(tba) ->
  receive {go, P} -> ping(P) end;

ping(P) -> 
  receive I -> io:format("~w~n", [I]), p ! I+1 end,
  if I < 100 -> ping(P); true -> done end.

