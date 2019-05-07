%pack_consecutive_elements

append1(X, LIST, [X|LIST]).

pack1(L, R):-
	pack1(L, R, []).

pack1([H,H|T], R, BUFF):-
	pack1([H|T], R, [H|BUFF]),
	!.

pack1([H1|T], R, BUFF):-
	pack1(T, R1, []), 
	append1(H1, BUFF, BUFF2),
	append1(BUFF2, R1, R), 
	!.

pack1([], [], _).
	
