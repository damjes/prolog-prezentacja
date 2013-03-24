rycerz(rycerz).
lotr(lotr).

powiedzial(rycerz, Zdanie) :-
        call(Zdanie).
powiedzial(lotr, Zdanie) :-
        not(Zdanie).
