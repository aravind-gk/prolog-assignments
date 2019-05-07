word([a,f,t]). 
word([a,l,e]). 
word([e,e,l]). 
word([h,e,e,l]). 
word([h,i,k,e]).
word([h,o,s,e,s]). 
word([k,e,e,l]). 
word([k,n,o,t]). 
word([l,a,s,e,r]). 
word([l,e,e]).
word([l,i,n,e]). 
word([s,a,i,l,s]). 
word([s,h,e,e,t]). 
word([s,t,e,e,r]). 
word([t,i,e]). 

% MAIN FUNCTION
crossword(L):- 
	place_word1([],L1), 
	place_word2(L1,L2), 
	place_word3(L2,L3), 
	place_word4(L3,L4), 
	place_word5(L4,L5), 
	place_word6(L5,L6), 
	place_word7(L6,L7), 
	place_word8(L7,L8),
	convert_to_word(L8,L), 
	nl.

% PLACE THE WORDS AT RESPECTIVE POSITIONS
place_word1(L1,L2):- 
	word(WORD), 
	length(WORD,5), 
	append(L1,[WORD],L2).

place_word2(L1,L2):- 
	word(WORD), 
	not(member(WORD,L1)), 
	length(WORD,5), 
	nth0(0,WORD,C1),
	nth0(0,L1,WORD1), 
	nth0(2,WORD1,C2), 
	C1 = C2, 
	append(L1,[WORD],L2).

place_word3(L1,L2):- 
	word(WORD), 
	not(member(WORD,L1)), 
	length(WORD,5), 
	nth0(0,WORD,C1),
	nth0(0,L1,WORD1), 
	nth0(4,WORD1,C2), 
	C1 = C2, 
	append(L1,[WORD],L2).
			
place_word4(L1,L2):- 
	word(WORD), 
	not(member(WORD,L1)), 
	length(WORD,4), 
	append(L1,[WORD],L2).

place_word5(L1,L2):- 
	word(WORD), 
	not(member(WORD,L1)), 
	length(WORD,4), 
	nth0(0,WORD,C1),
	nth0(3,L1,WORD1), 
	nth0(2,WORD1,C2), 
	C1 = C2, 
	append(L1,[WORD],L2).

place_word6(L1,L2):- 
	word(WORD), 
	not(member(WORD,L1)), 
	length(WORD,3), 
	append(L1,[WORD],L2).

place_word7(L1,L2):- 
	word(WORD), 
	not(member(WORD,L1)), 
	length(WORD,3), 
	nth0(0,WORD,C1),
	nth0(1,L1,WORD1), 
	nth0(3,WORD1,C2), 
	C1 = C2, 
	append(L1,[WORD],L2).
			
place_word8(L1,L2):- 
	word(WORD), 
	not(member(WORD,L1)), 
	length(WORD,5), 
	nth0(0,WORD,C1),
	nth0(5,L1,WORD1), 
	nth0(1,WORD1,C2), 
	C1 = C2, 
	append(L1,[WORD],L2).
			
% CONVERT LIST TO WORD
convert_to_word([H|L8],[X|L]):- 
	string_to_list(X,H), 
	convert_to_word(L8,L).

convert_to_word([],[]).
