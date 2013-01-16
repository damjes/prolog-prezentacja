/* Listy leniwe
Zgodnie z konwencja lispowa:
cons - rob pare
car  - wez pierwszy element pary
cdr  - wez drugi    element pary (i wyznacz go)

np. (dla zwyklych list): (car (cdr '(1 2 3))) to (car '(2 3)) czyli 2
     - drugi element (glowa ogona)

copyleft by matma6
*/

car(cons(X, _), X).
car(nil, nil).
cdr(cons(_, in(Y, P)), Y) :-
	call(P).
cdr(nil, nil).

const(X, cons(X, in(Y, const(X, Y)))) :- !.
int(X, cons(X, in(Y, int(X1, Y)))) :- !,
	X1 is X + 1.

kilkaTrue(0, nil) :- !.
kilkaTrue(X, cons(true, in(Y, kilkaTrue(X1, Y)))) :-
	X > 0,
	X1 is X - 1.
wieleTrue(cons(true, in(Y, wieleTrue(Y)))).

ltake(0, _, []) :- !.
ltake(_, nil, []) :- !.
ltake(N, LL, [H|T]) :- !,
	car(LL, H),
	cdr(LL, LT),
	N1 is N - 1,
	ltake(N1, LT, T).

ltakeinf(nil, []) :- !.
ltakeinf(LL, [H|T]) :- !,
	car(LL, H),
	cdr(LL, LT),
	ltakeinf(LT, T).

lappend(cons(X, in(LLY, P)), LL2, cons(X, in(LL, lappend(LLY, LL2, LL)))) :-
	call(P).
lappend(nil, LL, LL).

toll([], nil).
toll([H|T], cons(H, in(Y, toll(T, Y)))).

spr(nil).
spr(cons(true, in(Y, P))) :-
	call(P),
	spr(Y).
