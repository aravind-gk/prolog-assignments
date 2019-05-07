% resolution in predicate logic

solve(X, Y, RES):-
	resolve(X, Y, XX, YY), 
	union(XX, YY, RES).
	
resolve([], Y, [], Y):- !.

resolve([H|X], Y, XX, YY):-
	H = n(NH),
	member(NH, Y),
	remove(NH, Y, Y2),
	resolve(X, Y2, XX, YY),
	!.
	
resolve([H|X], Y, XX, YY):-
	not(H = n(_)),
	member(n(H), Y),
	remove(n(H), Y, Y2),
	resolve(X, Y2, XX, YY),
	!.

resolve([H|X], Y, [H|XX], YY):-
	H = n(NH),
	not(member(NH, Y)),
	resolve(X, Y, XX, YY).
	
resolve([H|X], Y, [H|XX], YY):-
	not(H = n(_)),
	not(member(n(H), Y)),
	resolve(X, Y, XX, YY).
	
% member function

member(X, [X|_]):- !.
member(X, [_|T]):- 
	member(X, T).	
	
% remove by value (if exists)

remove(_, [], []) :- !.
remove(X, [X|T], T) :- !.
remove(X, [Y|T], [Y|R]):-
	remove(X, T, R).
	
% union of two lists

union([], L2, L2):- !.
union([H|L1], L2, [H|L3]):-
	not(member(H, L2)),
	!,
	union(L1, L2, L3).
union([H|L1], L2, L3):-
	member(H, L2),
	union(L1, L2, L3).
