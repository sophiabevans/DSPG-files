library(ggplot2)
library(dplyr)
library(readxl)
library(ggmap)
library(tidyr)
register_google(key = 'AIzaSyBsqd6lD_uRllA0FGY7IqbLUZ_wSzfx5jM')
locations <- read_excel('DSPG_locations.xlsx')
locations_df <- separate(locations, 'Coordinates', into = c('Lat', 'Long'), sep = ', ')
locations_sub <- locations_df[3:length(locations_df$Location),] #remove missing values
locations_sub <- as_tibble(locations_sub)
locations_sub$Lat <- as.numeric(locations_sub$Lat)
locations_sub$Long <- as.numeric(locations_sub$Long)
location_sub1 <- locations_sub %>% filter(Location == 'Rattlesnake' )

map <- get_googlemap(center = c(-121, 45), zoom = 8)
ggmap(map) + theme_bw() +
  geom_point(data = location_sub1, aes(x = Long, y = Lat, color = Location), 
             shape = 6, size = 3, stroke = 1)
