% extract a slice from a list

slice(_, 1, 0, []):- !.
slice([H|T], 1, J, [H|RES]) :- 
	J1 is J - 1,
	slice(T, 1, J1, RES),
	!.
slice([_|T], I, J, RES):-
	I1 is I - 1, 
	J1 is J - 1,
	slice(T, I1, J1, RES).

