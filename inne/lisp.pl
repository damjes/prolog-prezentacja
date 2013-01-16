/* Lisp w Prologu
Nietypowa skladnia list (tj. prologowa)
zamiast lispowego (cons a b)
mamy prologowe [cons, a, b]

copyleft by matma6
*/

forma(defun).
forma(if).
forma(setq).
forma(quote).
fun(car).
fun(cdr).
fun(cons).

defun(s(SF, Z)->s([f(N, A, C)|SF], Z), N, N, A, C).
warLog([], []) :- !.
warLog(_, true).
if(S->NS, R, true, P, _) :-
	ewal(S->NS, R, P), !.
if(S->NS, R, [], _, F) :-
	ewal(S->NS, R, F), !.
if(S->NS, R, W, P, F) :-
	ewal(S->TS, WW, W),
	warLog(WW, Bool),
	if(TS->NS, R, Bool, P, F).

wywalZm(_, [], []).
wywalZm(N, [w(N, _) | T], T) :- !.
wywalZm(N, [X | T], [X | ZT]) :-
	wywalZm(N, T, ZT).
setq(s(F, Z)->s(F, [w(N, W) | ZZ]), W, N, W) :-
	wywalZm(N, Z, ZZ).

quote(S->S, X, X).

car(S->S, X, .(X, _)).
cdr(S->S, X, .(_, X)).
cons(S->S, .(X, Y), X, Y).

ewal(S -> S, W, A) :-
	S = s(_, Z),
	member(w(A, W), Z), !.
ewal(S->S, L, L) :-
	number(L), !.
ewal(S->S, [], nil) :- !.
ewal(S->S, true, t) :- !.
ewal(S->S, W, [F | A]) :-
	S = s(SF, _),
	member(f(F, NA, NW), SF),
	ewalFun(S, f(NA, NW), W, A), !.
ewal(S, W, [F | A]) :-
	forma(F),
	T =.. [F, S, W | A],
	call(T), !.
ewal(S, W, [F | A]) :-
	fun(F),
	ewalList(S, WA, A),
	T =.. [F, S, W | WA],
	call(T), !.

ewalList(S->S, [], []).
ewalList(S->NS, [WH | WT], [H | T]) :-
	ewal(S->TS, WH, H),
	ewalList(TS->NS, WT, T).

ewalFun(s(F,Z), f([NA|NAS], WN), W, [A|AS]) :-
	ewalFun(s(F,[w(NA,A)|Z]), f(NAS, WN), W, AS).
ewalFun(S, f([], WN), W, []) :-
	ewal(S->_, W, WN).

listaInstr(_, [], W, W).
listaInstr(S->NS, [I | Is], _, W) :-
	ewal(S->TS, Aku, I),
	listaInstr(TS->NS, Is, Aku, W).