/* Pomoc przy tzw. obrazkach logicznych

copyleft by matma6
*/

%linia(Pocz, Skladowe, DlWyn, Wynik).

linia(_, [], 0, []).
linia(' ', S, D, [' '|W]) :-
	D > 0,
	D1 is D-1,
	linia(_, S, D1, W).
linia('X', [0|S], D, [' '|W]) :-
	D > 0,
	D1 is D-1,
	linia(_, S, D1, W).
linia('X', [0], 0, []).
linia('X', [N|S], D, ['X'|W]) :-
	N > 0,
	N1 is N-1,
	D1 is D-1,
	linia('X', [N1|S], D1, W).

linia(S, D, W) :-
	linia(_, S, D, LW),
	atom_chars(W, LW).






