## WHITE UNEMPLOYMENT

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/Dropbox (MIT)/joint_center/brs_paper")

#Demographic data to determine 'White' counties
dems <- read.csv("data/percentwhite.csv")
white <- dems$FIPS[which(dems$White.Alone.Percent >= 90)]

#Employment Data
unemp <- read.csv("data/white_unemp.csv")

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")
brs_counties <- brs_data$FIPS

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")


# Merging Data so FIPS are accurate
fulldata <- merge(unemp,rurality,all.x = TRUE,by.x="FIPS",by.y="FIPS")

#Rural Southern Whites outside BRS'
south <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
rural_south_nonbrs <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(fulldata$FIPS %in% brs_counties)&((substr(fulldata$FIPS,1,2) %in% as.character(south)))),]
weighted.mean(rural_south_nonbrs$WHITEUR,rural_south_nonbrs$Pop_16.)

#Non-Southern Rural Whites
nonsouth_rural <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(substr(fulldata$FIPS,1,2) %in% as.character(south))),]
weighted.mean(nonsouth_rural$WHITEUR,nonsouth_rural$Pop_16.)


#Southern Rural White-Heavy Counties
south_rural_white <- fulldata[which((fulldata$RUCC_2013 >= 4)&(substr(fulldata$FIPS,1,2) %in% as.character(south))&(fulldata$FIPS %in% white)),]
weighted.mean(south_rural_white$WHITEUR,south_rural_white$Pop_16.)

#Black Rural South
brs <- fulldata[which(fulldata$FIPS %in% brs_counties),]
weighted.mean(brs$WHITEUR,brs$Pop_16.)
weighted.mean(as.numeric(as.character(brs$BLACKUR)),brs$Pop_16.)

