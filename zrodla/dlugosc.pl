%dlugosc listy z rekursja ogonowa

dl(L, W) :-
	dl(L, 0, W).

%      V--- tu jest akumulator
dl([], X, X).
dl([_|T], X, W) :-
	X1 is X + 1,
	dl(T, X1, W).
