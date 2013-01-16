/* Obliczanie iloczynu na diagonali i diagonali transpozycji macierzy
Wersja funkcyjna

copyleft by matma6
*/

odwr([], A, A).
odwr([H|T], A, W) :-
	odwr(T, [H|A], W).

odwr(L, W) :-
	odwr(L, [], W).

cdr([_|T], T).

przerzuc(L, W) :-
	maplist(odwr, L, W).

wynik([], A, A).
wynik([[E|_]|Inne], A, W) :-
	maplist(cdr, Inne, Dalej),
	NA is E * A,
	wynik(Dalej, NA, W).

wynik(L, W) :-
	wynik(L, 1, W).

funkcja(L, DG, DD) :-
	wynik(L, DG),
	przerzuc(L, NL),
	wynik(NL, DD).
