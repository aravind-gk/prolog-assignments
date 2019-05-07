% generate all permutations

permut([], []).
permut([H|TAIL], PERM):-
	permut(TAIL, PERM1),
	insert(H, PERM1, PERM).
	
insert(X, PERM1, [X|PERM1]).
insert(X, [H|PERM1], [H|PERM]):-
	insert(X, PERM1, PERM). 

