last_but_one(X, [A,B,C|T]):-
	last_but_one(X, [B,C|T]),
	!.
last_but_one(A, [A, B]).
