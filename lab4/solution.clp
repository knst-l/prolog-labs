(deftemplate user
   (slot activity)
   (slot budget)
   (slot social)
   (slot creativity)
   (slot place))

(deftemplate hobby
   (slot name)
   (slot activity)
   (slot budget)
   (slot social)
   (slot creativity)
   (slot place)
   (slot description)
   (slot examples)
   (slot first-step))

(deftemplate score
   (slot hobby)
   (slot value))

(deftemplate matched
   (slot hobby)
   (slot criterion)
   (slot points))

(deftemplate recommendation
   (slot hobby)
   (slot value))

(deftemplate printed-top-alternatives)

(deftemplate printed-other-options)

(deffacts knowledge-base
   (start)

   (hobby
      (name drawing)
      (activity low)
      (budget low)
      (social alone)
      (creativity yes)
      (place home)
      (description "calm creative hobby for home practice")
      (examples "pencil sketches, watercolor cards, digital drawing")
      (first-step "draw one simple object for 15 minutes"))

   (hobby
      (name running)
      (activity high)
      (budget low)
      (social alone)
      (creativity no)
      (place outside)
      (description "active outdoor hobby with simple equipment")
      (examples "park jogging, interval running, preparing for a 5 km run")
      (first-step "try a 20 minute walk and run session"))

   (hobby
      (name hiking)
      (activity high)
      (budget medium)
      (social alone)
      (creativity no)
      (place outside)
      (description "active outdoor hobby for independent walks and short trips")
      (examples "city walking routes, weekend forest walks, photo walks")
      (first-step "choose a safe one hour route near home"))

   (hobby
      (name home_workout)
      (activity high)
      (budget medium)
      (social alone)
      (creativity no)
      (place home)
      (description "active hobby for training at home")
      (examples "bodyweight exercises, stretching, dumbbell training")
      (first-step "make a 15 minute beginner workout plan"))

   (hobby
      (name board_games)
      (activity low)
      (budget medium)
      (social group)
      (creativity no)
      (place home)
      (description "calm social hobby for small groups")
      (examples "Carcassonne, Ticket to Ride, Codenames")
      (first-step "invite friends and choose one simple game"))

   (hobby
      (name volunteering)
      (activity medium)
      (budget low)
      (social group)
      (creativity no)
      (place outside)
      (description "social hobby with useful activity")
      (examples "event help, charity projects, city clean-up activities")
      (first-step "find one local volunteer event"))

   (hobby
      (name photography)
      (activity medium)
      (budget medium)
      (social alone)
      (creativity yes)
      (place outside)
      (description "creative hobby for walks and observation")
      (examples "street photography, nature photography, portrait practice")
      (first-step "take 10 photos on one topic"))

   (hobby
      (name blogging)
      (activity low)
      (budget medium)
      (social alone)
      (creativity yes)
      (place home)
      (description "creative home hobby for writing and sharing ideas")
      (examples "study notes, personal diary, reviews")
      (first-step "write a short post about one interesting topic"))

   (hobby
      (name programming)
      (activity low)
      (budget low)
      (social alone)
      (creativity no)
      (place home)
      (description "quiet home hobby for logic and problem solving")
      (examples "small scripts, web pages, puzzle solving")
      (first-step "make one small program for a daily task"))

   (hobby
      (name chess)
      (activity low)
      (budget low)
      (social group)
      (creativity no)
      (place home)
      (description "calm intellectual hobby for playing with other people")
      (examples "online chess, chess puzzles, friendly matches")
      (first-step "solve five beginner chess puzzles"))

   (hobby
      (name dancing)
      (activity high)
      (budget medium)
      (social group)
      (creativity yes)
      (place outside)
      (description "active social hobby with creative expression")
      (examples "social dancing, modern dance, dance classes")
      (first-step "learn one short beginner combination"))

   (hobby
      (name music)
      (activity medium)
      (budget medium)
      (social alone)
      (creativity yes)
      (place home)
      (description "creative hobby for home practice and self-expression")
      (examples "guitar, keyboard, vocal practice")
      (first-step "learn one simple song or exercise"))

   (hobby
      (name cooking)
      (activity medium)
      (budget medium)
      (social alone)
      (creativity yes)
      (place home)
      (description "practical creative hobby for home")
      (examples "simple baking, soups, quick dinners")
      (first-step "cook one new simple recipe"))

   (hobby
      (name yoga)
      (activity medium)
      (budget low)
      (social alone)
      (creativity no)
      (place home)
      (description "calm physical hobby that can be practiced at home")
      (examples "morning stretching, breathing exercises, beginner yoga")
      (first-step "try a 10 minute beginner session"))

   (hobby
      (name reading)
      (activity low)
      (budget low)
      (social alone)
      (creativity no)
      (place home)
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

(defrule create-score
   (declare (salience 90))
   (user)
   (hobby (name ?hobby))
   (not (score (hobby ?hobby)))
   =>
   (assert (score (hobby ?hobby) (value 0))))

(defrule score-activity
   (declare (salience 80))
   (user (activity ?activity))
   (hobby (name ?hobby) (activity ?activity))
   ?score <- (score (hobby ?hobby) (value ?value))
   (not (matched (hobby ?hobby) (criterion activity)))
   =>
   (modify ?score (value (+ ?value 3)))
   (assert (matched (hobby ?hobby) (criterion activity) (points 3))))

(defrule score-budget
   (declare (salience 80))
   (user (budget ?budget))
   (hobby (name ?hobby) (budget ?budget))
   ?score <- (score (hobby ?hobby) (value ?value))
   (not (matched (hobby ?hobby) (criterion budget)))
   =>
   (modify ?score (value (+ ?value 2)))
   (assert (matched (hobby ?hobby) (criterion budget) (points 2))))

(defrule score-social
   (declare (salience 80))
   (user (social ?social))
   (hobby (name ?hobby) (social ?social))
   ?score <- (score (hobby ?hobby) (value ?value))
   (not (matched (hobby ?hobby) (criterion social)))
   =>
   (modify ?score (value (+ ?value 2)))
   (assert (matched (hobby ?hobby) (criterion social) (points 2))))

(defrule score-creativity
   (declare (salience 80))
   (user (creativity ?creativity))
   (hobby (name ?hobby) (creativity ?creativity))
   ?score <- (score (hobby ?hobby) (value ?value))
   (not (matched (hobby ?hobby) (criterion creativity)))
   =>
   (modify ?score (value (+ ?value 2)))
   (assert (matched (hobby ?hobby) (criterion creativity) (points 2))))

(defrule score-place
   (declare (salience 80))
   (user (place ?place))
   (hobby (name ?hobby) (place ?place))
   ?score <- (score (hobby ?hobby) (value ?value))
   (not (matched (hobby ?hobby) (criterion place)))
   =>
   (modify ?score (value (+ ?value 2)))
   (assert (matched (hobby ?hobby) (criterion place) (points 2))))

(defrule choose-best-hobby
   (declare (salience 10))
   (score (hobby ?hobby) (value ?value))
   (not (score (value ?other&:(> ?other ?value))))
   (not (recommendation))
   =>
   (assert (recommendation (hobby ?hobby) (value ?value))))

(defrule print-recommendation
   (declare (salience -10))
   (recommendation (hobby ?hobby) (value ?value))
   (hobby
      (name ?hobby)
      (description ?description)
      (examples ?examples)
      (first-step ?step))
   =>
   (printout t crlf)
   (printout t "Recommended hobby: " ?hobby crlf)
   (printout t "Heuristic score: " ?value crlf)
   (printout t "Details: " ?description "." crlf)
   (printout t "Examples: " ?examples "." crlf)
   (printout t "First step: " ?step "." crlf)
   (printout t "Matched criteria:" crlf))

(defrule print-matched-criterion
   (declare (salience -20))
   (recommendation (hobby ?hobby))
   (matched
      (hobby ?hobby)
      (criterion ?criterion)
      (points ?points))
   =>
   (printout t "- " ?criterion ": +" ?points crlf))

(defrule print-top-alternatives-header
   (declare (salience -30))
   (recommendation)
   (not (printed-top-alternatives))
   =>
   (printout t crlf)
   (printout t "Also consider these close options:" crlf)
   (assert (printed-top-alternatives)))

(defrule print-top-alternative
   (declare (salience -40))
   (recommendation (hobby ?best))
   (score (hobby ?hobby&~?best) (value ?value&:(>= ?value 7)))
   (hobby
      (name ?hobby)
      (description ?description))
   =>
   (printout t "- " ?hobby " (score " ?value "): " ?description "." crlf))

(defrule print-other-options-header
   (declare (salience -50))
   (recommendation)
   (not (printed-other-options))
   =>
   (printout t crlf)
   (printout t "Other possible options:" crlf)
   (assert (printed-other-options)))

(defrule print-other-option
   (declare (salience -60))
   (recommendation (hobby ?best))
   (score (hobby ?hobby&~?best) (value ?value&:(< ?value 7)))
   (hobby
      (name ?hobby)
      (description ?description))
   =>
   (printout t "- " ?hobby " (score " ?value "): " ?description "." crlf))
