## BASIC DEMOGRAPHIC BREAKDOWN

#IMPORTING DATA
setwd("~/Dropbox (MIT)/joint_center/brs_paper")

dems <- read.csv("data/demographics.csv")

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")
brs_counties <- brs_data$FIPS

# Black Rural South Demographics
brs <- dems
brs_pop <- sum(brs$Population,na.rm=TRUE)

sink('outputs/dems.txt')
cat("White, Non-Hispanic: ",sum(brs$White.Alone,na.rm=TRUE)/brs_pop)
cat("\nBlack, Non-Hispanic: ",sum(brs$Black.Alone,na.rm=TRUE)/brs_pop)
cat("\nHispanic/Latino: ",sum(brs$Hispanic.Latino,na.rm=TRUE)/brs_pop)
cat("\nAsian, Non-Hispanic: ",sum(brs$Asian.Alone,na.rm=TRUE)/brs_pop)
cat("\nOther: ",sum(brs$AIAN.Alone,brs$NHOPI.Alone,brs$Other.Alone,brs$Two.or.More.Races,na.rm=TRUE)/brs_pop)
sink()
