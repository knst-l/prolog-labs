(deftemplate user
   (slot activity)
   (slot budget)
   (slot social)
   (slot creativity)
   (slot place))

(deftemplate recommendation
   (slot hobby)
   (slot reason))

(deffacts start-data
   (start))

(defrule ask-preferences
   (start)
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

(defrule drawing
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
         (reason "creative hobby at home with low expenses"))))

(defrule running
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
         (reason "active outdoor hobby without expensive equipment"))))

(defrule hiking
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
         (reason "active outdoor hobby suitable for independent walks and small trips"))))

(defrule gym
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
         (reason "active hobby for training at home with simple equipment"))))

(defrule board_games
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
         (reason "calm hobby for spending time with other people"))))

(defrule volunteering
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
         (reason "social hobby for useful activity with other people"))))

(defrule photography
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
         (reason "creative hobby for walks and observation"))))

(defrule blogging
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
         (reason "creative home hobby for writing and sharing ideas"))))

(defrule programming
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
         (reason "quiet home hobby for logic and problem solving"))))

(defrule chess
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
         (reason "calm intellectual hobby for playing with other people"))))

(defrule dancing
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
         (reason "active and social hobby with creative expression"))))

(defrule music
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
         (reason "creative hobby for home practice and self-expression"))))

(defrule cooking
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
         (reason "practical creative hobby for home"))))

(defrule yoga
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
         (reason "calm physical hobby that can be practiced at home"))))

(defrule default_hobby
   (declare (salience 0))
   (user)
   (not (recommendation (hobby ?hobby)))
   =>
   (assert
      (recommendation
         (hobby reading)
         (reason "universal hobby with flexible time and low expenses"))))

(defrule print_recommendation
   (declare (salience -10))
   (recommendation
      (hobby ?hobby)
      (reason ?reason))
   =>
   (printout t "Recommended hobby: " ?hobby crlf)
   (printout t "Reason: " ?reason "." crlf))
