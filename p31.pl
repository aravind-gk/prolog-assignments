% prime check

is_not_prime(N):-
	is_not_prime(N, 2).
	
is_not_prime(N, K):-
	K < N, 
	MOD is mod(N, K),
	MOD = 0,
	!.
	
is_not_prime(N, K):-
	K1 is K + 1, 
	K < N, 
	is_not_prime(N, K1).
	
is_prime(N):-
	not(is_not_prime(N)).
