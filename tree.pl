checktree(nil):- !.
checktree(t(_, Left, Right)):-
	checktree(Left),
	checktree(Right).
