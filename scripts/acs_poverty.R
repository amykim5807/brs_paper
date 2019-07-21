## UP TO DATE: 07/19
## ACS Poverty by Race and Deep Poverty

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

pov <- read.csv("data/acs_poverty.csv")

data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data,pov,by = "FIPS")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

races <- c('','White..not.Hispanic..','Black.')


##############################################################
###################### GETTING NUMBERS #######################
##############################################################
allcountygroups <- append(county_groups,white)
allcountynames <- c(county_names,whitenames)

sink("outputs/raw/acs_poverty.csv")
for (counties in 1:9){
  cat("\n",allcountynames[counties],"\n")
  data <- fulldata[which(fulldata$FIPS %in% allcountygroups[[counties]]),]
  for (r in races){
    cat(r,", ")
    tot <- sum(data[[paste0(r,"Population")]],na.rm=TRUE)
    poverty <- sum(data[[paste0(r,"Below.Poverty.Level")]],na.rm=TRUE)
    cat(poverty/tot,"\n")
  }
  cat("\n\n")
}
sink()



