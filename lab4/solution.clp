(deftemplate user
   (slot activity)
   (slot budget)
   (slot social)
   (slot creativity)
   (slot place))

(deftemplate hobby-info
   (slot name)
   (slot description)
   (slot examples)
   (slot first-step))

(deftemplate recommendation
   (slot hobby)
   (slot reason))

(deffacts knowledge-base
   (start)

   (hobby-info
      (name drawing)
      (description "calm creative hobby for home practice")
      (examples "pencil sketches, watercolor cards, digital drawing")
      (first-step "draw one simple object for 15 minutes"))

   (hobby-info
      (name running)
      (description "active outdoor hobby with simple equipment")
      (examples "park jogging, interval running, preparing for a 5 km run")
      (first-step "try a 20 minute walk and run session"))

   (hobby-info
      (name hiking)
      (description "active outdoor hobby for independent walks and short trips")
      (examples "city walking routes, weekend forest walks, photo walks")
      (first-step "choose a safe one hour route near home"))

   (hobby-info
      (name home_workout)
      (description "active hobby for training at home")
      (examples "bodyweight exercises, stretching, dumbbell training")
      (first-step "make a 15 minute beginner workout plan"))

   (hobby-info
      (name board_games)
      (description "calm social hobby for small groups")
      (examples "Carcassonne, Ticket to Ride, Codenames")
      (first-step "invite friends and choose one simple game"))

   (hobby-info
      (name volunteering)
      (description "social hobby with useful activity")
      (examples "event help, charity projects, city clean-up activities")
      (first-step "find one local volunteer event"))

   (hobby-info
      (name photography)
      (description "creative hobby for walks and observation")
      (examples "street photography, nature photography, portrait practice")
      (first-step "take 10 photos on one topic"))

   (hobby-info
      (name blogging)
      (description "creative home hobby for writing and sharing ideas")
      (examples "study notes, personal diary, reviews")
      (first-step "write a short post about one interesting topic"))

   (hobby-info
      (name programming)
      (description "quiet home hobby for logic and problem solving")
      (examples "small scripts, web pages, puzzle solving")
      (first-step "make one small program for a daily task"))

   (hobby-info
      (name chess)
      (description "calm intellectual hobby for playing with other people")
      (examples "online chess, chess puzzles, friendly matches")
      (first-step "solve five beginner chess puzzles"))

   (hobby-info
      (name dancing)
      (description "active social hobby with creative expression")
      (examples "social dancing, modern dance, dance classes")
      (first-step "learn one short beginner combination"))

   (hobby-info
      (name music)
      (description "creative hobby for home practice and self-expression")
      (examples "guitar, keyboard, vocal practice")
      (first-step "learn one simple song or exercise"))

   (hobby-info
      (name cooking)
      (description "practical creative hobby for home")
      (examples "simple baking, soups, quick dinners")
      (first-step "cook one new simple recipe"))

   (hobby-info
      (name yoga)
      (description "calm physical hobby that can be practiced at home")
      (examples "morning stretching, breathing exercises, beginner yoga")
      (first-step "try a 10 minute beginner session"))

   (hobby-info
      (name reading)
      (description "universal hobby with flexible time and low expenses")
      (examples "short stories, popular science, fiction")
      (first-step "choose one short book or article")))

(defrule ask-preferences
   (declare (salience 100))
   (start)
   (not (user))
   =>
   (printout t "Activity level (low/medium/high): ")
   (bind ?activity (read))
   (printout t "Budget (low/medium/high): ")
   (bind ?budget (read))
   (printout t "Social format (alone/group): ")
   (bind ?social (read))
   (printout t "Creativity (yes/no): ")
   (bind ?creativity (read))
   (printout t "Place (home/outside): ")
   (bind ?place (read))
   (assert
      (user
         (activity ?activity)
         (budget ?budget)
         (social ?social)
         (creativity ?creativity)
         (place ?place))))

