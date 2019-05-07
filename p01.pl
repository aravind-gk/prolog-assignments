my_last(X, [A,B|T]):-
	my_last(X, [B|T]),
	!.
my_last(A, [A]).


