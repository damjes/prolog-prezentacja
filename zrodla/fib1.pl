fib1(0, 0).
fib1(1, 1).
fib1(N, X) :-
	N > 1,
	N1 is N-1,
	N2 is N-2,
	fib1(N1, X1),
	fib1(N2, X2),
	X is X1+X2.
