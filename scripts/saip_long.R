## UP TO DATE: 07/19
## PULLING HISTORICAL SAIP DATA

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

pov <- read.csv("data/pov_all.csv")
data <- read.csv("data/cleaned.csv")
fulldata <- merge(data,pov,by='FIPS')
fulldata$X1989 <- fulldata$X1990
fulldata <- fulldata[-(12551:12554),]

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

# Years
yrs <- c(1989,2000,2010,2017)

####################################################################
########################### HH INCOME DATA #########################
####################################################################
sink("outputs/raw/income.csv")
for (i in 1:5){
  cat("\n",county_names[i],"\n")
  for (yr in yrs){
    tempdata <- fulldata[which((fulldata$FIPS %in% county_groups[[i]])&(fulldata$Year == yr)),]
    yrpop <- tempdata[[paste0("X",yr)]]
    cat(length(tempdata$FIPS),"\n")
    cat(yr,",")
    cat(weighted.median(as.numeric(gsub("[^0-9.]","",tempdata$income)),as.numeric(yrpop)),"\n")
  }
}
sink()

####################################################################
############################ POVERTY DATA ##########################
####################################################################
sink("outputs/raw/poverty.csv")
for (i in 1:5){
  cat("\n",county_names[i],"\n")
  for (yr in yrs){
    tempdata <- fulldata[which((fulldata$FIPS %in% county_groups[[i]])&(fulldata$Year == yr)),]
    yrpop <- tempdata[[paste0("X",yr)]]
    cat(yr,",")
    cat(weighted.mean(as.numeric(gsub("[^0-9.]","",tempdata$poverty)),as.numeric(yrpop),na.rm=TRUE)/100,"\n")
  }
}

cat("\n\n Child Poverty")
for (i in 1:5){
  cat("\n",county_names[i],"\n")
  for (yr in yrs){
    tempdata <- fulldata[which((fulldata$FIPS %in% county_groups[[i]])&(fulldata$Year == yr)),]
    yrpop <- tempdata[[paste0("X",yr)]]
    cat(yr,",")
    cat(weighted.mean(as.numeric(gsub("[^0-9.]","",tempdata$childpoverty)),as.numeric(yrpop),na.rm=TRUE)/100,"\n")
  }
}
sink()


closeAllConnections()
