## BROADBAND DATA

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

broadband <- read.csv("data/broadband.csv")

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(broadband,rurality)

#############################################################
#################### DECLARING CONSTANTS ####################
#############################################################
races <- c('Total.','White.','Black.')
comps <- c('without.Computer','without.Internet.Subscription','with.Dial.up.Only','with.Broadband.Internet')

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

sink("outputs/broadband.csv")
for (counties in 1:5){
  cat("\n",county_names[counties],"\n")
  data <- fulldata[which(fulldata$FIPS %in% county_groups[[counties]]),]
  for (r in races){
    cat(r,"\n")
    for (c in comps){
      cat(c,", ")
      tot <- sum(data[[paste0(r,"Population")]],na.rm=TRUE)
      comp <- sum(data[[paste0(r,c)]],na.rm=TRUE)
      cat(comp/tot,"\n")
    }
  }
  cat("\n\n")
}
sink()