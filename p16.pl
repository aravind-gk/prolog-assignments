%drop_every_nth_element

dropAll(L, N, R):-
	dropAll(L, N, N, R).

dropAll([_|T], 1, N, R):-
	dropAll(T, N, N, R),
	!.
	
dropAll([H|T], M, N, [H|R]):-
	M1 is M - 1, 
	dropAll(T, M1, N, R).
	
dropAll([], _, _, []).
