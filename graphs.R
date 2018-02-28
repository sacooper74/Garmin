# playing with data viz

library(ggplot2)

# simple scatter plot
g <- ggplot(data=actvalues) + facet_grid(. ~ Activity.Type) + 
  geom_point(mapping = aes(x = date, y = Avg.Speed.Avg.Pace., size = Avg.HR, color = Elevation.Gain))
g

# Look into the relationship of strides per minute with performance
g <- ggplot(data = actvalues, mapping = aes(x = spm, y = Avg.Speed.Avg.Pace.)) +
  geom_point() +
  geom_smooth(aes(linetype = Activity.Type)) +
  labs(title = "Runs in 2016") + labs(x = "Strides per minute", y = "Pace (/km)")
g

# Open the png device
png(filename = "run.png", width = 480, height = 480, units = "px")

# smoothed line graph with overlayed raw data
g <- ggplot(data=actvalues) + 
  geom_point(mapping = aes(x = date, y = Avg.Speed.Avg.Pace., size = Distance, color = spm)) +
  geom_smooth(mapping = aes(x = date, y = Avg.Speed.Avg.Pace., linetype = Activity.Type)) + 
  labs(title = "Runs in 2016") + labs(x = "Date", y = "Pace (/km)") +
  scale_y_datetime(date_labels = "%M:%S")
g

# Close the png device
dev.off()

names(actvalues)
View(activities)
