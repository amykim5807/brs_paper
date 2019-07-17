## NAEP Test Scores
closeAllConnections()

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/Dropbox (MIT)/joint_center/brs_paper")

naep_raw <- read.csv("data/naep.csv")
naep <- naep[which(naep$grade==4),]

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(naep,rurality,all.x = TRUE,by.x="countyid",by.y="FIPS")

#############################################################
#################### DECLARING CONSTANTS ####################
#############################################################
yrs <- 2009:2015
subjects <- c('ela','math')
races <- c('all','wht','blk')

# Black Rural South Counties
brs_counties <- brs_data$FIPS

# Non-Southern Rural Counties
south <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
nonsouth_rural <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(substr(fulldata$countyid,1,2) %in% as.character(south))),]$countyid

# Southern Metro (non-rural) Counties
south_metro <- fulldata[which((fulldata$RUCC_2013 < 4)&(substr(fulldata$countyid,1,2) %in% as.character(south))),]$countyid

# All Counties in the South
south_counties <- fulldata[which((substr(fulldata$countyid,1,2) %in% as.character(south))),]$countyid

# All Counties
all_counties <- fulldata$countyid

county_groups <- list(brs_counties,nonsouth_rural,south_metro,south_counties,all_counties)
county_names <- c("Black Rural South","Nonsouth Rural","South Metro","South","All")

##############################################################
###################### GETTING NUMBERS #######################
##############################################################

sink("outputs/naep.txt")
for (s in subjects){
  cat("\n\n",s,"\n")
  for (yr in yrs){
    cat(yr,"\n")
    for (counties in 1:5){
      cat("\n",county_names[counties],"\n")
      data <- fulldata[which((fulldata$countyid %in% county_groups[[counties]])&(fulldata$year==yr)&(fulldata$subject==s)),]
      for (r in races){
        cat(r,": ")
        mn <- weighted.mean(data[[paste0("mn_",r)]],data[[paste0("totgyb_",r)]],na.rm=TRUE)
        cat(mn,"\n")
      } 
    }
    cat("\n")
  }
  cat("\n\n")
}
sink()
