% generate a random permutation of the elements of a list

rnd_permu(L, P):-
	length(L, LEN),
	rnd_select(L, LEN, P).

% remove kth element from list

removekth(H, [H|T], 1, T):- !.
removekth(X, [H|T], N, [H|R]):-
	N1 is N - 1,
	removekth(X, T, N1, R).
	
% random(L,U,R) generates random integer in [L,U).

% selecting given number of random elements from list

rnd_select(_, 0, []):- !.
rnd_select([], _, []):- !.
rnd_select(L, N, [X|R]):-
	length(L, LEN),
	LEN1 is LEN + 1, 
	random(1, LEN1, RAND),
	removekth(X, L, RAND, L2),
	N1 is N - 1,
	rnd_select(L2, N1, R). 
