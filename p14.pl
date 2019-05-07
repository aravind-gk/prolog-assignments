%duplicate_elements
dupli([H|T], [H,H|R]):-
	dupli(T, R).
dupli([], []).
