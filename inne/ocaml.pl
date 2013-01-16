/* Rozwiazywanie rownan typow OCamla
Potrafi wnioskowac typy po sygnaturkach
Zamiast zapisywac 'a list mamy list(A)

copyleft by matma6
*/

sig(flatten, list(list(A)) -> list(A)).
sig(map, (A -> B) -> list(A) -> list(B)).
sig(fold_left, (A -> B -> A) -> A -> list(B) -> A).
sig(fold_left2, (A -> B -> C -> A) -> A -> list(B) -> list(C) -> A).
sig(sort, (A -> A -> int) -> list(A) -> list(A)).

sig(+, int -> int -> int).
sig(+., float -> float -> float).

sig(floatuj, int -> float).
sig(misa, byte -> byte -> byte -> byte).

subst(Fun, Arg, Wyn) :-
	sig(Fun, Arg -> Wyn).
currySubstRec([], Sig, Sig).
currySubstRec([Arg|Tail], Arg->Sig, Wyn) :-
	currySubstRec(Tail, Sig, Wyn).
currySubst(Fun, Arg, Wyn) :-
	sig(Fun, Sig),
	currySubstRec(Arg, Sig, Wyn).
