male(ybj).
male(ysk).
male(y1).
male(y1_y1).
male(l1).
male(fol).
male(y2h).
male(gfy).
male(y2_y1).
female(lyz).
female(yly).
female(y1_y2).
female(moy).
female(y2).
female(y1w).
female(l1w).
female(mol).
female(l1_l1).
brother(ybj,yly).
brother(ysk,y1).
brother(y1,ysk).
brother(y1_y1,y1_y2).
brother(l1,lyz).
brother(ysk,y2).
brother(y1,y2).
sister(y2,y1).
sister(yly,ybj).
sister(y1_y2,y1_y1).
sister(lyz,l1).
sister(y2,ysk).
parent_of(y2,y2_y1).
parent_of(y2h,y2_y1).
parent_of(gfy,ysk).
parent_of(gfy,y1).
parent_of(gfy,y2).
parent_of(ysk,ybj).
parent_of(lyz,ybj).
parent_of(ysk,yly).
parent_of(lyz,yly).
parent_of(y1,y1_y1).
parent_of(y1w,y1_y1).
parent_of(y1,y1_y2).
parent_of(y1w,y1_y2).
parent_of(moy,ysk).
parent_of(moy,y1).
parent_of(moy,y2).
parent_of(fol,l1).
parent_of(fol,lyz).
parent_of(mol,lyz).
parent_of(mol,l1).
parent_of(l1,l1_l1).
parent_of(l1w,l1_l1).

father(X,Y) :-
    parent_of(X,Y),
    male(X).

mother(X,Y) :-
    parent_of(X,Y),
    female(X).

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
    parent_of(Z,Y),
    brother(X,Z).
uncle(X,Y) :-
    parent_of(Z,Y),
    sister(W,Z),
    husband(X,W).

spouse(X,Y) :-
    parent_of(X,Z),
    parent_of(Y,Z),
    X\=Y.

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










