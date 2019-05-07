%flatten_a_nested_list
my_flatten([], []):- !.
my_flatten([H|T], RES):-
	my_flatten(H, RES1), 
	!,
	my_flatten(T, RES2), 
	conc(RES1, RES2, RES).
my_flatten(H, [H]).
	
%concatenate two lists

conc([], L2, L2).
conc([H|L1], L2, [H|R]):-
	conc(L1, L2, R).	
