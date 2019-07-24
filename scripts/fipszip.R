setwd("~/git/brs_paper")
fipszip <- read.csv("data/fips_zip.csv")
fulldata <- read.csv("data/cleaned.csv")

source("scripts/gen_county_fips.R")
fipsandzip <- data.frame(fips=fipszip$GEOID[which(as.numeric(as.character(fipszip$GEOID)) %in% brs_counties)], zip=fipszip$ZCTA5[which(as.numeric(as.character(fipszip$GEOID)) %in% brs_counties)])
write.csv(fipsandzip,"data/fipsandziponly.csv")