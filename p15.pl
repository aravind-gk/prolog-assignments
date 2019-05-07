%duplicate_elements
dupli([H|T], COUNT, R):-
	dupli(T, COUNT, R2),
	expand(H, COUNT, L1),
	concat(L1, R2, R).
dupli([], _, []).

expand(_, 0, []):- !.
expand(X, COUNT, [X|R]):-
	COUNT1 is COUNT - 1, 
	expand(X, COUNT1, R).

concat([], L2, L2).
concat([X|L1], L2, [X|L3]):-
	concat(L1, L2, L3).
