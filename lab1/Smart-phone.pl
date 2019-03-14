competitor(apply,sumSum).
competitor(X,Y):- competitor(Y,X).

steal(stevey,gS).
boss(stevey,apply).

rival(Y,X):- competitor(Y,X).
tech(sumSum,gS).
business(X,Y) :- tech(X,Y).

unethical(X) :-
    boss(X,Z),
    steal(X,A),
    business(Y,A),
    rival(Z,Y).
