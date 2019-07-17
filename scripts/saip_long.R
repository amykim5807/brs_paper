## PULLING HISTORICAL SAIP DATA

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/Dropbox (MIT)/joint_center/brs_paper")

# Population
pop <- read.csv("data/county_pop.csv")
pop$X2017 <- pop$X2010 # We use the 2010 census population for the 2018 calculations
pop$X1989 <- pop$X1990

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")
brs_counties <- brs_data$FIPS

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(pop,rurality,all.x = TRUE,by.x="fips",by.y="FIPS")

####################################################################
### GENERATING SUBSETS OF COUNTY FIPS CODES, DECLARING CONSTANTS ###
####################################################################
# Black Rural South Counties
brs_counties <- brs_data$FIPS

# Non-Southern Rural Counties
south <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
nonsouth_rural <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(substr(fulldata$fips,1,2) %in% as.character(south))),]$fips

# Southern Metro (non-rural) Counties
south_metro <- fulldata[which((fulldata$RUCC_2013 < 4)&(substr(fulldata$fips,1,2) %in% as.character(south))),]$fips

# All Counties in the South
south_counties <- fulldata[which((substr(fulldata$fips,1,2) %in% as.character(south))),]$fips

# All Counties
all_counties <- fulldata$fips

# Years
yrs <- c(1989,2000,2010,2017)

####################################################################
########################### HH INCOME DATA #########################
####################################################################
county_names <- c("BLACK RURAL SOUTH","NON-SOUTHERN RURAL", "SOUTHERN METRO","ALL SOUTH","USA")
counties = list(brs_counties,nonsouth_rural,south_metro,south_counties,all_counties)
sink("outputs/income.txt")
for (num in 1:5){
  cat("\n",county_names[num],"\n")
  for (yr in yrs){
    saip <- read.csv(paste0("data/",as.character(yr),"_pov.csv"))
    brs <- saip[which(saip$County.ID %in% counties[[num]]),]
    data <- merge(brs,fulldata,by.x="County.ID",by.y="fips")
    yrpop <- data[[paste0("X",yr)]]
    cat(yr,"\n")
    cat(weighted.median(as.numeric(gsub("[^0-9.]","",data$Median.Household.Income.in.Dollars)),as.numeric(yrpop)),"\n")
  }
}
sink()

####################################################################
############################ POVERTY DATA ##########################
####################################################################
saip <- read.csv("data/pov_all.csv")
# ALL POVERTY
indicator <- "All.Ages.in.Poverty.Percent"
# CHILD POVERTY
#indicator <- "Under.Age.18.in.Poverty.Percent"

sink("outputs/poverty.txt")
for (num in 1:5){
  cat("\n",county_names[num],"\n")
  for (yr in yrs){
    brs <- saip[which((saip$County.ID %in% counties[[num]])&(saip$Year == yr)),]
    data <- merge(brs,fulldata,by.x="County.ID",by.y="fips")
    yrpop <- data[[paste0("X",yr)]]
    cat(yr,"\n")
    cat(weighted.mean(as.numeric(data[[indicator]]),as.numeric(yrpop),na.rm=TRUE)/100,"\n")
  }
}
sink()


closeAllConnections()
