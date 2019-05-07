% remove kth element from list

removekth(H, [H|T], 1, T):- !.
removekth(X, [H|T], N, [H|R]):-
	N1 is N - 1,
	removekth(X, T, N1, R).
