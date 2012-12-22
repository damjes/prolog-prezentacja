rycerz(rycerz).
lotr(lotr).

powiedzial(rycerz, Zdanie) :-
        call(Zdanie).
powiedzial(lotr, Zdanie) :-
        \+ Zdanie. %\+ to negacja
