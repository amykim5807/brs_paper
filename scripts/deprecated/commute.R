## COMMUTE TIME (Mean travel time to work)
## DEPRECATED

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/Dropbox (MIT)/joint_center/brs_paper")

commute <- read.csv("data/commute.csv")

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(commute,rurality,all.x = TRUE,by.x="Id2",by.y="FIPS")

####################################################################
### GENERATING SUBSETS OF COUNTY FIPS CODES, DECLARING CONSTANTS ###
####################################################################
# Black Rural South Counties
brs_counties <- brs_data$FIPS

# Non-Southern Rural Counties
south <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
nonsouth_rural <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(substr(fulldata$Id2,1,2) %in% as.character(south))),]$Id2

# Southern Metro (non-rural) Counties
south_metro <- fulldata[which((fulldata$RUCC_2013 < 4)&(substr(fulldata$Id2,1,2) %in% as.character(south))),]$Id2

# All Counties in the South
south_counties <- fulldata[which((substr(fulldata$Id2,1,2) %in% as.character(south))),]$Id2

# All Counties
all_counties <- fulldata$Id2

county_groups <- list(brs_counties,nonsouth_rural,south_metro,south_counties,all_counties)
county_names <- c("Black Rural South","Nonsouth Rural","South Metro","South","All")


####################################################################
##################### GETTING MEAN TRAVEL TIMES ####################
####################################################################
sink('outputs/commute.txt')
for (c in 1:5){
  data <- fulldata[which(fulldata$Id2 %in% county_groups[[c]]),]
  cat("\n\n",county_names[c],"\n")
  cat(weighted.mean(data$Commute,data$Workers,na.rm=TRUE))
}
sink()




