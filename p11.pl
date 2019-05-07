%modified_encoding

encode(L, R):-
	encode1(L, L1),
	encode3(L1, R).

encode3([[1, X]|T], [X|R]):- 
	encode3(T, R), 
	!.
	
encode3([H|T], [H|R]):-
	encode3(T, R).
	
encode3([], []). 

%length_encoding_of_a_list

encode1(L1, R):-
	pack1(L1, L2),
	encode2(L2, R).

encode2([H|T], [[LEN, X]|R]):-
	list_len(H, LEN),
	first_ele(H, X),
	encode2(T, R).

encode2([], []).

%first_pack_the_elements

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

%length_of_list

list_len([], 0).

list_len([_|T], R):-
	list_len(T, R1),
	R is R1 + 1.
	
%return_1st_elem_of_list

first_ele([H|_], H).
	
