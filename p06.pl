%Palindrome check
is_equal(X, X).
palin(X):-
	rev_list(X, XR),
	is_equal(X, XR).

%reverse a list
%rev_list(list, reverse_list)

rev_list([], []).
rev_list([H|T], REV):-
	rev_list(T, REV2),
	conc(REV2, [H], REV).
	
%concatenate two lists

conc([], L2, L2).
conc([H|L1], L2, [H|R]):-
	conc(L1, L2, R).
	

