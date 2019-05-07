edge(a, b).
edge(b, c).
edge(b, e).
edge(c, d).
edge(d, e).
edge(e, g).
edge(d, f).
edge(f, g).

connected(X, Y):- edge(X, Y).
connected(X, Y):- edge(Y, X). 
	
goal(f).

search(Src):-
	search(Src, []).
	
search(Src, Buff):-
	goal(Src),
	insert_at_end(Src, Buff, Path),
%	append(Buff, [Src], Path),
	print_path(Path),
	print_cost(Path).

search(Src, Buff):-
	not(goal(Src)),
	not(member(Src, Buff)), 
	insert_at_end(Src, Buff, Buff2),
%	append(Buff, [Src], Buff2),
%	edge(Src, Next),
	connected(Src, Next),
	search(Next, Buff2).

print_path([]):- !, nl.
print_path([X| Path]):-
	write('--->'),
	write(X),
	print_path(Path).
	
print_cost(Path):-
	write('Cost of path: '),
	length(Path, Cost),
	write(Cost).

%member(X, [X| List]):- !.
%member(X, [Y| List]):- 
%	member(X, List).
	
insert_at_end(X, [], [X]):- !.
insert_at_end(X, [H| List1], [H| List2]):-
	insert_at_end(X, List1, List2).
