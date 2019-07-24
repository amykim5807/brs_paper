### UP TO DATE: JULY 22ND

### 10-20-30 rule counties
library(pdftools)
library(tidyverse)

setwd("~/git/brs_paper")

pov_text <- pdf_text("data/persistentpoverty.pdf")
pov_data <- readr::read_lines(pov_text)

pov_data <- grep("[0-9]{5}",pov_data[373:954], value=TRUE)

fips <- as.numeric(as.character(unlist(lapply(data,substring,first=15,last=19))))
fulldata <- read.csv("data/cleaned.csv")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

brs_pov <- fips[which(fips %in% brs_counties)]

## TOTAL POPULATION
pop <- sum(fulldata$X2017,na.rm=TRUE)
pov <- sum(fulldata$X2017[which(fulldata$FIPS %in% fips)],na.rm=TRUE)


## BLACK RURAL SOUTH
bpop <- sum(fulldata$X2017[which(fulldata$FIPS %in% brs_counties)],na.rm=TRUE)
bpov <- sum(fulldata$X2017[which(fulldata$FIPS %in% brs_pov)],na.rm=TRUE)


## HBCUS
### HBCUs in Black Rural Counties ###
fips_zip <- read.csv("data/fipsandziponly.csv")
zips <- unique(fips_zip$zip)

hbcus <- read.csv("data/hbcu.csv")
inst <- as.character(hbcus$Institution[which(as.numeric(as.character(hbcus$Zip)) %in% zips)])
hbcu_zip <- as.numeric(as.character(hbcus$Zip[which(as.numeric(as.character(hbcus$Zip)) %in% zips)]))

all_inst <- as.character(hbcus$Institution)
all_zips <- as.numeric(as.character(hbcus$Zip))

## EXTENDING VECTORS
l = length(brs_counties) + length(all_inst)
length(brs_counties) = l
county_names <- fulldata$county[which(fulldata$FIPS %in% brs_counties)]
length(county_names) = l
pctblack <- fulldata$pctblack[which(fulldata$FIPS %in% brs_counties)]
length(pctblack) = l
all_inst <- c(rep(NA,l-length(all_inst)),all_inst)
all_zips <- c(rep(NA,l-length(all_zips)),all_zips)

## OUTPUTTING DATA
brs_data <- data.frame(fips = brs_counties,county=county_names,pctblack=pctblack,hbcus=all_inst,hbcuzip = all_zips)
brs_data$pov <- brs_data$fips %in% fips
write.csv(brs_data,"outputs/tableau.csv")


