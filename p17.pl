%split_list
split1(L, 0, [], L):- !.
split1([H|T], Count, [H|L1], L2):-
	Count1 is Count - 1,
	split1(T, Count1, L1, L2).

%rotateList

rotate(L, N, RES):-
	N < 0,
	length(L, LEN),
	N2 is LEN - N, 
	rotate(L, N2, RES), 
	!.
	
rotate(L, N, RES):-
	split1(L, N, L1, L2),
	concat(L2, L1, RES).
	
%concat

concat([], L2, L2):- !.
concat([X|L1], L2, [X|L3]):-
	concat(L1, L2, L3).
