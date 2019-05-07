% create a range of numbers

range(N, R, []):-
	N > R,
	!.
	
range(N, R, [N|RANGE]):-
	N1 is N + 1,
	range(N1, R, RANGE).
	
