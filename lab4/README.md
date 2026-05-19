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

- факты с характеристиками хобби;
- описание каждого хобби;
- примеры конкретных занятий;
- первый шаг для начала занятия.

В системе реализован эвристический поиск в пространстве вариантов хобби. Каждое хобби рассматривается как кандидат. Система сравнивает признаки кандидата с ответами пользователя и начисляет баллы:

- совпадение уровня активности: +3;
- совпадение бюджета: +2;
- совпадение формата общения: +2;
- совпадение творческой направленности: +2;
- совпадение места занятий: +2.

Рекомендуется хобби с максимальной эвристической оценкой.

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
Heuristic score: 11
Details: calm creative hobby for home practice.
Examples: pencil sketches, watercolor cards, digital drawing.
First step: draw one simple object for 15 minutes.
Matched criteria:
- place: +2
- creativity: +2
- social: +2
- budget: +2
- activity: +3

Пример ввода 2:
Activity level (low/medium/high): high
Budget (low/medium/high): medium
Social format (alone/group): alone
Creativity (yes/no): no
Place (home/outside): outside

Результат:
Recommended hobby: hiking
Heuristic score: 11
Details: active outdoor hobby for independent walks and short trips.
Examples: city walking routes, weekend forest walks, photo walks.
First step: choose a safe one hour route near home.
Matched criteria:
- place: +2
- creativity: +2
- social: +2
- budget: +2
- activity: +3

Пример ввода 3:
Activity level (low/medium/high): low
Budget (low/medium/high): medium
Social format (alone/group): group
Creativity (yes/no): no
Place (home/outside): home

Результат:
Recommended hobby: board_games
Heuristic score: 11
Details: calm social hobby for small groups.
Examples: Carcassonne, Ticket to Ride, Codenames.
First step: invite friends and choose one simple game.
Matched criteria:
- place: +2
- creativity: +2
- social: +2
- budget: +2
- activity: +3

Для проверки другого варианта нужно снова выполнить:
(reset)
(run)
