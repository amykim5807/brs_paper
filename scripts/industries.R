## UP TO DATE: 07/18
## INDUSTRY ANALYSIS
setwd("~/git/brs_paper")
library(readxl)

fulldata <- read.csv("data/cleaned.csv")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

south_metro <- c(south_metro,51901,51907,51911,51918,51919,51921,51931,51933,51941,51942,51944,51997,51951,51953,51958)

## GETTING STATE DATA
states <- unique(fulldata$state)
emp_data <- list()
for (st in states){
  data <- read.csv(paste0("data/industries/CAEMP25N_",st,"_2001_2017.csv"))
  emp_data <- append(emp_data,list(data))
}
names(emp_data) <- states

### INITIALIZATION ###
yrs <- c(2001,2017)
codes <- c(90,500,1200)
names <- c('private non-farm','manufacturing','professional, scientific, technical services')

### ANALYSIS ###

#By County
sink("outputs/raw/industries.csv")
for (i in 1:3){
  cat("\n\n",county_names[i],"\n")
  for (yr in yrs){
    cat("\n\n",yr,"\n")
    for (c in 1:3){
      cat("\n",names[c],"\n")
      tot = 0
      for (st in states){
        state_data <- emp_data[[st]]
        data <- as.numeric(as.character(state_data[[paste0('X',yr)]]))[which((state_data$LineCode == codes[c])&(as.numeric(as.character(state_data$GeoFIPS)) %in% county_groups[[i]]))]
        tot = tot + sum(data,na.rm=TRUE)
      }
      cat(tot)
    }
  }
}

#By State
south_states <- as.character(unique(fulldata$state[which(fulldata$south)]))
south_indices <- c(8,13,20)
cat("South\n")
for (yr in yrs){
  cat(yr,"\n")
  for (c in 1:3){
    cat(names[c],",")
    tot = 0
    for (st in south_states){
      num <- as.numeric(as.character(emp_data[[st]][[paste0('X',yr)]]))[south_indices[c]]
      if (is.na(num)){
        num = 0
      }
      tot = tot + num
    }
    cat(tot,"\n\n")
  }
}

# ALL USA
usa_data <- read.csv("data/industries/CAEMP25N__ALL_STATES_2001_2017.csv")
cat("USA\n")
for (yr in yrs){
  cat(yr,"\n")
  for (c in 1:3){
    cat(names[c],",",as.numeric(as.character(usa_data[[paste0('X',yr)]]))[south_indices[c]])
  }
}

sink()



