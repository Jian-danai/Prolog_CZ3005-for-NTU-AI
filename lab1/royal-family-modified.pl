male(charles).
male(andrew).
male(edward).
female(ann).
offspring(elizabeth,charles).
offspring(elizabeth,ann).
offspring(elizabeth,andrew).
offspring(elizabeth,edward).
queen(elizabeth).
age(charles,ann,andrew,edward).

prince(X) :-
    offspring(Y,X),
    queen(Y),
    male(X).

princess(X) :-
    offspring(Y,X),
    queen(Y),
    female(X).

throne(H) :-
    (age(X,Y,Z,W),
    (H=X;H=Y;H=Z;H=W),
    offspring(elizabeth,H)).
