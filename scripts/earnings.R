## UP TO DATE: 07/19
## MEDIAN EARNINGS -- FOR POPULATION 16 YEARS AND OVER WITH EARNINGS IN THE PAST 12 MONTHS

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

earnings <- read.csv("data/earnings.csv")

# Rurality Data
data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data,earnings,by = "FIPS")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

races <- c('','White.','Black.')

##############################################################
###################### GETTING NUMBERS #######################
##############################################################

sink("outputs/raw/earnings.csv")
for (counties in 1:5){
  cat("\n",county_names[counties],"\n")
  data <- fulldata[which(fulldata$FIPS %in% county_groups[[counties]]),]
  for (r in races){
    cat(r,",")
    mn <- weighted.median(as.numeric(as.character(data[[paste0(r,"Median.Earnings")]])),as.numeric(data$X2017),na.rm=TRUE)
    cat(mn,"\n") 
  }
  cat("\n\n")
}
sink()



