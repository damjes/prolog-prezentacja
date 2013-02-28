subst(V, E, R) :-
	copy_term(E, Ce),
	substAB(V, Ce, R).
