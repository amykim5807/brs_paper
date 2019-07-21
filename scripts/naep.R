## UP TO DATE: 07/19

## NAEP Test Scores
closeAllConnections()

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

naep_raw <- read.csv("data/naep.csv")
naep <- naep_raw[which(naep_raw$grade==4),]

data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data,naep,all.x = TRUE,by.x="FIPS",by.y="countyid")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

yrs <- 2009:2015
subjects <- c('ela','math')
races <- c('all','wht','blk')

##############################################################
###################### GETTING NUMBERS #######################
##############################################################

sink("outputs/raw/naep.csv")
for (s in subjects){
  cat("\n\n",s,"\n")
  for (counties in 1:5){
    cat("\n",county_names[counties],"\n")
    for (yr in yrs){
      cat(yr,"\n")
      data <- fulldata[which((fulldata$FIPS %in% county_groups[[counties]])&(fulldata$year==yr)&(fulldata$subject==s)),]
      for (r in races){
        cat(r,",")
        mn <- weighted.mean(data[[paste0("mn_",r)]],data[[paste0("totgyb_",r)]],na.rm=TRUE)
        cat(mn,"\n")
      }
    }
  }
}
sink()


sink("outputs/raw/naep_white.csv")
for (s in subjects){
  cat("\n\n",s," White -- 2015\n")
  r <- "wht"
  for (counties in 1:4){
    cat("\n",whitenames[counties],"\n")
    data <- fulldata[which((fulldata$FIPS %in% white[[counties]])&(fulldata$year==2015)&(fulldata$subject==s)),]
    mn <- weighted.mean(data[[paste0("mn_",r)]],data[[paste0("totgyb_",r)]],na.rm=TRUE)
    cat(mn,"\n")
  }
}
sink()



