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

start(Src):-
	search(Src, []).
	
search(Src, Buff):-
	goal(Src), !,
	append(Buff, [Src], Path),
	print_path(Path),
	print_cost(Path).

search(Src, Buff):-
	not(member(Src, Buff)), 
	append(Buff, [Src], Buff2),
	connected(Src, Next),
	search(Next, Buff2).

print_path([]):- !, nl.
print_path([X| Path]):-
	write(' --> '),
	write(X),
	print_path(Path).
	
print_cost(Path):-
	write(' Cost of path: '),
	length(Path, Cost),
	write(Cost).
