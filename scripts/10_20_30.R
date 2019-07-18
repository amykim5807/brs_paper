### UP TO DATE: JULY 18TH


### 10-20-30 rule counties
library(pdftools)
library(tidyverse)

setwd("~/git/brs_paper")

pov_text <- pdf_text("data/persistentpoverty.pdf")
pov_data <- readr::read_lines(pov_text)

data <- grep("[0-9]{5}",pov_data[373:954], value=TRUE)

fips <- as.numeric(as.character(unlist(lapply(data,substring,first=15,last=19))))
brs <- read.csv("data/brs_final.csv")
brs_counties <- brs$FIPS
brs_pov <- fips[which(fips %in% brs_counties)]

rurality <- read.csv("data/ruralcodes.csv")
rurality$pop <- as.numeric(as.character(gsub("[^0-9.]","",rurality$Population_2010)))

## TOTAL POPULATION
pop <- sum(rurality$pop,na.rm=TRUE)
pov <- sum(rurality$pop[which(rurality$FIPS %in% fips)],na.rm=TRUE)


## BLACK RURAL SOUTH
bpop <- sum(rurality$pop[which(rurality$FIPS %in% brs_counties)],na.rm=TRUE)
bpov <- sum(rurality$pop[which(rurality$FIPS %in% brs_pov)],na.rm=TRUE)


brs_data <- data.frame(fips = brs_counties,county=brs$County_Name)
brs_data$pov <- brs_data$fips %in% fips
write.csv(brs_data,"outputs/10_20_30.csv")