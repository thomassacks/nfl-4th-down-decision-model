# 🏈 4th Down Decision Modeling: Predicting Go-For-It Behavior in the NFL

---

## 📋 Introduction

In today's NFL, 4th down decisions can drastically influence game outcomes.  
With growing access to advanced data, teams are increasingly using analytics to guide whether to punt, kick, or attempt a conversion.

This project models the probability that a team chooses to **go for it** on 4th down based on situational factors like:
- Distance
- Field position
- Time remaining
- Score differential

---

## 📂 Data

- **Source:** `nflfastR` play-by-play data
- **Season:** 2024
- **Sample Size:** Approximately 4,000 4th down plays (filtered to real football actions: run, pass, punt, field goal)

---

## ⚙️ Methodology

- Pulled full 2024 NFL play-by-play data using `nflfastR` in RStudio.
- Filtered dataset to plays where:
  - `down == 4`
  - `play_type` was one of ("run", "pass", "punt", "field_goal")
- Created a binary outcome variable:
  - `1` = team went for it (run or pass)
  - `0` = team kicked or punted (punt or field goal)
- Built a **logistic regression model** using predictors:
  - `ydstogo` (yards to go for first down)
  - `yardline_100` (distance from end zone)
  - `half_seconds_remaining` (time left in game half)
  - `score_differential` (offensive team lead or deficit)
- Predicted the probability of going for it for each 4th down situation.

---

## 📈 Results

- Probability of going for it **increased sharply** as yards to go decreased.
- Field position and score differential also played major roles:
  - Teams trailing in score or deep in opponent territory were more aggressive.
- **Visual Output:**
  - Smooth probability curve showing likelihood of going for it vs. yards to go.
  - Real-world outliers (e.g., desperate 4th and 20 attempts) matched situational expectations.
  - *(See plot linked to this post)*

---

## 🚀 Next Steps

- Incorporate **Expected Points Added (EPA)** thresholds to refine not just decision occurrence, but decision quality.
- Build a **time-dependent model** (e.g., \"Should you go for it with only 2 minutes left in the 4th quarter?\")
- Expand across **multiple seasons** to identify coaching trends and strategy shifts.

---

## 📬 Contact

Feel free to reach out to connect or collaborate:

- 📧 Email: thomasbsacks@gmail.com
- 💼 LinkedIn: [Thomas Sacks](https://www.linkedin.com/in/thomas-sacks/)

