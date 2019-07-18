### GENERATING SUBSETS OF COUNTY FIPS CODES
setwd("~/git/brs_paper")


# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")
brs_counties <- brs_data$FIPS

# Non-Southern Rural Counties
south <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
nonsouth_rural <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(as.numeric(substr(str_pad(fulldata$FIPS,5,pad="0"),1,2)) %in% south)),]$FIPS

# Southern Metro (non-rural) Counties
south_metro <- fulldata[which((fulldata$RUCC_2013 < 4)&(as.numeric(substr(str_pad(fulldata$FIPS,5,pad="0"),1,2)) %in% south)),]$FIPS

# All Counties in the South
south_counties <- fulldata[which((as.numeric(substr(str_pad(fulldata$FIPS,5,pad="0"),1,2)) %in% south)),]$FIPS

# All Counties
all_counties <- fulldata$FIPS