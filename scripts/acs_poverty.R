## ACS Poverty by Race and Deep Poverty

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

pov <- read.csv("data/acs_poverty.csv")

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(pov,rurality,all.x = TRUE)

#############################################################
#################### DECLARING CONSTANTS ####################
#############################################################
races <- c('','White..not.Hispanic..','Black.')

# Black Rural South Counties
brs_counties <- brs_data$FIPS

# Non-Southern Rural Counties
south <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
nonsouth_rural <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(substr(fulldata$FIPS,1,2) %in% as.character(south))),]$FIPS

# Southern Metro (non-rural) Counties
south_metro <- fulldata[which((fulldata$RUCC_2013 < 4)&(substr(fulldata$FIPS,1,2) %in% as.character(south))),]$FIPS

# All Counties in the South
south_counties <- fulldata[which((substr(fulldata$FIPS,1,2) %in% as.character(south))),]$FIPS

# All Counties
all_counties <- fulldata$FIPS

county_groups <- list(brs_counties,nonsouth_rural,south_metro,south_counties,all_counties)
county_names <- c("Black Rural South","Nonsouth Rural","South Metro","South","All")

##############################################################
###################### GETTING NUMBERS #######################
##############################################################
# 
# sink("outputs/acs_poverty.txt")
# for (counties in 1:5){
#   cat("\n",county_names[counties],"\n")
#   data <- fulldata[which(fulldata$FIPS %in% county_groups[[counties]]),]
#   for (r in races){
#     cat(r,": ")
#     tot <- sum(data[[paste0(r,"Population")]],na.rm=TRUE)
#     poverty <- sum(data[[paste0(r,"Below.Poverty.Level")]],na.rm=TRUE)
#     cat(poverty/tot,"\n") 
#   }
#   cat("\n\n")
# }
# sink()

##############################################################
###################### WHITE COUNTIES #######################
##############################################################
#Demographic data to determine 'White' counties
dems <- read.csv("data/percentwhite.csv")
white <- dems$FIPS[which(dems$White.Alone.Percent >= 90)]

# RURAL SOUTH NON BRS
rural_south_nonbrs <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(fulldata$FIPS %in% brs_counties)&((substr(fulldata$FIPS,1,2) %in% as.character(south)))),]
sum(rural_south_nonbrs$White..not.Hispanic..Below.Poverty.Level,na.rm=TRUE)/sum(rural_south_nonbrs$White..not.Hispanic..Population,na.rm=TRUE)


#Non-Southern Rural Whites
nonsouth_rural <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(substr(fulldata$FIPS,1,2) %in% as.character(south))),]
sum(nonsouth_rural$White..not.Hispanic..Below.Poverty.Level,na.rm=TRUE)/sum(nonsouth_rural$White..not.Hispanic..Population,na.rm=TRUE)


#Southern Rural White-Heavy Counties
south_rural_white <- fulldata[which((fulldata$RUCC_2013 >= 4)&(substr(fulldata$FIPS,1,2) %in% as.character(south))&(fulldata$FIPS %in% white)),]
sum(south_rural_white$White..not.Hispanic..Below.Poverty.Level,na.rm=TRUE)/sum(south_rural_white$White..not.Hispanic..Population,na.rm=TRUE)


#Black Rural South
brs <- fulldata[which(fulldata$FIPS %in% brs_counties),]
sum(brs$White..not.Hispanic..Below.Poverty.Level,na.rm=TRUE)/sum(brs$White..not.Hispanic..Population,na.rm=TRUE)





