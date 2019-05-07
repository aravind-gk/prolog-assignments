owns(mike, book(tale_of_two_cities, charles)).

findBook(Person):-
	owns(Person, B),
	whichBook(B).
	
whichBook(book(Name, Auth)):-
	write(' name = '), write(Name), write(' auth = '), write(Auth), nl.
	
