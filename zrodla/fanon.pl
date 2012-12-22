substAB(\(X -> Y, P), X -> Y) :-
	call(P).
subst(F, D) :-
	copy_term(F, Klon),
	substAB(Klon, D).
