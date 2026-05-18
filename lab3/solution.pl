road(irkutsk, angarsk, 45).
road(irkutsk, shelekhov, 20).
road(shelekhov, angarsk, 35).
road(angarsk, usolie, 50).
road(usolie, cheremhovo, 65).
road(angarsk, cheremhovo, 140).
road(irkutsk, sludyanka, 110).
road(sludyanka, kultuk, 15).
road(kultuk, baykalsk, 45).
road(sludyanka, baykalsk, 50).
road(irkutsk, baykalsk, 190).

route(X, Y, D) :- road(X, Y, D).
route(X, Y, D) :- road(Y, X, D).

path(Start, Finish, Path, Distance) :-
    travel(Start, Finish, [Start], ReversedPath, Distance),
    reverse_list(ReversedPath, Path).

travel(Finish, Finish, Path, Path, 0).
travel(Current, Finish, Visited, Path, Distance) :-
    route(Current, Next, D),
    not_in(Next, Visited),
    travel(Next, Finish, [Next | Visited], Path, RestDistance),
    Distance is D + RestDistance.

shortest_path(Start, Finish, Path, Distance) :-
    setof(D-P, path(Start, Finish, P, D), [Distance-Path | _]).

not_in(_, []).
not_in(X, [Y | T]) :-
    X \= Y,
    not_in(X, T).

reverse_list(L, R) :-
    reverse_list(L, [], R).

reverse_list([], R, R).
reverse_list([H | T], A, R) :-
    reverse_list(T, [H | A], R).
