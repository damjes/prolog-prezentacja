panon(Po, Do, Xs) :-
	copy_term([Po|Do], [Ps, Xs]),
	call(Ps).
panon(Po, Do, Xs, Ys) :-
	copy_term([Po|Do], [Ps, Xs, Ys]),
	call(Ps).
panon(Po, Do, Xs, Ys, Zs) :-
	copy_term([Po|Do], [Ps, Xs, Ys, Zs]),
	call(Ps).
