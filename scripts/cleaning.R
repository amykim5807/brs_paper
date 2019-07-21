## CLEANING DATA
pop <- read.csv("data/county_pop.csv")

temp <- unlist(strsplit(as.character(pop$X2010),"[(]"))
pop$X2010 <- as.numeric(temp[which(substr(temp,1,1)!="r")])

pop$X1990 <- as.numeric(gsub("[^0-9.]","",pop$X1990))

rurality <- read.csv("data/ruralcodes.csv")

fulldata <- merge(rurality,pop,by.x="FIPS",by.y="fips")
fulldata$Population_2010 <- as.numeric(gsub("[^0-9.]","",fulldata$Population_2010))


## CLASSIFYING INTO SOUTH/NOT
south_st <- c(10, 11, 12, 13, 24, 37, 45, 51, 54, 01, 21, 28, 47, 05, 22, 40, 48) #Southern states, as classified by Census regions
south <- as.numeric(substr(str_pad(fulldata$FIPS,5,pad="0"),1,2)) %in% south_st

## CLASSIFYING INTO RURAL/NOT
rural <- fulldata$RUCC_2013 >= 4

## CLASSIFYING INTO WHITE or BLACK
black <- (fulldata$black_acs /fulldata$X2017) >= 0.35
white <- (fulldata$white_acs /fulldata$X2017) >= 0.9

sum(fulldata$black_acs[which(black)])/sum(fulldata$X2017[which(black)])

## FINAL
cleaned <- data.frame(FIPS=fulldata$FIPS,county=fulldata$County_Name,state=fulldata$State,rural=rural,south=south,black35 = black, white90 = white,X1990=fulldata$X1990,X2000=fulldata$X2000,X2010=fulldata$X2010,X2017=fulldata$X2017)

write.csv(cleaned,'data/cleaned.csv')

