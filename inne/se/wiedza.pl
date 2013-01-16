prefiks(pytanie, 'Czy to danie ').
prefiks(odpowiedz, 'Przebadane danie to ').

pytanie(biale, 'jest białe').
pytanie(brazowe, 'jest brązowe').
pytanie(czerwone, 'jest czerwone').
pytanie(dlugie, 'jest długie').
pytanie(ladne, 'jest ładne').
pytanie(kolorowe, 'ma różne kolory').
pytanie(kulki, 'ma kształt małych kulek').
pytanie(miekkie, 'jest miękkie').
pytanie(plaskie, 'jest płaskie').
pytanie(plyn, 'jest w postaci płynnej').
pytanie(podlozne, 'jest podłużne').
pytanie(przezroczyste, 'jest przezroczyste').
pytanie(smierdzi, 'śmierdzi').
pytanie(sypkie, 'jest sypkie').
pytanie(szare, 'jest szare').
pytanie(trzesie, 'się trzęsie').
pytanie(zielone, 'jest zielone').
pytanie(zimne, 'zostało podane na zimno').
pytanie(zolte, 'jest żółte').

nazwa(buraczki, 'buraczki').
nazwa(chlodnik, 'chłodnik').
nazwa(coleslaw, 'coleslaw').
nazwa(flaki, 'flaki').
nazwa(karp_w_galarecie, 'karp w galarecie').
nazwa(kasza_gryczana, 'kasza gryczana').
nazwa(kuskus, 'kuskus').
nazwa(makaron, 'makaron').
nazwa(mielony, 'mielony').
nazwa(murzynek, 'murzynek').
nazwa(rosol, 'rosół').
nazwa(ryba_smazona, 'ryba smażona').
nazwa(ryz, 'ryż').
nazwa(schab, 'schab').
nazwa(salatka_grecka, 'sałatka grecka').
nazwa(tort, 'tort').
nazwa(zupa_ogorkowa, 'zupa ogórkowa').
nazwa(zupa_pomidorowa, 'zupa pomidorowa').
nazwa(zupa_rybna, 'zupa rybna').

regula(X) :-
	rodzaj(X).
regula(ciasto).
regula(kasza).
regula(mieso).
regula(ryba).
regula(surowka).
regula(zupa).

rodzaj(X) :-
	nazwa(X, _).

zachodzi(buraczki) :-
	ustal(surowka, tak),
	ustal(czerwone, tak).
zachodzi(chlodnik) :-
	ustal(zupa, tak),
	ustal(zimne, tak).
zachodzi(ciasto) :-
	ustal(miekkie, tak),
	ustal(zimne, tak).
zachodzi(coleslaw) :-
	ustal(surowka, tak),
	ustal(kolorowe, tak).
zachodzi(flaki) :-
	ustal(zupa, tak),
	ustal(przezroczyste, tak),
	ustal(szare, tak).
zachodzi(karp_w_galarecie) :-
	ustal(ryba, tak),
	ustal(trzesie, tak).
zachodzi(kasza) :-
	ustal(sypkie, tak),
	ustal(kulki, tak).
zachodzi(kasza_gryczana) :-
	ustal(kasza, tak),
	ustal(brazowe, tak).
zachodzi(kuskus) :-
	ustal(kasza, tak),
	ustal(zolte, tak).
zachodzi(makaron) :-
	ustal(sypkie, tak),
	ustal(dlugie, tak).
zachodzi(mielony) :-
	ustal(mieso, tak),
	ustal(plaskie, nie).
zachodzi(mieso) :-
	ustal(plyn, nie),
	ustal(brazowe, tak).
zachodzi(murzynek) :-
	ustal(ciasto, tak),
	ustal(brazowe, tak).
zachodzi(rosol) :-
	ustal(zupa, tak),
	ustal(przezroczyste, tak),
	ustal(biale, tak).
zachodzi(ryba) :-
	ustal(smierdzi, tak).
zachodzi(ryba_smazona) :-
	ustal(ryba, tak),
	ustal(brazowe, tak).
zachodzi(ryz) :-
	ustal(sypkie, tak),
	ustal(podlozne, tak).
zachodzi(schab) :-
	ustal(mieso, tak),
	ustal(plaskie, tak).
zachodzi(salatka_grecka) :-
	ustal(surowka, tak),
	ustal(biale, tak).
zachodzi(surowka) :-
	ustal(mieso, nie),
	ustal(ryba, nie),
	ustal(ciasto, nie),
	ustal(zupa, nie),
	ustal(sypkie, nie).
zachodzi(tort) :-
	ustal(ciasto, tak),
	ustal(ladne, tak).
zachodzi(zupa) :-
	ustal(plyn, tak).
zachodzi(zupa_ogorkowa) :-
	ustal(zupa, tak),
	ustal(zielone, tak).
zachodzi(zupa_pomidorowa) :-
	ustal(zupa, tak),
	ustal(czerwone, tak).
zachodzi(zupa_rybna) :-
	ustal(zupa, tak),
	ustal(ryba, tak).

jednoz([biale, brazowe, czerwone, kolorowe, zolte, zielone, szare]).
jednoz([zupa, mieso, sypkie, surowka]).
jednoz([ryba, mieso, sypkie, surowka]).
jednoz([chlodnik, flaki, rosol, zupa_ogorkowa, zupa_pomidorowa, zupa_rybna]).
jednoz([schab, mielony]).
jednoz([murzynek, tort]).
jednoz([ryba_smazona, karp_w_galarecie]).
jednoz([salatka_grecka, coleslaw, buraczki]).
jednoz([makaron, ryz, kasza]).
jednoz([kasza_gryczana, kuskus]).