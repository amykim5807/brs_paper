## UP TO DATE: 07/23
## CHILD POVERTY GRAPH
setwd("~/git/brs_paper")

pov <- read.csv("data/acschildpoverty.csv")

data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data,pov,by = "FIPS")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")


## ANALYSIS
fulldata$blackpop <- fulldata$Black.Female.Children.in.Poverty + fulldata$Black.Female.Children.Not.in.Poverty + fulldata$Black.Male.Children.in.Poverty + fulldata$Black.Male.Children.Not.in.Poverty
fulldata$whitepop <- fulldata$White.Female.Children.in.Poverty + fulldata$White.Female.Children.Not.in.Poverty + fulldata$White.Male.Children.in.Poverty + fulldata$White.Male.Children.Not.in.Poverty
fulldata$blackpov <- fulldata$Black.Female.Children.in.Poverty + fulldata$Black.Male.Children.in.Poverty
fulldata$whitepov <- fulldata$White.Female.Children.in.Poverty + fulldata$White.Male.Children.in.Poverty
fulldata$allpop <- fulldata$Female.Children.in.Poverty + fulldata$Female.Children.Not.in.Poverty + fulldata$Male.Children.in.Poverty + fulldata$Male.Children.Not.in.Poverty
fulldata$allpov <- fulldata$Female.Children.in.Poverty + fulldata$Male.Children.in.Poverty

races <- c('all','white','black')


sink("outputs/raw/acs_childpoverty.csv")
for (counties in 1:5){
  cat("\n",county_names[counties],"\n")
  data <- fulldata[which(fulldata$FIPS %in% county_groups[[counties]]),]
  for (r in races){
    cat(r,", ")
    tot <- sum(data[[paste0(r,"pop")]],na.rm=TRUE)
    poverty <- sum(data[[paste0(r,"pov")]],na.rm=TRUE)
    cat(poverty/tot,"\n")
  }
  cat("\n\n")
}
sink()


