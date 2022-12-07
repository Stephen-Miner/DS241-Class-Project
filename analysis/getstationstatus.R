#file that reads info about stations and writes to a csv
library(gbfs)
library(dplyr)

#change the file name when running on local machine
filename="C:/Users/vvexi/OneDrive/Documents/R Scripts/DS241-Class-Project/analysis"

station_status <- get_station_status("cabi") %>% 
  select(station_id, num_docks_available, num_docks_disabled, 
         num_bikes_available, num_ebikes_available, num_bikes_disabled) %>%
  mutate(total_bikes_available = num_bikes_available + num_docks_available  
         + num_ebikes_available - num_docks_disabled - num_bikes_disabled )

write.table(station_status, file=filename, append=TRUE, row.names = FALSE,
            col.names = FALSE, sep = ",")