(defrule recommend-drawing
   (declare (salience 30))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity low)
      (budget low)
      (creativity yes)
      (place home))
   =>
   (assert
      (recommendation
         (hobby drawing)
         (reason "you prefer a calm creative activity at home with a low budget"))))

(defrule recommend-running
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity high)
      (budget low)
      (place outside))
   =>
   (assert
      (recommendation
         (hobby running)
         (reason "you want a high activity level outside without expensive equipment"))))

(defrule recommend-hiking
   (declare (salience 30))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity high)
      (budget medium)
      (social alone)
      (place outside))
   =>
   (assert
      (recommendation
         (hobby hiking)
         (reason "you prefer active outdoor activity that can be done independently"))))

(defrule recommend-home-workout
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity high)
      (budget medium)
      (place home))
   =>
   (assert
      (recommendation
         (hobby home_workout)
         (reason "you want high physical activity but prefer staying at home"))))

(defrule recommend-board-games
   (declare (salience 30))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity low)
      (social group)
      (place home))
   =>
   (assert
      (recommendation
         (hobby board_games)
         (reason "you prefer a calm home activity with other people"))))

(defrule recommend-volunteering
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (social group)
      (place outside)
      (creativity no))
   =>
   (assert
      (recommendation
         (hobby volunteering)
         (reason "you prefer useful outdoor activity with a group"))))

(defrule recommend-photography
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity medium)
      (budget medium)
      (creativity yes)
      (place outside))
   =>
   (assert
      (recommendation
         (hobby photography)
         (reason "you combine creativity, walking, and a medium budget"))))

(defrule recommend-blogging
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity low)
      (creativity yes)
      (social alone)
      (place home))
   =>
   (assert
      (recommendation
         (hobby blogging)
         (reason "you prefer a calm individual creative activity at home"))))

(defrule recommend-programming
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity low)
      (social alone)
      (place home)
      (creativity no))
   =>
   (assert
      (recommendation
         (hobby programming)
         (reason "you prefer an individual home activity based on logic"))))

(defrule recommend-chess
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity low)
      (social group)
      (creativity no)
      (place home))
   =>
   (assert
      (recommendation
         (hobby chess)
         (reason "you prefer a calm intellectual activity with other people"))))

(defrule recommend-dancing
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity high)
      (social group)
      (creativity yes))
   =>
   (assert
      (recommendation
         (hobby dancing)
         (reason "you combine high activity, creativity, and social format"))))

(defrule recommend-music
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (budget medium)
      (creativity yes)
      (place home))
   =>
   (assert
      (recommendation
         (hobby music)
         (reason "you want a creative home hobby and have a medium budget"))))

(defrule recommend-cooking
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity medium)
      (place home)
      (creativity yes))
   =>
   (assert
      (recommendation
         (hobby cooking)
         (reason "you prefer a practical creative activity at home"))))

(defrule recommend-yoga
   (declare (salience 20))
   (not (recommendation (hobby ?hobby)))
   (user
      (activity medium)
      (budget low)
      (social alone)
      (place home))
   =>
   (assert
      (recommendation
         (hobby yoga)
         (reason "you want moderate activity alone at home with a low budget"))))

(defrule recommend-reading
   (declare (salience 0))
   (user)
   (not (recommendation (hobby ?hobby)))
   =>
   (assert
      (recommendation
         (hobby reading)
         (reason "no narrow rule was selected, so the system chooses a universal flexible hobby"))))

(defrule print-recommendation
   (declare (salience -10))
   (recommendation
      (hobby ?hobby)
      (reason ?reason))
   (hobby-info
      (name ?hobby)
      (description ?description)
      (examples ?examples)
      (first-step ?step))
   =>
   (printout t crlf)
   (printout t "Recommended hobby: " ?hobby crlf)
   (printout t "Reason: " ?reason "." crlf)
   (printout t "Details: " ?description "." crlf)
   (printout t "Examples: " ?examples "." crlf)
   (printout t "First step: " ?step "." crlf))
