:- dynamic fib/2. %bo chce dodawac nowe fakty

fib(0, 0).
fib(1, 1).
fib(N, X) :-
	N > 1,
	N1 is N-1,
	N2 is N-2,
	fib(N1, X1),
	fib(N2, X2),
	X is X1+X2,
	!,                  %jedyny sluszny wynik
	asserta(fib(N, X)). %zapamietaj go


