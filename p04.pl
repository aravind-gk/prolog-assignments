% length of list
list_len(0, []).
list_len(X, [_|T]):-
	list_len(X1, T),
	X is X1 + 1.
