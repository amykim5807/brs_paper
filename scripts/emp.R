## UNEMPLOYMENT
## UP TO DATE: 07/18

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

#Employment Data
emp <- read.csv("data/emp.csv")

#Demographic Data
data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data,emp,by='FIPS')

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

### LABOR FORCE ###
for (r in c("","white","black")){
  fulldata[[paste0("lf",r)]] <- (as.numeric(as.character(fulldata[[paste0("lfpr",r)]]))/100)*as.numeric(as.character(fulldata[[paste0("pop16",r)]]))
}

#############################################################
######################### ANALYSIS ##########################
#############################################################
allcountygroups <- append(county_groups,white)
allcountynames <- c(county_names,whitenames)

sink('outputs/raw/emp.csv')

cat("Unemployment Rates","\n")
for (i in 1:length(allcountynames)){
  cat(allcountynames[i],"\n")
  tempdata <- fulldata[which(fulldata$FIPS %in% allcountygroups[[i]]),]
  for (r in c("","white","black")){
    cat(r,",")
    result <- weighted.mean(as.numeric(as.character(tempdata[[paste0("ur",r)]])),tempdata[[paste0("lf",r)]],na.rm=TRUE)
    cat(result/100,'\n')
  }
}

cat("LFP Rates","\n")
for (i in 1:length(allcountynames)){
  cat(allcountynames[i],"\n")
  tempdata <- fulldata[which(fulldata$FIPS %in% allcountygroups[[i]]),]
  for (r in c("","white","black")){
    cat(r,",")
    result <- sum(as.numeric(as.character(tempdata[[paste0("lf",r)]])),na.rm=TRUE)
    tot <- sum(as.numeric(as.character(tempdata[[paste0("pop16",r)]])),na.rm=TRUE)
    cat(result/tot,'\n')
  }
}

sink()




