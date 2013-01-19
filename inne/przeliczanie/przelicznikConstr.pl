/* Przeliczanie stopni Celsjusza na Fahrenheita i odwrotnie
   Wiezy na domenach nieprzeliczalnych (liczbach rzeczywistych)
   (constrCelsFahr/3)

copyleft by matma6
*/

:- use_module(library(clpr/nf_r)).

constrCelsFahr(C, F) :-
	{C * 9 = U},
	{V * 5 = U},
	{V + 32 = F}, !.

constrCelsFahr(C, F) :-
	{V + 32 = F},
	{V * 5 = U},
	{C * 9 = U}, !.
