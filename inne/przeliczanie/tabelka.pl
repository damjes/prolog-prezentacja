/* Przeliczanie stopni Celsjusza na Fahrenheita i odwrotnie
   Generator tabelki w HTMLu

copyleft by matma6
*/

%konfig
nazwa('tabelka.html').
co(cels).
od(-30).
do(30).
krok(5).

:- [przelicznik].

poczatek :-
	format('<html><head><title>Przeliczanie Celsjuszy na Fahrenheity</title><link rel="Stylesheet" type="text/css" href="style.css" /></head><body><table><tr><th>&deg;C</th><th>&deg;F</th></tr>').
koniec :-
	format('</table></body></html>').

srodek(Cs, Fs) :-
	maplist(zip, Zip, Cs, Fs),
	member((C, F), Zip),
	format('<tr><td>~1f</td><td>~1f</td></tr>', [C, F]),
	fail.
srodek(_, _).

zip((X, Y), X, Y).

lista(Od, Do, _, []) :-
	Od > Do, !.
lista(Od, Do, Krok, [Od|Ogon]) :-
	NOd is Od+Krok,
	lista(NOd, Do, Krok, Ogon).

dajCF(L, cels, L, _).
dajCF(L, fahr, _, L).

main :-
	%wczytaj wartosci
	nazwa(Nazwa),
	co(Co),
	od(Od),
	do(Do),
	krok(Krok),
	%generuj wynik
	lista(Od, Do, Krok, Lista),
	dajCF(Lista, Co, Cs, Fs),
	maplist(celsFahr, Cs, Fs),
	%generuj html
	tell(Nazwa),
	poczatek,
	srodek(Cs, Fs),
	koniec,
	told.

:- main.
:- halt.
