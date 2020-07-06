library(ggplot2)
library(lubridate)
#import datasets
Desch_chinook <- read.csv('Deschutes_fall_chinook.csv')
Desch_steelhead <- read.csv('Deschutes_summer_steelhead.csv')
JohnDay_chinook <- read.csv('JohnDay_spring_chinook.csv')
Klickitat_chinook <- read.csv('Klickitat_fall_spring_chinook.csv')
Klickitat_steelhead <- read.csv('Klickitat_summer_and_winter_steelhead.csv')
Umatilla_chinook <- read.csv('Umatilla_fall_spring_chinook.csv')
Umatilla_steelhead <- read.csv('Umatilla_summer_steelhead.csv')
WhiteSalmon_chinook <- read.csv('WhiteSalmon_fall_chinook.csv')
#subset datasets
Desch_chinook <- subset(Desch_chinook, select = c('LocationID', 'StreamName', 'StreamAndTribNames',
                                         'RiverMiles', 'Species', 'Run', 'BeginDate', 'EndDate', 'Stage', 
                                         'Years', 'CountValue', 'CountDate', 'DataEntry'))

Desch_steelhead <- subset(Desch_steelhead, select = c('LocationID', 'StreamName', 'StreamAndTribNames',
                                                  'RiverMiles', 'Species', 'Run', 'BeginDate', 'EndDate', 'Stage', 
                                                  'Years', 'CountValue', 'CountDate', 'DataEntry'))

JohnDay_chinook <- subset(JohnDay_chinook, select = c('LocationID', 'StreamName', 'StreamAndTribNames',
                                                  'RiverMiles', 'Species', 'Run', 'BeginDate', 'EndDate', 'Stage', 
                                                  'Years', 'CountValue', 'CountDate', 'DataEntry'))

Klickitat_chinook <- subset(Klickitat_chinook, select = c('LocationID', 'StreamName', 'StreamAndTribNames',
                                                  'RiverMiles', 'Species', 'Run', 'BeginDate', 'EndDate', 'Stage', 
                                                  'Years', 'CountValue', 'CountDate', 'DataEntry'))

Klickitat_steelhead <- subset(Klickitat_steelhead, select = c('LocationID', 'StreamName', 'StreamAndTribNames',
                                                  'RiverMiles', 'Species', 'Run', 'BeginDate', 'EndDate', 'Stage', 
                                                  'Years', 'CountValue', 'CountDate', 'DataEntry'))

Umatilla_chinook <- subset(Umatilla_chinook, select = c('LocationID', 'StreamName', 'StreamAndTribNames',
                                                  'RiverMiles', 'Species', 'Run', 'BeginDate', 'EndDate', 'Stage', 
                                                  'Years', 'CountValue', 'CountDate', 'DataEntry'))

Umatilla_steelhead <- subset(Umatilla_steelhead, select = c('LocationID', 'StreamName', 'StreamAndTribNames',
                                                  'RiverMiles', 'Species', 'Run', 'BeginDate', 'EndDate', 'Stage', 
                                                  'Years', 'CountValue', 'CountDate', 'DataEntry'))

WhiteSalmon_chinook <- subset(WhiteSalmon_chinook, select = c('LocationID', 'StreamName', 'StreamAndTribNames',
                                                  'RiverMiles', 'Species', 'Run', 'BeginDate', 'EndDate', 'Stage', 
                                                  'Years', 'CountValue', 'CountDate', 'DataEntry'))

#combine data sets, make dates datetime
chinook <- rbind(Desch_chinook, JohnDay_chinook, Klickitat_chinook, Umatilla_chinook, WhiteSalmon_chinook)
chinook$BeginDate <- lubridate::ymd(chinook$BeginDate)
chinook$EndDate <- lubridate::ymd(chinook$EndDate)
steelhead <- rbind(Desch_steelhead, Klickitat_steelhead, Umatilla_steelhead)
steelhead$BeginDate <- lubridate::ymd(steelhead$BeginDate)
steelhead$EndDate <- lubridate::ymd(steelhead$EndDate)

#CHINOOK Graph
ggplot() + 
  geom_line(data = chinook, aes(x = BeginDate, y = CountValue, color = StreamName)) + theme_bw() +
  labs(title = 'Chinook Counts')

#STEELHEAD Graph
ggplot() + 
  geom_line(data = steelhead, aes(x = BeginDate, y = CountValue, color = StreamName)) + theme_bw() +
  labs(title = 'Steelhead Counts')
