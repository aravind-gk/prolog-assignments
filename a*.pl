estimated_cost(a,4). 
estimated_cost(b,5). 
estimated_cost(c,3). 
estimated_cost(d,5). 
estimated_cost(e,3). 
estimated_cost(f,3). 
estimated_cost(g,4).
estimated_cost(h,3). 
estimated_cost(i,4). 
estimated_cost(j,2). 
estimated_cost(k,4). 
estimated_cost(l,1). 
estimated_cost(m,0). 
estimated_cost(n,2).

cost_from_root(a,0). 
cost_from_root(b,1). 
cost_from_root(c,1). 
cost_from_root(d,1). 
cost_from_root(e,2). 
cost_from_root(f,2). 
cost_from_root(g,2).
cost_from_root(h,3). 
cost_from_root(i,3). 
cost_from_root(j,3). 
cost_from_root(k,3). 
cost_from_root(l,4). 
cost_from_root(m,5). 
cost_from_root(n,5).

edge(a,b). 
edge(a,c). 
edge(a,d).
edge(c,e). 
edge(c,f). 
edge(c,g).
edge(e,h). 
edge(e,i).
edge(f,j). 
edge(f,k).
edge(j,l).
edge(l,m). 
edge(l,n).

goal_node(m).


search(S):- 
	astar([[0,S,[]]]).

astar([[F,N,I]|X]):- 
	not(goal_node(N)), 
	setof([F1,N1,[N|I]], 
	(edge(N,N1), total_cost(N1,F1)), X1), 
	append(X,X1,X2), 
	sort(X2,X3), 
	astar(X3), 
	!.
				  
astar([[F,N,I]|X]):- 
	goal_node(N), 
	reverse([N|I],P), 
	nl,
	write("Found path = "), 
	print_path(P),
	%write(P), 
	cost_from_root(N,G), 
	nl,
	write("\nCost of path = "), 
	write(G), 
	nl, nl,
	!.
 
total_cost(E,F):- 
	cost_from_root(E,G), 
	estimated_cost(E,H), 
	F is G + H.
	
print_path([HEAD|TAIL]):-
	write("->"),
	write(HEAD), 
	print_path(TAIL).

print_path([]).
	
