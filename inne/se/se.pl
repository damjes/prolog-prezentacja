/* Reguly wnioskowania
Fragment systemu eksperckiego

copyleft by matma6
*/

:- [wiedza].

:- dynamic wiemy/2.

odp(116, tak) :- !.
odp(110, nie) :- !.
odp(StaryZnak, Odp) :-
	write('nie zrozumiałem '),
	put_code(StaryZnak), nl,
	get_single_char(NowyZnak),
	odp(NowyZnak, Odp).

zapytaj(OCo) :-
	prefiks(pytanie, Prefiks),
	write(Prefiks),
	pytanie(OCo, Tresc),
	write(Tresc),
	write(' ? [t/n] '),
	get_single_char(Znak),
	put_code(Znak), nl,
	odp(Znak, Odp),
	assertz(wiemy(OCo, Odp)).

ustal(Co, Jakie) :-
	wiemy(Co, _), !,
	wiemy(Co, Jakie).
ustal(Co, Jakie) :-
	regula(Co), !,
	sprawdz(Co, Jakie).
ustal(Co, Jakie) :-
	zapytaj(Co),
	wiemy(Co, Jakie).

kolizje(X) :-
	jednoz(Lista),
	member(X, Lista),
	member(Inne, Lista),
	\+ X = Inne,
	wiemy(Inne, tak).

sprawdz(X, tak) :-
	\+ kolizje(X),
	zachodzi(X), !,
	assertz(wiemy(X, tak)).
sprawdz(X, nie) :-
	kolizje(X),
	assertz(wiemy(X, nie)).
sprawdz(X, nie) :-
	\+ zachodzi(X),
	assertz(wiemy(X, nie)).

sprawdz(X) :-
	sprawdz(X, _).

rozpoznaj :-
	regula(X),
	sprawdz(X),
	%tu cos wiemy i mamy zapisane
	rodzaj(X),
	sprawdz(X, tak), !, %ale musimy wiedzieć, czy to jest prawda
	prefiks(odpowiedz, Prefiks),
	nazwa(X, Nazwa),
	nl, write(Prefiks),
	write(Nazwa),
	write('.'), nl, nl, fail.
rozpoznaj.

odNowa :-
	retractall(wiemy(_, _)).

coTo :-
	odNowa, fail.
coTo :-
	rozpoznaj.

czy(X) :-
	odNowa,
	sprawdz(X),
	wiemy(X, Odp),
	nl,	write(Odp), nl, nl.