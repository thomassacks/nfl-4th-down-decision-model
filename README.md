4th Down Decision Modeling: Predicting Go-For-It Behavior in the NFL


Introduction:

In today's NFL, 4th down decisions can drastically influence game outcomes. With growing access to advanced data, teams are increasingly using analytics to guide whether to punt, kick, or attempt a conversion.
This project models the probability that a team chooses to "go for it" on 4th down based on situational factors like distance, field position, time remaining, and score differential.


Data:

Source: nflfastR play-by-play data.

Season: 2024 

Sample Size: Approximately 4000 4th down plays filtered to real football actions (run, pass, punt, field goal).

Methodology:

Pulled full NFL 2023 play-by-play data using nflfastR in RStudio.

Filtered dataset to plays where down == 4 and play_type was one of ("run", "pass", "punt", "field_goal").

Created a binary outcome variable:

1 = team went for it (run or pass)

0 = team kicked or punted (punt or field goal)

Built a logistic regression model with predictors:

ydstogo (yards to go for first down)

yardline_100 (distance from end zone)

half_seconds_remaining (time left in game half)

score_differential (offensive team lead or deficit)

Predicted the probability of going for it for each 4th down situation.


Results:

As expected, the probability of going for it increased sharply as yards to go decreased.

Field position and score differential also played significant roles:

Teams behind in score or deep in opponent territory were more aggressive.

Visual Output:

A smooth probability curve showing likelihood of going for it vs. yards to go.

Real-world outliers (e.g., desperate 4th and 20 attempts) matched situational expectations.

(See plot linked to this post)


Next Steps:

Incorporate Expected Points Added (EPA) thresholds to refine decision quality, not just decision occurrence.

Build a time-dependent model (e.g., "Should you go for it if only 2 minutes left in 4th quarter?")

Expand model across multiple seasons to identify coaching trends.


Contact:


Feel free to reach out to connect or collaborate:
Email | thomasbsacks@gmail.com
LinkedIn | https://www.linkedin.com/in/thomas-sacks/