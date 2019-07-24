## UP TO DATE: 07/19

## EDUCATIONAL ATTAINMENT DATA -- ACS 2017
closeAllConnections()

#############################################################
###################### IMPORTING DATA #######################
#############################################################
setwd("~/git/brs_paper")

ed <- read.csv("data/ed_attainment.csv")
data <- read.csv("data/cleaned.csv")

# Merging Data so FIPS are accurate
fulldata <- merge(data, ed, by="FIPS")

# GENERATING FIPS LISTS
source("scripts/gen_county_fips.R")

races <- c("All","White","Black")

#############################################################
#################### HELPER FUNCTIONS #######################
#############################################################
educ_grad <- function(FIPS){
  educ_data <- fulldata[which(fulldata$FIPS %in% FIPS),]
  hs_gradrate <- 1 - sum(educ_data$Less.than.Ninth.Grade,educ_data$X9.12.No.Diploma,na.rm=TRUE)/sum(educ_data$Pop_25.,na.rm=TRUE)
  col_gradrate <- sum(educ_data$Bachelor.s.Degree,educ_data$Graduate.Professional.Degree,na.rm=TRUE)/sum(educ_data$Pop_25.,na.rm=TRUE)
  cat("High School,College\n")
  cat(hs_gradrate,",", col_gradrate)
}

educ_grad_white <- function(FIPS){
  educ_data <- fulldata[which(fulldata$FIPS %in% FIPS),]
  hs_gradrate <- sum(educ_data$White.alone..not.Hisp.Lat..High.School.Graduate,na.rm=TRUE)/sum(educ_data$White.alone..not.Hisp.Lat..Population,na.rm=TRUE)
  col_gradrate <- sum(educ_data$White.alone..not.Hisp.Lat..Bachelor.s.Degree,na.rm=TRUE)/sum(educ_data$White.alone..not.Hisp.Lat..Population,na.rm=TRUE)
  cat("High School,College\n")
  cat(hs_gradrate,",", col_gradrate)
}

educ_grad_black <- function(FIPS){
  educ_data <- fulldata[which(fulldata$FIPS %in% FIPS),]
  hs_gradrate <- sum(educ_data$Black.alone.High.School.Graduate,na.rm=TRUE)/sum(educ_data$Black.alone.Population,na.rm=TRUE)
  col_gradrate <- sum(educ_data$Black.alone.Bachelor.s.Degree,na.rm=TRUE)/sum(educ_data$Black.alone.Population,na.rm=TRUE)
  cat("High School,College\n")
  cat(hs_gradrate,",", col_gradrate)
}

funcs <- list(educ_grad,educ_grad_white,educ_grad_black)
names(funcs) <- races
#####################################################################
############### HIGH SCHOOL/COLLEGE GRADUATION RATE #################
#####################################################################

allcountygroups <- append(county_groups,white)
allcountynames <- c(county_names,whitenames)

sink("outputs/raw/educ.csv")
for (counties in 1:9){
  cat("\n",allcountynames[counties],"\n")
  for (r in races){
    cat("\n",r,"\n")
    funcs[[r]](allcountygroups[[counties]])
  }
  cat("\n\n")
}
sink()


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


## HIGH SCHOOL PLUS ##

sink("outputs/raw/acs_hsplus.csv")
for ( i in 1:5){
  cat(county_names[i],",")
  educ_data <- fulldata[which(fulldata$FIPS %in% county_groups[[i]]),]
  pop <- sum(educ_data$Pop_25.,na.rm=TRUE)
  hsplus <- sum(educ_data$Associate.s.Degree, educ_data$Bachelor.s.Degree,educ_data$Graduate.Professional.Degree,na.rm=TRUE)
  cat(hsplus/pop,"\n")
}
sink()


