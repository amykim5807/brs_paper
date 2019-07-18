## AUTOMATION
setwd("~/git/brs_paper")

brs <- read.csv('data/brs_final.csv')
rurality <- read.csv('data/ruralcodes.csv')

brs_pop <- rurality$Population_2010[which(rurality$FIPS %in% brs$FIPS)]
weighted.mean(brs$MGI...Automation.Potential...., brs_pop, na.rm=TRUE)