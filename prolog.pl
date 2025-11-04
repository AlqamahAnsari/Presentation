% family.pl: Sample facts and rules for learning Prolog
parent(john, mary).
parent(john, tom).
parent(susan, tom).
male(john).
female(mary).
female(susan).
mother(X, Y) :-
  female(X),
  parent(X, Y).

father(X, Y) :-
  male(X),
  parent(X, Y).

sibling(X, Y) :-
  parent(Z, X),
  parent(Z, Y),
  X \= Y.