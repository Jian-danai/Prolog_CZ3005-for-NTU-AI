male(jerry).
male(stuart).
male(warren).
male(peter).
female(kather).
female(maryalice).
female(ann).
brother(jerry,stuart).
brother(jerry,kather).
brother(peter, warren).

brother(stuart,jerry).
brother(stuart,kather).
brother(warren,peter).

sister(ann, mayalice).
sister(kather,jerry).

sister(maryalice,ann).
sister(kather,stuart).

parent_of(warren,jerry).
parent_of(maryalice,jerry).
parent_of(X,Y) :-
    (parent_of(X,Z),brother(Z,Y));
    (parent_of(X,Z),sister(Z,Y)).

mother(X,Y):-
    parent_of(X,Y),
    female(X).

father(X,Y):-
    parent_of(X,Y),
    male(X).
son(X,Y) :-
    parent_of(Y,X),
    male(X).

daughter(X,Y) :-
    parent_of(Y,X),
    female(X).

grandfather(X,Y) :-
    parent_of(X,Z),
    male(X),
    parent_of(Z,Y).

sibling(X,Y) :-
    brother(X,Y).
sibling(X,Y) :-
    sister(X,Y).

aunt(X,Y) :-
    sister(X,Z),
    parent_of(Z,Y).
aunt(X,Y) :-
    wife(X,W),
    brother(W,Z),
    parent_of(Z,Y).

uncle(X,Y) :-
    brother(X,Z),
    parent_of(Z,Y).
uncle(X,Y) :-
    husband(X,W),
    sister(W,Z),
    parent_of(Z,Y).

spouse(X,Y) :-
    parent_of(X,Z),
    parent_of(Y,Z),
    X\==Y.

wife(X,Y) :-
    spouse(X,Y),
    female(X).

husband(X,Y) :-
    spouse(X,Y),
    male(X).

cousin(X,Y) :-
    father(W,X),
    uncle(W,Y).
cousin(X,Y) :-
    mother(W,X),
    aunt(W,Y).







