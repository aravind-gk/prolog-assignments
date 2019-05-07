year('1928').
year('1929').
year('1932').
year('1935').

person(gertie).
person(herbert).
person(miriam).
person(wallace).

exchange(al).
exchange(be).
exchange(pe).
exchange(sl).

solve:- 
	year(Y1), 
	year(Y2), 
	year(Y3), 
	year(Y4),
    unique([Y1,Y2,Y3,Y4]),

    exchange(GertEx), 
    exchange(HerbEx), 
    exchange(MirEx), 
    exchange(WallEx),
    unique([GertEx,HerbEx,MirEx,WallEx]),

    Triples= [[gertie,GertEx,Y1],
      [herbert,HerbEx,Y2],
      [miriam,MirEx,Y3],
      [wallace,WallEx,Y4]],
          
    %herberts first exchange was BE
    
    not(member([herbert,be,_],Triples)),
    
    %neither herberts nor gerties first exchange was sl
    
    not(
        member([herbert,sl,_],Triples);
        member([gertie,sl,_],Triples)
        ),
        
    %the BE exchange wasnt made in 1935
    
    not(member([_,be,'1935'],Triples)),
    
    %neither the AL nor the BE exchanges were made in 1932
    
    not(
         member([_,al,'1932'],Triples);
         member([_,be,'1932'],Triples)
       ),
       
    %the PE exchange was made in 1929
    
       member([_,pe,'1929'],Triples),
       
    %wallace's first exchange was AL
    
       member([wallace,al,_],Triples),

	%print the answers
       writer(gertie,Y1,GertEx),
       writer(herbert,Y2,HerbEx),
       writer(miriam,Y3,MirEx),
       writer(wallace,Y4,WallEx).

writer(X,Y,Z):- write(X), write(' made the '), write(Y), write(' exchange in '), write(Z), nl.

unique([H | T]) :- member(H, T), !, fail.
unique([_ | T]) :- unique(T).
unique([_]).

