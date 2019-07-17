## MEDIAN EARNINGS -- FOR POPULATION 16 YEARS AND OVER WITH EARNINGS IN THE PAST 12 MONTHS

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/Dropbox (MIT)/joint_center/brs_paper")

earnings <- read.csv("data/earnings.csv")

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(earnings,rurality,all.x = TRUE)

#############################################################
#################### DECLARING CONSTANTS ####################
#############################################################
races <- c('','White.','Black.')

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

sink("outputs/earnings.txt")
for (counties in 1:5){
  cat("\n",county_names[counties],"\n")
  data <- fulldata[which(fulldata$FIPS %in% county_groups[[counties]]),]
  for (r in races){
    cat(r,": ")
    mn <- weighted.median(as.numeric(as.character(data[[paste0(r,"Median.Earnings")]])),as.numeric(gsub("[^0-9.]","",data$Population_2010)),na.rm=TRUE)
    cat(mn,"\n") 
  }
  cat("\n\n")
}
sink()



