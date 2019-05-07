%eliminate_consecutive_duplicates
compress([H,H|T], R):-
	compress([H|T], R),
	!.
compress([H|T], [H|R]):-
	compress(T, R),
	!.
compress([], []).
