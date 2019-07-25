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

# Emp data
emp <- read.csv("data/emp.csv")

fulldata <- merge(fulldata, emp, by="FIPS")
whiteearnings <- fulldata$White.Median.Earnings
blackearnings <- fulldata$Black.Median.Earnings
earnings <- fulldata$Median.Earnings

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

races <- c('','white','black')

##############################################################
###################### GETTING NUMBERS #######################
##############################################################

sink("outputs/raw/earnings.csv")
for (counties in 1:5){
  cat("\n",county_names[counties],"\n")
  data <- fulldata[which(fulldata$FIPS %in% county_groups[[counties]]),]
  for (r in races){
    cat(r,",")
    mn <- weighted.median(as.numeric(as.character(data[[paste0(r,"earnings")]])),as.numeric(as.character(data[[paste0("pop16",r)]])),na.rm=TRUE)
    cat(mn,"\n") 
  }
  cat("\n\n")
}
sink()



