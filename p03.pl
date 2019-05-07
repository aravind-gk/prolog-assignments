% kth element of a list 
kth(H, [H|T], 1).
kth(X, [H|T], K):-
	K1 is K - 1,
	kth(X, T, K1),
	!.
	

