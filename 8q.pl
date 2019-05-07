%8queens problem prolog

solution(N, Queens):- 
	generate(1, N, L),
	permute(L, Queens),
	safe(Queens).
	
generate(N, N, [N]):- !.
generate(X, N, [X|L]):-
	X =< N,
	X1 is X + 1,
	generate(X1, N, L).
	
permute([], []).
permute([H|T], PERM):-
	permute(T, PERM1),
	insert(H, PERM1, PERM).

%alter
%	permutation(L, Queens).
	
insert(X, PERM1, [X|PERM1]).
insert(X, [H|PERM1], [H|PERM]):-
	insert(X, PERM1, PERM).

safe([]).	
safe([Queen|Others]):-
	safe(Others),
	noattack(Queen, Others, 1).
	
noattack(_,[],_).
noattack(Q, [X|Others], Dist):-
	Q - X =\= Dist, 
	X - Q =\= Dist,
	%abs(Q - X) \= Dist,
	Dist1 is Dist + 1,
	noattack(Q, Others, Dist1).
	
