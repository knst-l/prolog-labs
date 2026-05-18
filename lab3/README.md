# Лабораторная работа 3

Тема:

Эвристический поиск решения в графе пространства состояний.

Условие:

Реализовать поиск кратчайшего пути в графе.

В программе задан граф дорог между городами. Каждая дорога имеет длину. Необходимо найти маршрут между двумя городами и определить его общую длину.

Файл с программой: solution.pl

Запрос:
shortest_path(irkutsk, cheremhovo, Path, Distance).

Результат:
Path = [irkutsk, angarsk, usolie, cheremhovo],
Distance = 160.

Запрос:
shortest_path(irkutsk, baykalsk, Path, Distance).

Результат:
Path = [irkutsk, sludyanka, baykalsk],
Distance = 160.

Запрос:
path(irkutsk, cheremhovo, [irkutsk, angarsk, usolie, cheremhovo], Distance).

Результат:
Distance = 160.

Запрос:
route(angarsk, irkutsk, Distance).

Результат:
Distance = 45.
