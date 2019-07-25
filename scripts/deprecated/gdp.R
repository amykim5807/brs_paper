## GDP Per Capita
## DEPRECATED

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

gdp <- read.csv("data/gdp.csv")

# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(gdp,rurality,all.x = TRUE)
fulldata$Population_2010 <- as.numeric(gsub("[^0-9.]","",fulldata$Population_2010))

#############################################################
#################### DECLARING CONSTANTS ####################
#############################################################
yrs <- 2012:2015

# Black Rural South Counties
brs_counties <- brs_data$FIPS

# Non-Southern Rural Counties
south <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
nonsouth_rural <- fulldata[which((fulldata$RUCC_2013 >= 4)&!(substr(fulldata$FIPS,1,2) %in% as.character(south))),]$FIPS

# Southern Metro (non-rural) Counties
south_metro <- fulldata[which((fulldata$RUCC_2013 < 4)&(substr(fulldata$FIPS,1,2) %in% as.character(south))),]$FIPS

# All Counties in the South
south_counties <- fulldata[which((substr(fulldata$FIPS,1,2) %in% as.character(south))),]$FIPS

# All Counties
all_counties <- fulldata$FIPS

county_groups <- list(brs_counties,nonsouth_rural,south_metro,south_counties,all_counties)
county_names <- c("Black Rural South","Nonsouth Rural","South Metro","South","All")


#####################################################################
###################### BLS DATA ON EMPLOYMENT #######################
#####################################################################
get_emp <- function(raw_ids,front,end){
  ids <- paste0(front,as.character(str_pad(raw_ids,5,pad="0")),end)
  chunked_ids <- chunk(ids,chunk.size=40) #BLS only allows queries in chunks of 50 or less
  emp <- vector(mode="numeric",length=length(ids))
  start = 0
  for (counties in chunked_ids){
    series <- list('seriesid'=as.character(counties), 'startyear'='2015',endyear='2015',annualaverage=TRUE,registrationkey = regkey) 
    response <- blsAPI::blsAPI(series)
    json <- fromJSON(response) 
    data <- json$Results$series$data
    for (ind in 1:length(counties)){
      if ((nrow(data[[ind]])==0)){
        # IF BLS DATA IS MISSING FOR A COUNTY
        emp[start + ind] <- 0
      }
      else{
        # EXTRACTING ANNUAL AVERAGE FOR 'yr'
        emp[start + ind] <- data[[ind]]$value[1]
      }
    }
    start = start + length(counties)
  }
  result <- sum(as.numeric(emp),na.rm=TRUE)
  return(result)
}
#get_emp(brs_counties,"LAUCN","0000000005")


##############################################################
###################### GETTING NUMBERS #######################
##############################################################

sink("outputs/gdp.txt")
cat("GDP PER CAPITA -- divided by employment 2015\n\n")
for (counties in 1:5){
  cat("\n",county_names[counties],"\n")
  data <- fulldata[which(fulldata$FIPS %in% county_groups[[counties]]),]
  tot <- get_emp(county_groups[[counties]],"LAUCN","0000000005")
  gdp <- sum(data$X2015,na.rm=TRUE)
  cat(gdp*1000/tot,"\n")
}
cat("\n\n")
sink()



















