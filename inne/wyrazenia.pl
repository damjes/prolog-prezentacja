podst(wyr([Zm|Ogon], Term), Zm, wyr(Ogon, Term)).
podstL(wyr(Lista, Term), Pocz, wyr(Koniec, Term)) :-
	append(Pocz, Koniec, Lista).
oblicz(wyr([], in(W, Pred)), W) :-
	call(Pred).
oblicz(Wyr, War, Wyn) :-
	podstL(Wyr, War, X),
	oblicz(X, Wyn).
