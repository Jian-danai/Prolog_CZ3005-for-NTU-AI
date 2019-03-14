%The information for the six games.(Data)
badminton([y,y,y,n]).          %have ball;2 persons;use hands;use table
soccer([y,n,n,n]).             %have ball;not 2 persons;not use hands;not use table
swim([n,n,y,n]).               %not have ball;not 2 persons;use hands;not use table
run([n,n,n,n]).                %not have ball;not 2 persons;not use hands;not use table
basketball([y,n,y,n]).         %have ball;not 2 persons;use hands;not use table
tabletennis([y,y,y,y]).        %have ball;2 persons;use hands;use table

%add two lists together using recursion.
append([], Y, Y).
append([H|X], Y, [H|Z]) :- append(X, Y, Z).

%Give the choices and read the answer.
read_list_from_user(L):-
	write('Please input your answer(y or n): '),
	nl,read(L),nl.

%show the result.
show_result(X):-
	write('I guess it is '),
	((badminton(X)->write('badminton'));% Consider the exist results first. If anyone is true, print the result and end the game.
	(soccer(X)->write('soccer'));
	(swim(X)->write('swimming'));
	(run(X)->write('run'));
	(basketball(X)->write('basketball'));
	(tabletennis(X)->write('table tennis'));
	(write('that you have a game which is not included in these six in your mind.'))).%If all above are false, then print this.

%start the game and this is the main function.
start_game:-
	%print the regular of this game
        write('You can have a game of these six(soccer,swim,badminton,run,tabletennis,basketball) in your mind. Then answer my question.'),
	nl,%Line break
	write('has ball?'),nl,read_list_from_user(L1),append([],[L1],Y),%Read the answer in a variance L1, store the answer in a list Y
	write('2 persons?'),nl,read_list_from_user(L2),append(Y,[L2],Z),%Read the answer in a variance L2, store the answer in a list Z
	write('use hands?'),nl,read_list_from_user(L3),append(Z,[L3],W),%Read the answer in a variance L3, store the answer in a list W
	write('use table?'),nl,read_list_from_user(L4),append(W,[L4],F),%Read the answer in a variance L4, store the answer in a list F
	show_result(F).

%start the game automatically. Delete it when do the trace.
:-start_game.




