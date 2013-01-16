/* Przeliczanie stopni Celsjusza na Fahrenheita i odwrotnie
 - Metoda wlasna (suma/3, iloczyn/3 i celsFahr)
 - Wiezy na domenach nieprzeliczalnych (liczbach rzeczywistych)
   (constrCelsFahr/3)

copyleft by matma6
*/

:- use_module(library(clpr/nf_r)).

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
	suma(V, 32, F).

constrCelsFahr(C, F) :-
	{C * 9 = U},
	{V * 5 = U},
	{V + 32 = F}.
