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

База знаний содержит:

- факты с описанием хобби, примерами занятий и первым шагом;
- продукционные правила, которые выбирают рекомендацию по предпочтениям пользователя.

Это продукционная экспертная система на правилах, а не задача эвристического поиска в графе.

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
Reason: you prefer a calm creative activity at home with a low budget.
Details: calm creative hobby for home practice.
Examples: pencil sketches, watercolor cards, digital drawing.
First step: draw one simple object for 15 minutes.

Пример ввода 2:
Activity level (low/medium/high): high
Budget (low/medium/high): medium
Social format (alone/group): alone
Creativity (yes/no): no
Place (home/outside): outside

Результат:
Recommended hobby: hiking
Reason: you prefer active outdoor activity that can be done independently.
Details: active outdoor hobby for independent walks and short trips.
Examples: city walking routes, weekend forest walks, photo walks.
First step: choose a safe one hour route near home.

Пример ввода 3:
Activity level (low/medium/high): low
Budget (low/medium/high): medium
Social format (alone/group): group
Creativity (yes/no): no
Place (home/outside): home

Результат:
Recommended hobby: board_games
Reason: you prefer a calm home activity with other people.
Details: calm social hobby for small groups.
Examples: Carcassonne, Ticket to Ride, Codenames.
First step: invite friends and choose one simple game.

Для проверки другого варианта нужно снова выполнить:
(reset)
(run)
