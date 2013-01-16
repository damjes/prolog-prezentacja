:- [wyrazenia].

for(Od, Do, _, W, W) :-
	Od > Do.
for(Od, Do, Wyr, Biez, W) :-
	Od =< Do,
	copy_term(Wyr, KopiaWyr),
	oblicz(KopiaWyr, [Biez, Od], NBiez),
	Od1 is Od + 1,
	for(Od1, Do, Wyr, NBiez, W).

lWez(0, [H|_], H).
lWez(N, [_|T], W) :-
	N > 0,
	N1 is N - 1,
	lWez(N1, T, W).

mWez(M, X, Y, W) :-
	lWez(X, M, Wiersz),
	lWez(Y, Wiersz, W).

instrukcja(M, DG, DD) :-
	length(M, Dl),
	Do is Dl - 1,
	W = wyr(
		[Wyr, Akt, Indeks],
		in(Nowe, (
			oblicz(Wyr, [Indeks], Zmien),
			mWez(M, Indeks, Zmien, Komorka),
			Nowe is Akt * Komorka
		))
	),
	copy_term(W, NW),
	podst(W, wyr([X], in(X, true)), WyrDGl),
	for(0, Do, WyrDGl, 1, DG),
	podst(NW, wyr([X], in(Y, Y is Do - X)), WyrDDod),
	for(0, Do, WyrDDod, 1, DD), !.
