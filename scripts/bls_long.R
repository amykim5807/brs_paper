## UP TO DATE: 07/18

## PULLING HISTORICAL BLS DATA WITH API
## UNEMPLOYMENT and LABOR FORCE PARTICIPATION RATE by county in 1990, 2000, 2010, 2018

library(devtools)
library(jsonlite)
library(spatstat)
suppressMessages(library(dplyr))
install_github("mikeasilva/blsAPI",force=TRUE)

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

# Population
pop <- read.csv("data/county_pop.csv")
pop$X2018 <- pop$X2010 # We use the 2010 census population for the 2018 calculations

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(rurality,pop,all.x = TRUE,by.x="FIPS",by.y="fips")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

# BLS Data API Registration Key
regkey <- 'a12643485f5745cba762ecb73fd81acc'

# Years
yrs <- c(1990,2000,2010,2018)

####################################################################
######################### HELPER FUNCTIONS #########################
####################################################################
get_unemp <- function(raw_ids,front,end){
  ids <- paste0(front,as.character(str_pad(raw_ids,5,pad="0")),end)
  chunked_ids <- chunk(ids,chunk.size=40) #BLS only allows queries in chunks of 50 or less
  for (yr in yrs){
    unemp <- vector(mode="numeric",length=length(ids))
    start = 0
    for (counties in chunked_ids){
      series <- list('seriesid'=as.character(counties), 'startyear'=as.character(yr),endyear=as.character(yr),annualaverage=TRUE,registrationkey = regkey) 
      response <- blsAPI::blsAPI(series)
      json <- fromJSON(response) 
      data <- json$Results$series$data
      for (ind in 1:length(counties)){
        if ((nrow(data[[ind]])==0)){
          # IF BLS DATA IS MISSING FOR A COUNTY
          unemp[start + ind] <- 0
        }
        else{
          # EXTRACTING ANNUAL AVERAGE FOR 'yr'
          unemp[start + ind] <- data[[ind]]$value[1]
        }
      }
      start = start + length(counties)
    }
    cat(yr,", ")
    result <- weighted.mean(as.numeric(unemp),fulldata[[paste0("X",yr)]][which(fulldata$fips %in% raw_ids)],na.rm=TRUE)/100
    cat(result,"\n")
  }
}

get_unemp_all <- function(id){
  for (yr in yrs){
    series <- list('seriesid'=c(id), 'startyear'=as.character(yr),endyear=as.character(yr),annualaverage=TRUE,registrationkey = regkey) 
    response <- blsAPI::blsAPI(series)
    json <- fromJSON(response) 
    print(json)
    data <- json$Results$series$data
    cat(yr,", ")
    cat(data[[1]]$value[1],"\n")
  }
}

get_lf <- function(raw_ids,front,end){
  ids <- paste0(front,as.character(str_pad(raw_ids,5,pad="0")),end)
  chunked_ids <- chunk(ids,chunk.size=40) #BLS only allows queries in chunks of 50 or less
  for (yr in yrs){
    unemp <- vector(mode="numeric",length=length(ids))
    start = 0
    for (counties in chunked_ids){
      series <- list('seriesid'=as.character(counties), 'startyear'=as.character(yr),endyear=as.character(yr),annualaverage=TRUE,registrationkey = regkey) 
      response <- blsAPI::blsAPI(series)
      json <- fromJSON(response) 
      data <- json$Results$series$data
      for (ind in 1:length(counties)){
        if ((nrow(data[[ind]])==0)){
          # IF BLS DATA IS MISSING FOR A COUNTY
          unemp[start + ind] <- 0
        }
        else{
          # EXTRACTING ANNUAL AVERAGE FOR 'yr'
          unemp[start + ind] <- data[[ind]]$value[1]
        }
      }
      start = start + length(counties)
    }
    cat(yr,", ")
    result <- sum(as.numeric(unemp),na.rm=TRUE)
    cat(result,"\n")
  }
}

get_lf_all <- function(id){
  for (yr in yrs){
    series <- list('seriesid'=c(id), 'startyear'=as.character(yr),endyear=as.character(yr),annualaverage=TRUE,registrationkey = regkey) 
    response <- blsAPI::blsAPI(series)
    json <- fromJSON(response) 
    data <- json$Results$series$data
    cat(yr,", ")
    cat(data[[1]]$value[1],"\n")
  }
}
####################################################################
######################### UNEMPLOYMENT DATA ########################
####################################################################
sink("outputs/raw/unemp.csv")
cat("BLACK RURAL SOUTH: \n")
get_unemp(brs_counties,"LAUCN","0000000003")

cat("\n NON-SOUTH RURAL: \n")
get_unemp(nonsouth_rural,"LAUCN","0000000003")

cat("\n SOUTHERN METRO: \n")
get_unemp(south_metro,"LAUCN","0000000003")

cat("\n ALL SOUTH (RAW): \n")
get_unemp_all("LAURD930000000000003")

cat("\n ALL COUNTIES (RAW): \n")
get_unemp_all("LNU04000000")

sink()

####################################################################
########################## LF GROWTH DATA ##########################
####################################################################
sink("outputs/raw/lf.csv")
cat("BLACK RURAL SOUTH: \n")
get_lf(brs_counties,"LAUCN","0000000006")

cat("\n NON-SOUTH RURAL: \n")
get_lf(nonsouth_rural,"LAUCN","0000000006")

cat("\n SOUTHERN METRO: \n")
get_lf(south_metro,"LAUCN","0000000006")

cat("\n ALL SOUTH (RAW): \n")
get_lf_all("LAURD930000000000006")

cat("\n ALL COUNTIES (RAW): \n")
get_lf_all("LNU01000000")

sink()



closeAllConnections()




