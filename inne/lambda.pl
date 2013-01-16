/* Rachunek lambda

copyleft by matma6
*/

eval(s(N, E), s(\(X->Y), I), V) :- %jesli podstawiam to
	atomic_concat(alphaRed, N, NX),
	N1 is N+1,
	alphaRed(Y->NY, X->NX),
	eval(s(N1, [v(NX,I)|E]), NY, V), !. %wzbogacam srodowisko o wartosc X i ewaluuje Y

eval(_, X, X) :-
	number(X), !. %wartoscia liczby jest liczba
eval(s(_, E), X, VX) :-
	member(v(X, VX), E), !. %wartoscia istniejacej zmiennej jest ta wartosc
eval(_, [], []). %wartoscia listy pustej jest lista pusta
eval(E, [H|T], [VH|VT]) :-
	eval(E, H, VH),
	eval(E, T, VT), !.
eval(E, T, VT) :-
	T =.. [O, A1, A2],
	member(O, [+, -, *, /]),
	eval(E, A1, VA1),
	eval(E, A2, VA2),
	number(VA1),
	number(VA2),
	IS =.. [O, VA1, VA2],
	VT is IS, !.
eval(E, T, VT) :-
	T =.. [O|A],
	funkcja(O), !, %jesli O jest jakas fajna funkcja
	eval(E, A, VA), %to policz argumenty
	NT =.. [O, NV| VA], %i podstaw pod wyrazenie
	call(NT),
	eval(E, NV, VT). %a wynik moze wymagac ewaluacji
eval(E, T, VT) :- %jesli t jest termem zlozonym
	T =.. [O|A],
	ground(O),
	eval(E, A, VA),
	VT =.. [O|VA], !. %to jego wartosc to term zlozony z tego samego ogeratora i wartosci skl
eval(_, X, X). %a jesli X to niewiadomoco, to samo jest swa wartoscia

eval(E, V) :-
	eval(s(0, []), E, V).

alphaRed(X->Y, X->Y) :- !.
alphaRed(X->X, _) :- atom(X).
alphaRed(X->X, _) :- number(X).
alphaRed([]->[], _).
alphaRed([EX|T]->[EY|RT], X->Y) :-
	alphaRed(EX->EY, X->Y),
	alphaRed(T->RT, X->Y), !.
alphaRed(Term->RTerm, X->Y) :-
	compound(Term),
	Term =.. [Op|Arg],
	alphaRed(Arg->RArg, X->Y),
	RTerm =.. [Op|RArg].

funkcja(car).
funkcja(cdr).

car(H, .(H, _)).
cdr(T, .(_, T)).
