% coprime test

coprime(A, B):-
	gcd(A, B, G),
	G = 1.

% euclid gcd function

gcd(A, B, R):-
	M is mod(A, B),
	M = 0,
	!, 
	R is B.

gcd(A, B, R):-
	M is mod(A, B),
	gcd(B, M, R).

