## EDUCATIONAL ATTAINMENT DATA -- ACS 2017
closeAllConnections()

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/Dropbox (MIT)/joint_center/brs_paper")

ed <- read.csv("data/ed_attainment.csv")
# Black Rural South Data
brs_data <- read.csv("data/brs_final.csv")
brs_counties <- brs_data$FIPS

# Rurality Data
rurality <- read.csv("data/ruralcodes.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(ed,rurality,all.x = TRUE,by.x="FIPS",by.y="FIPS")

####################################################################
### GENERATING SUBSETS OF COUNTY FIPS CODES, DECLARING CONSTANTS ###
####################################################################
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

#############################################################
#################### HELPER FUNCTIONS #######################
#############################################################
educ_grad <- function(FIPS){
  educ_data <- fulldata[which(fulldata$FIPS %in% FIPS),]
  hs_gradrate <- 1 - sum(educ_data$Less.than.Ninth.Grade,educ_data$X9.12.No.Diploma,na.rm=TRUE)/sum(educ_data$Pop_25.,na.rm=TRUE)
  col_gradrate <- sum(educ_data$Bachelor.s.Degree,educ_data$Graduate.Professional.Degree,na.rm=TRUE)/sum(educ_data$Pop_25.,na.rm=TRUE)
  cat("High School: ",hs_gradrate)
  cat("\nCollege: ", col_gradrate)
}

educ_grad_white <- function(FIPS){
  educ_data <- fulldata[which(fulldata$FIPS %in% FIPS),]
  hs_gradrate <- sum(educ_data$White.alone..not.Hisp.Lat..High.School.Graduate,na.rm=TRUE)/sum(educ_data$White.alone..not.Hisp.Lat..Population,na.rm=TRUE)
  col_gradrate <- sum(educ_data$White.alone..not.Hisp.Lat..Bachelor.s.Degree,na.rm=TRUE)/sum(educ_data$White.alone..not.Hisp.Lat..Population,na.rm=TRUE)
  cat("High School: ",hs_gradrate)
  cat("\nCollege: ", col_gradrate)
}

educ_grad_black <- function(FIPS){
  educ_data <- fulldata[which(fulldata$FIPS %in% FIPS),]
  hs_gradrate <- sum(educ_data$Black.alone.High.School.Graduate,na.rm=TRUE)/sum(educ_data$Black.alone.Population,na.rm=TRUE)
  col_gradrate <- sum(educ_data$Black.alone.Bachelor.s.Degree,na.rm=TRUE)/sum(educ_data$Black.alone.Population,na.rm=TRUE)
  cat("High School: ",hs_gradrate)
  cat("\nCollege: ", col_gradrate)
}

#####################################################################
############### HIGH SCHOOL/COLLEGE GRADUATION RATE #################
#####################################################################
sink('outputs/educ_grad.txt')
cat("GRAPH ONE\n\n")
cat("USA\n")
educ_grad(all_counties)

cat("\nWhite in USA\n")
educ_grad_white(all_counties)

cat("\nBlack in USA\n")
educ_grad_black(all_counties)

cat("\nNon-South Rural\n")
educ_grad(nonsouth_rural)

cat("\nBlack in Black Rural South\n")
educ_grad_black(brs_counties)

cat("\n\nGRAPH TWO\n\n")
cat("South\n")
educ_grad(south_counties)

cat("\nWhite in South Metro\n")
educ_grad_white(south_metro)

cat("\nBlack in South Metro\n")
educ_grad_black(south_metro)

cat("\nWhite in Black Rural South\n")
educ_grad_white(brs_counties)

cat("\nBlack in Black Rural South\n")
educ_grad_black(brs_counties)

sink()





