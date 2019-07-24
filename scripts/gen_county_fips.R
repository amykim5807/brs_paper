### GENERATING SUBSETS OF COUNTY FIPS CODES
setwd("~/git/brs_paper")
library(spatstat)

# Black Rural South Data
brs_counties <- fulldata$FIPS[which(fulldata$black35&fulldata$south&fulldata$rural)]

# Non-Southern Rural Counties
nonsouth_rural <- fulldata$FIPS[which(!fulldata$south&fulldata$rural)]

# Southern Metro (non-rural) Counties
south_metro <- fulldata$FIPS[which(fulldata$south&!fulldata$rural)]

# All Counties in the South
south_counties <- fulldata$FIPS[which(fulldata$south)]

# All Counties
all_counties <- fulldata$FIPS

# All Rural Counties
rural_counties <- fulldata$FIPS[which(fulldata$rural)]

county_groups <- list(brs_counties,nonsouth_rural,south_metro,south_counties,all_counties)
county_names <- c("Black Rural South","Nonsouth Rural","South Metro","South","All")

### WHITE DATA ###
rural_south_nonbrs <- fulldata$FIPS[which(fulldata$rural&!fulldata$black35&fulldata$rural)]
white_rural_south <- fulldata$FIPS[which(fulldata$rural&fulldata$white90&fulldata$south)]

white <- list(rural_south_nonbrs,nonsouth_rural,white_rural_south,brs_counties)
whitenames <- c("Rural Non-Black South","Non South Rural",'White Rural South',"Black Rural South")