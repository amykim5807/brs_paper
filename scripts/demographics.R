## UP TO DATE: 07/18

## BASIC DEMOGRAPHIC BREAKDOWN

### IMPORTING DATA ### 
setwd("~/git/brs_paper")

dems <- read.csv("data/demographics.csv")
data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data,dems)

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

# LIST of LISTS
groups <- list(all_counties,rural_counties,brs_counties)
names <- c("USA","Rural","Black Rural South")

sink('outputs/raw/dems.csv')
for (i in 1:3){
  cat("\n",names[i],"\n")
  new <- fulldata[which(fulldata$FIPS %in% groups[[i]]),]
  pop <- sum(new$Population, na.rm=TRUE)
  cat("White Non-Hispanic, ",sum(new$White.Alone,na.rm=TRUE)/pop)
  cat("\nBlack Non-Hispanic, ",sum(new$Black.Alone,na.rm=TRUE)/pop)
  cat("\nHispanic/Latino, ",sum(new$Hispanic.Latino,na.rm=TRUE)/pop)
  cat("\nAsian Non-Hispanic, ",sum(new$Asian.Alone,na.rm=TRUE)/pop)
  cat("\nOther, ",sum(new$AIAN.Alone,new$NHOPI.Alone,new$Other.Alone,new$Two.or.More.Races,na.rm=TRUE)/pop)
}

sink()


