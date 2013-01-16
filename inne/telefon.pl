%logowanie
loguj(wyslSms(Odb, Tresc)) :-
	nl, write('Wysłano SMS pod numer: '), write(Odb),
	nl, write('Treść:'),
	nl, write(Tresc), nl.
loguj(dzwonDo(Numer)) :-
	nl, write('Dzwonię do: '), write(Numer), nl.

%parser zdań
diffApp(X-Y, Y-Z, X-Z).
diffEmpty(X-X) :-
	var(X), !.
diffEmpty([]-[]).
diffSngl(E, [E|X]-X).

dopisz(AA-[], AL, W) :-
	atom_chars(A, AA),
	diffSngl(A, LA),
	diffApp(AL, LA, W).

%zdanie(ciąg, akumulatorAtomu, akumulatorListy, wynik)
zdanie([], Empty, X, X) :- 
	diffEmpty(Empty), !.
zdanie([], AA, AL, W) :-
	dopisz(AA, AL, W-[]).
zdanie([32|Ogon], Empty, AL, W) :-
	diffEmpty(Empty),
	diffEmpty(NewEmpty),
	zdanie(Ogon, NewEmpty, AL, W), !.
zdanie([32|Ogon], AA, AL, W) :-
	dopisz(AA, AL, NAL),
	diffEmpty(Empty),
	zdanie(Ogon, Empty, NAL, W).
zdanie([Znak|Ogon], Empty, AL, W) :-
	diffEmpty(Empty),
	diffSngl(Znak, AA),
	zdanie(Ogon, AA, AL, W), !.
zdanie([Znak|Ogon], AA, AL, W) :-
	diffSngl(Znak, LZn),
	diffApp(AA, LZn, NAA),
	zdanie(Ogon, NAA, AL, W).

:- dynamic ksiazka/2.

%komendy
rob([numer, Czlowiek, to, Numer]) :-
	retractall(ksiazka(Czlowiek, _)),
	assertz(ksiazka(Czlowiek, Numer)).
rob([jaki, numer, do, X]) :-
	ksiazka(X, Y),
	nl, write('Numer do '), write(X), write(' to '), write(Y), nl.
rob([czyj, numer, to, Y]) :-
	ksiazka(X, Y),
	nl, write('Numer do '), write(X), write(' to '), write(Y), nl.
rob([dzwon, do, X]) :-
	ksiazka(X, Y),
	loguj(dzwonDo(Y)).
rob([dzwon, do, X]) :-
	X =.. [Liczba],
	number(Liczba),
	loguj(dzwonDo(Liczba)).

mowie(Zdanie) :-
	diffEmpty(E1),
	diffEmpty(E2),
	zdanie(Zdanie, E1, E2, Lista),
	zrob(Lista).

zrob(Lista) :-
	rob(Lista), !.

zrob(_) :-
	nl, write('Nie rozumiem'), nl.
