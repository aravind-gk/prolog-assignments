% swap swaps two elements if possible and returns true if any swaps done
swap([X,Y|L], [Y,X|L]):- X > Y, !.
swap([X|L1], [X|L2]):- swap(L1, L2).

% case: swap returns true (list is not sorted yet)
bubble(List, Sorted):-
	swap(List, Temp), !, bubble(Temp, Sorted). 
	
% case: swap returns false (input list is now sorted)
bubble(List, List).
