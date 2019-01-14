% 2018 January Prolog.
mul(List1,List2,List3) :-
  length(List1, X),
  length(List2, Y),
  length(List3, Z),
  X*Y =:= Z.

% 2016 January Prolog.
noah([],[],[]).
noah(X|Xs], [Y|Ys], [X|[Y|Zs]]) :- noah(Xs, Ys, Zs).
