polacz([], X, X).
polacz([H|T], X, [H|W]) :-
        polacz(T, X, W).
