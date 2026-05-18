dog(flash).
dog(rover).

cat(bootsy).

horse(star).

color(flash, black).
color(bootsy, brown).
color(rover, red).
color(star, white).

pet(X) :- dog(X).
pet(X) :- cat(X).

animal(X) :- pet(X).
animal(X) :- horse(X).

owner(tom, X) :- dog(X), color(X, C), C \= black.

owner(kate, X) :- horse(X).
owner(kate, X) :- color(X, black).
