/* Przeliczanie stopni Celsjusza na Fahrenheita i odwrotnie
   Metoda wlasna (suma/3, iloczyn/3 i celsFahr)

copyleft by matma6
*/

suma(X, Y, Z) :-
	ground(Y),
	ground(Z), !,
	X is Z - Y.
suma(X, Y, Z) :-
	ground(X),
	ground(Z), !,
	Y is Z - X.
suma(X, Y, Z) :-
	ground(X),
	ground(Y), !,
	Z is X + Y.

iloczyn(X, Y, Z) :-
	ground(Y),
	ground(Z), !,
	X is Z / Y.
iloczyn(X, Y, Z) :-
	ground(X),
	ground(Z), !,
	Y is Z / X.
iloczyn(X, Y, Z) :-
	ground(X),
	ground(Y), !,
	Z is X * Y.

celsFahr(C, F) :-
	iloczyn(C, 9, U),
	iloczyn(V, 5, U),
	suma(V, 32, F), !.

celsFahr(C, F) :-
	suma(V, 32, F),
	iloczyn(V, 5, U),
	iloczyn(C, 9, U), !.
