# Лабораторная работа 4

Тема:

Разработка экспертной системы.

Язык:

CLIPS.

Условие:

Разработать экспертную систему на языке CLIPS.

Выбранная предметная область:
подбор хобби по предпочтениям пользователя.

Экспертная система задает пользователю вопросы и анализирует предпочтения: уровень активности, бюджет, желание заниматься одному или в компании, интерес к творчеству и место занятий. На основе этих признаков система рекомендует подходящее хобби.

Файл с программой: solution.clp

Запуск:
(load "solution.clp")
(reset)
(run)

Пример ввода 1:
Activity level (low/medium/high): low
Budget (low/medium/high): low
Social format (alone/group): alone
Creativity (yes/no): yes
Place (home/outside): home

Результат:
Recommended hobby: drawing
Reason: creative hobby at home with low expenses.

Пример ввода 2:
Activity level (low/medium/high): high
Budget (low/medium/high): medium
Social format (alone/group): alone
Creativity (yes/no): no
Place (home/outside): outside

Результат:
Recommended hobby: hiking
Reason: active outdoor hobby suitable for independent walks and small trips.

Пример ввода 3:
Activity level (low/medium/high): low
Budget (low/medium/high): medium
Social format (alone/group): group
Creativity (yes/no): no
Place (home/outside): home

Результат:
Recommended hobby: board_games
Reason: calm hobby for spending time with other people.

Для проверки другого варианта нужно снова выполнить:
(reset)
(run)
