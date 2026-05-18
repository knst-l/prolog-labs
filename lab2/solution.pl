merge([], L, L).
merge(L, [], L).
merge([X | T1], [Y | T2], [X | T]) :-
    X =< Y,
    merge(T1, [Y | T2], T).
merge([X | T1], [Y | T2], [Y | T]) :-
    X > Y,
    merge([X | T1], T2, T).
