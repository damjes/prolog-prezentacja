/* Szukanie pierwiastkow wielomianu
Umie znajdowac pierwiastki rzeczywiste dla wielomianu stopnia < 3

copyleft by matma6
*/

rozwiaz([0, H|T], X) :-
	!, rozwiaz([H|T], X).
rozwiaz([0], r) :- !.
rozwiaz([A, B], [X]) :- X is -B / A.
rozwiaz([A, B, C], X) :-
	Delta is B*B - 4*A*C,
	delta(Delta, [A, B], X).
rozwiaz([_, _, _, _|_], _) :- write('Nie umiem'), !, fail.

delta(D, _, _) :-
	D < 0,
	write('delta ujemna'), !, fail.
delta(D, [A, B], [X]) :-
	D =:= 0,
	X is -B / (2*A).
delta(D, [A, B], [X1, X2]) :-
	Sqrt is sqrt(D),
	X1 is (-B - Sqrt) / (2*A),
	X2 is (-B + Sqrt) / (2*A).
