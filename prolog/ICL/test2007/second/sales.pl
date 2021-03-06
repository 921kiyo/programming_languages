% supplier, item, price
sellsFor('Peter Jones', swan123, 28).
sellsFor('Peter Jones', electrolux214, 27).
sellsFor('Peter Jones', hoover02, 60).
sellsFor('Peter Jones', electrolux09, 70).
sellsFor('Harrods', electrolux214, 31).
sellsFor('Harrods', swan123, 30).
sellsFor('Harrods', hoover02, 65).
sellsFor('Harrods', electrolux09, 80).

% supplier has item in stock
inStock('Peter Jones', electrolux214).
inStock('Peter Jones', hoover02).
inStock('Peter Jones', electrolux09).
inStock('Harrods', swan123).
inStock('Harrods', electrolux09).

% supplier located in city
locatedIn('Peter Jones', london).
locatedIn('Harrods', london).

% type of item
typeOfItem(swan123, electricKettle).
typeOfItem(electrolux214, electricKettle).
typeOfItem(hoover02, vacuum_cleaner).
typeOfItem(electrolux09, vacuum_cleaner).

% equivalent
equivalentItems(electrolux214, swan123).
equivalentItems(electrolux09, hoover02).

forall(C1,C2) :-
    \+ ((C1, \+C2)).

% Question 1

sellsOneForLessThan(T, MP, S, I, P):-
  typeOfItem(I, T),
  sellsFor(S, I, P),
  P < MP.

% Question 2
equivalent(I1,I2):-
  equivalentItems(I1, I2);equivalentItems(I2, I1).

sellsEquivalentItemIn(I, C, I, S):-
  locatedIn(S, C),
  inStock(S, I).

sellsEquivalentItemIn(I, C, EI, S):-
  locatedIn(S, C),
  \+(inStock(S, I)),
  equivalent(I, EI),
  sellsFor(S, I, P1),
  sellsFor(S, EI, P2),
  P2 =< P1.

neverUnderSold(S,C):-
  locatedIn(S,C),
  forall(sellsFor(S, I, P1), \+((locatedIn(S1,C),sellsFor(S1, I, P2), P2 < P1))).

listOfSuppliersFor(I,C,L):-
  setof((P,S), (locatedIn(S, C), sellsFor(S, I, P)), L).
