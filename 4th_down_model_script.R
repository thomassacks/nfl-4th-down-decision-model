install.packages("nflfastR")

library(dplyr)
library(nflfastR)
pbp_2024 <- load_pbp(2024)
head(pbp_2024)

fourth_downs <- pbp_2024 %>%
  filter(down == 4, 
         play_type %in% c("run", "pass", "punt", "field_goal"))

head(fourth_downs)

fourth_downs$go_for_it <- ifelse(fourth_downs$play_type %in% c("run", "pass"), 1, 0)

table(fourth_downs$go_for_it)

model <- glm(go_for_it ~ ydstogo + yardline_100 + half_seconds_remaining + score_differential,
             data = fourth_downs,
             family = "binomial")
summary(model)

fourth_downs$predicted_prob <- predict(model, type = "response")
head(fourth_downs$predicted_prob)

library(ggplot2)

ggplot(fourth_downs, aes(x = ydstogo, y = predicted_prob)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "loess") +
  labs(title = "Probability of Going for It on 4th Down",
       x = "Yards to Go",
       y = "Predicted Probability") +
  theme_minimal()

aggregate(predicted_prob ~ go_for_it, data = fourth_downs, mean)
