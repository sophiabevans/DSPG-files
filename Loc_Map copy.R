library(ggplot2)
library(dplyr)
library(readxl)
library(ggmap)
library(tidyr)
register_google(key = '') #Google doesn't want my key public
locations <- read_excel('DSPG_locations.xlsx')
locations_df <- separate(locations, 'Coordinates', into = c('Lat', 'Long'), sep = ', ')
locations_sub <- locations_df[3:length(locations_df$Location),] #remove missing values
locations_sub <- as_tibble(locations_sub)
locations_sub$Lat <- as.numeric(locations_sub$Lat)
locations_sub$Long <- as.numeric(locations_sub$Long)

locations_sub2 <- locations_sub[7:9,]

my_colors <- c(hcl.colors(5, 'Red-Blue'), hcl.colors(5, 'Cold'), 
               hcl.colors(6, 'Purple-Orange'), hcl.colors(5, 'Pink Yl'), hcl.colors(6, 'Lajolla'), hcl.colors(5, 'Grays'))

map <- get_googlemap(center = c(-121, 45), zoom = 8)
#All Locations
ggmap(map) + theme_bw() +
  geom_point(data = locations_sub, aes(x = Long, y = Lat, color = Location), 
             shape = 6, size = 4, stroke = 1) + 
  scale_color_manual(values = my_colors) +
  labs(x = 'Longitude', y = 'Latitude')

#Biggs, Culver, Madras Map
ggmap(map) + theme_bw() +
  geom_point(data = locations_sub2, aes(x = Long, y = Lat, color = Location), 
             shape = 6, size = 5, stroke = 1) + 
  labs(title = 'Biggs, Culver, Madras', x = 'Longitude', y = 'Latitude') + 
  ylim(44.25, 45.75) + xlim(-122, -120)



