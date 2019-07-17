## INDUSTRY ANALYSIS
setwd("~/Dropbox (MIT)/joint_center/brs_paper")
library(readxl)

brcs <- read.csv("data/brs_final.csv")
counties <- as.numeric(as.character(unique(brcs$FIPS)))
counties <- c(counties,51923,51949,51939,51929)
# 
# sheets <- readxl::excel_sheets("data/industries.xls")
# states <- lapply(sheets, function(X) as.data.frame(readxl::read_excel("data/industries.xls", sheet = X)))
# names(states) <- sheets

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")
states <- unique(rurality$State)

emp_data <- list()
for (st in states){
  data <- read.csv(paste0("data/industries/CAEMP25N_",st,"_2001_2017.csv"))
  emp_data <- append(emp_data,list(data))
}
names(emp_data) <- states

### INITIALIZATION ###
yrs <- 2001:2017
codes <- c(500,1200)
names <- c('manufacturing','professional, scientific, technical services')

# Black Rural South Counties
brs_counties <- brs_data$FIPS

# Non-Southern Rural Counties
south <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
nonsouth_rural <- rurality[which((rurality$RUCC_2013 >= 4)&!(substr(rurality$FIPS,1,2) %in% as.character(south))),]$FIPS

# Southern Metro (non-rural) Counties
south_metro <- rurality[which((rurality$RUCC_2013 < 4)&(substr(rurality$FIPS,1,2) %in% as.character(south))),]$FIPS

# All Counties in the South
south_counties <- rurality[which((substr(rurality$FIPS,1,2) %in% as.character(south))),]$FIPS

# All Counties
all_counties <- rurality$FIPS

county_groups <- list(brs_counties,nonsouth_rural,south_metro,south_counties,all_counties)
county_names <- c("Black Rural South","Nonsouth Rural","South Metro","South","All")

### ANALYSIS ###
sink("outputs/industries.csv")
for (i in 1:5){
  cat("\n\n",county_names[i],"\n")
  for (yr in yrs){
    cat("\n\n",yr,"\n")
    for (c in 1:2){
      cat("\n",names[c],"\n")
      tot = 0
      for (st in states){
        state_data <- emp_data[[st]]
        data <- as.numeric(as.character(unlist(state_data[paste0('X',yr)])))[which((state_data$LineCode == codes[c])&(as.numeric(as.character(state_data$GeoFIPS)) %in% county_groups[[i]]))]
        #print(data)
        tot = tot + sum(data,na.rm=TRUE)
      }
      cat(tot)
    }
  }
}
sink()






