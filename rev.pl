% reverse list using accumulator

rev([H|T], A, R):- rev(T, [H|A], R).
rev([], A, A).
