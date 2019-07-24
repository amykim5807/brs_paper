## UP TO DATE: 07/24
## MEANS OF TRANSPORTATION
setwd("~/git/brs_paper")

transportation <- read.csv("data/transportation.csv")

data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data,transportation,by = "FIPS")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

races <- c("all","white","black")
transp <- c("caralone","carpool","publictransport","walk","taxibike","home")

sink("outputs/raw/transp.csv")
for (i in 1:5){
  cat(county_names[i],"\n")
  tempdata <- fulldata[which(fulldata$FIPS %in% county_groups[[i]]),]
  for (r in 1:3){
    cat(races[r],"\n")
    pop <- sum(tempdata[[paste0(races[r],"pop")]],na.rm=TRUE)
    for (t in 1:6){
      cat(transp[t],",")
      temptransp <- sum(tempdata[[paste0(races[r],transp[t])]],na.rm=TRUE)
      cat(temptransp/pop,"\n")
    }
  }
}
sink()

sink("outputs/raw/transp.csv")
for (i in 1:5){
  cat(county_names[i],"\n")
  tempdata <- fulldata[which(fulldata$FIPS %in% county_groups[[i]]),]
  for (t in 1:6){
    cat(transp[t],"\n")
    pop = sum(tempdata[[paste0("all",transp[t])]],na.rm=TRUE)
    for (r in 1:3){
      cat(races[r],",")
      temptransp <- sum(tempdata[[paste0(races[r],transp[t])]],na.rm=TRUE)
      cat(temptransp/pop,"\n")
    }
  }
}
sink()

