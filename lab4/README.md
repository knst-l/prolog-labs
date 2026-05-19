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
После основной рекомендации система также выводит близкие альтернативы и остальные возможные варианты.

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

Also consider these close options:
- reading (score 9): universal hobby with flexible time and low expenses.
- chess (score 7): calm intellectual hobby for playing with other people.
- blogging (score 9): creative home hobby for writing and sharing ideas.
- programming (score 9): quiet home hobby for logic and problem solving.

Other possible options:
- yoga (score 6): calm physical hobby that can be practiced at home.
- cooking (score 6): practical creative hobby for home.
- hiking (score 2): active outdoor hobby for independent walks and short trips.
...

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

Also consider these close options:
- dancing (score 7): active social hobby with creative expression.
- home_workout (score 7): active hobby for training at home.
- running (score 9): active outdoor hobby with simple equipment.

Other possible options:
- reading (score 4): universal hobby with flexible time and low expenses.
- volunteering (score 4): social hobby with useful activity.
...

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

Also consider these close options:
- reading (score 7): universal hobby with flexible time and low expenses.
- chess (score 9): calm intellectual hobby for playing with other people.
- programming (score 7): quiet home hobby for logic and problem solving.
- blogging (score 7): creative home hobby for writing and sharing ideas.

Other possible options:
- drawing (score 7): calm creative hobby for home practice.
- yoga (score 4): calm physical hobby that can be practiced at home.
...

Для проверки другого варианта нужно снова выполнить:
(reset)
(run)
