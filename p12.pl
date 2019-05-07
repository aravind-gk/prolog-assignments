%decode_an_encoded_list

decode([[LEN,X]|T], R):-
	decode(T, R2),
	expand(LEN, X, L1),
	concat(L1, R2, R), 
	!.

decode([H|T], [H|R]):-
	decode(T, R).
	
decode([], []).

expand(0, _, []).
expand(LEN, X, [X|R]):-
	LEN1 is LEN - 1,
	expand(LEN1, X, R).

concat([], L2, L2).
concat([H|L1], L2, [H|L3]):-
	concat(L1, L2, L3).
