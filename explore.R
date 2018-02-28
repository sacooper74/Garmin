
# libraries
library(tidyverse)
library(ggcorrplot)
library(forecast)
library(tseries)


## FORECAST
# Create a dataset
road_data <- select(road_tidy, Date, `Avg Pace`)

# Simple plot of the series
# My pace drops off during winter lull period, but this season seems to be continue to improve
ggplot(road_tidy, aes(Date, `Avg Pace`)) +
        geom_point(aes(color = gain)) +
        scale_x_datetime(date_breaks = "3 month", date_labels = "%b %Y") +
        geom_smooth()

# Clean the noise
# count_ts <- ts(road_data[,c('cnt')])

# Smooth fluctuations further with a moving average
road_data$cnt_ma = ma(road_data$`Avg Pace`, order=7)
road_data$cnt_ma30 = ma(road_data$`Avg Pace`, order=30)
ggplot() +
        geom_line(data = road_data, aes(x = Date, y = `Avg Pace`, colour = "Avg Pace")) +
        geom_line(data = road_data, aes(x = Date, y = cnt_ma,   colour = "Weekly Moving Average"))  +
        geom_line(data = road_data, aes(x = Date, y = cnt_ma30, colour = "Monthly Moving Average"))  +
        ylab('Avg Pace')

# For the sake of simplicity, we'll model the smoothed weekly moving average
# Decompose data
count_ma = ts(na.omit(road_data$cnt_ma), frequency=30)
decomp = stl(count_ma, s.window="periodic")
deseasonal_cnt <- seasadj(decomp)
plot(decomp)

# Test for Stationarity
adf.test(count_ma, alternative = "stationary")

# Autocorrelations and choosing model order
Acf(count_ma, main='')
Pacf(count_ma, main='')

###################################

# histograms: http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html#Histogram
# forecast: https://www.datascience.com/blog/introduction-to-forecasting-with-arima-in-r-learn-data-science-tutorials
