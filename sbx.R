
# # may be useful to look at:
# # geom_density(alpha=.2, fill="#FF6666")

# Plot: We can see a direct relationship between Distance and Calories burned - via scatterplot
activities_tidy %>%
  ggplot(mapping = aes(Distance, Calories)) +
  #        facet_grid(. ~ `Activity Type`) +
  geom_point(mapping = aes(color = gain)) +
  geom_smooth(method = "lm", se = F) +
  geom_point(size = 7, colour = "black", alpha = 0.4) +
  geom_point(size = 5, colour = "red", alpha = 0.4) +
  #        geom_jitter() +
  labs(title = "Calories by Total Distance", y = "Calories", x = "Distance (km)")

# Plot: Relationship of Cadence and Pace
activities_tidy %>%
  ggplot(mapping = aes(Avg.Cadence, Avg.Pace)) +
  geom_point() +
  labs(title = "Runs") + labs(x = "Average Cadence (Strides per Minute)", y = "Pace (/km)") +
  geom_smooth()

# Plot: Evolution of Running Performance
activities_tidy %>%
  ggplot(mapping = aes(Date, Avg.Pace)) +
  geom_point(aes(color = Elev.Gain)) +
  geom_smooth()

# Plot: Ground Contact Time
activities_tidy %>%
  ggplot(aes(Date, Avg.Ground.Contact.Time)) +
  geom_point(aes(color = Avg.Cadence)) +
  geom_smooth()
