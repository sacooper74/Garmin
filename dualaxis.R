https://github.com/hadley/ggplot2/wiki/Align-two-plots-on-a-page

distance <- actvalues[,c(7,21)]
distance$group <- "a"
pace <- actvalues[,c(10,21)]
pace$group <- "b"
d <- rbind(distance, pace)
pace

g <- ggplot(data=d, mapping = aes(date, Avg.Speed.Avg.Pace.)) + 
  facet_grid(group~., scale="free") + 
  geom_line(data = d1, stat = "identity") +
  geom_line(data = d2, stat = "identity")
g