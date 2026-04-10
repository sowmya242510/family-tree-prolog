% =====================================
% FAMILY TREE PROGRAM IN PROLOG
% =====================================

% ----------- FACTS -----------

% Parent relationships
parent(john, mary).
parent(john, mike).
parent(susan, mary).
parent(susan, mike).

parent(mary, anna).
parent(mary, tom).

parent(mike, lisa).
parent(mike, david).

% Gender
male(john).
male(mike).
male(tom).
male(david).

female(susan).
female(mary).
female(anna).
female(lisa).

% ----------- RULES -----------

% Child relationship
child(X, Y) :- parent(Y, X).

% Grandparent relationship
grandparent(X, Y) :- 
    parent(X, Z),
    parent(Z, Y).

% Sibling relationship
sibling(X, Y) :- 
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Cousin relationship
cousin(X, Y) :- 
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% Descendant (Recursive)
descendant(X, Y) :- 
    parent(Y, X).

descendant(X, Y) :- 
    parent(Z, X),
    descendant(Z, Y).

% ----------- SAMPLE QUERIES (for reference) -----------

% Run these in SWISH query box:

% parent(john, X).
% sibling(mary, X).
% grandparent(john, X).
% cousin(anna, X).
% descendant(X, john).