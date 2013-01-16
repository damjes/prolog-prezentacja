/* Mutowalne zmienne globalne

copyleft by matma6
*/

:- dynamic var/2.

unlet(N) :-
	retractAll(var(N, _)).
let(N, V) :-
	unlet(N),
	assertz(var(N, V)).
get(N, V) :-
	var(N, V), !.
