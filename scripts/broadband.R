## UP-TO-DATE: 07/22
## BROADBAND DATA

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

broadband <- read.csv("data/broadband.csv")

data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data,broadband)

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

races <- c('Total.','White.','Black.')
comps <- c('without.Computer','without.Internet.Subscription','with.Dial.up.Only','with.Broadband.Internet')

##############################################################
###################### GETTING NUMBERS #######################
##############################################################

sink("outputs/raw/broadband.csv")
for (counties in 1:5){
  cat("\n",county_names[counties],"\n")
  data <- fulldata[which(fulldata$FIPS %in% county_groups[[counties]]),]
  for (r in races){
    cat(r,"\n")
    for (c in comps){
      cat(c,", ")
      tot <- sum(data[[paste0(r,"Population")]],na.rm=TRUE)
      comp <- sum(data[[paste0(r,c)]],na.rm=TRUE)
      cat(comp/tot,"\n")
    }
  }
  cat("\n\n")
}
sink()