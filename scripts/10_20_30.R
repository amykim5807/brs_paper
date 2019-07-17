### 10-20-30 rule counties
library(pdftools)
library(tidyverse)


pov_text <- pdf_text("data/persistentpoverty.pdf")
pov_data <- readr::read_lines(pov_text)

data <- grep("[0-9]{5}",pov_data[373:954], value=TRUE)

fips <- as.numeric(as.character(unlist(lapply(data,substring,first=15,last=19))))
brs <- read.csv("data/brs_final.csv")
brs_counties <- brs$FIPS
length(fips[which(fips %in% brs_counties)])

rurality <- read.csv("data/ruralcodes.csv")