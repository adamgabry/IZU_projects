% Zadani c. 35:
% Napiste program resici ukol dany predikatem u35(LIN,LOUT), kde LIN je vstupni 
% celociselny seznam a LOUT je vystupni seznam obsahujici vsechny prvky seznamu
% LIN, ve kterem jsou vsechna licha cisla predsunuta pred suda cisla. 

% Testovaci predikaty:                       		% LOUT 
u35_1:- u35([5,-7,4, 8,3,1,0,-2],LOUT),write(LOUT).	% [5,-7,3,1,4,8,0,-2]
u35_2:- u35([8,4,2,0,-2,1],LOUT),write(LOUT).		% [1,8,4,2,0,-2]
u35_3:- u35([],LOUT),write(LOUT).			% []
u35_r:- write('Zadej LIN: '),read(LIN),
	u35(LIN,LOUT),write(LOUT).

% Reseni:
u35(LIN,LOUT):-
    divide_list(LIN, Odds, Evens),
    concat_lists(Odds,Evens, LOUT).

divide_list([], [], []).
concat_lists([], List, List). % third argument is final list

divide_list([Head|Tail_X], [Head|Tail_Y], Z) :-
    Head mod 2 =:= 1, % Head is odd 	% if Head is odd, it is added to Tail_Y, if its not it is added to Z
    divide_list(Tail_X, Tail_Y, Z). 		% recursively calls itself with the remaining elements of Tail_X

divide_list([Head|Tail], Y, [Head|Z]) :-
    Head mod 2 =:= 0, % Head is even
    divide_list(Tail, Y, Z).	% recursively calls itself with the remaining elements of Tail

% Concatenation of even and odd lists
concat_lists([Head|Tail], List, [Head|L3]) :- % keeps adding the elements of the first list and when there are none left to add from the first list, add second list to it 
    concat_lists(Tail, List, L3).
