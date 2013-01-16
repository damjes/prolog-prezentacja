/* Predykaty anonimowe
Przyklad - chcemy policzyc wartosc funkcji 2x+3 dla listy argumentow:
?- maplist(fanon(Y is 2*X+3, [X, Y]), Argumenty, Wyniki).

copyleft by matma6
*/

panon(Po, Do, Xs) :-
	copy_term([Po|Do], [Ps, Xs]),
	call(Ps).
panon(Po, Do, Xs, Ys) :-
	copy_term([Po|Do], [Ps, Xs, Ys]),
	call(Ps).
panon(Po, Do, Xs, Ys, Zs) :-
	copy_term([Po|Do], [Ps, Xs, Ys, Zs]),
	call(Ps).
