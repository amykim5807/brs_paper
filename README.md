# Methodology for Graphs and Charts in "An Introduction to the Future of Work in the Black Rural South"

## General Methodologies: Defining Regions

### Black Rural South
Defined as southern rural counties with 35% Black population or more. 
- South defined by US Census Region: South
- Rural defined as counties with USDA ERS Rural-Urban Continuum Codes greater than or equal to 4
- Percentage Black by county calculated by 'One Race -- Black or African American' divided by 'Total population' from ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05)

### Rural South (Outside of BRS)
Defined as southern rural counties with less than 35% Black population.
- South defined by US Census Region: South
- Rural defined as counties with USDA ERS Rural-Urban Continuum Codes greater than or equal to 4
- Percentage Black by county calculated by 'One Race -- Black or African American' divided by 'Total population' from ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05)

### White Rural South
Defined as southern rural counties with 90% White population or more.
- South defined by US Census Region: South
- Rural defined as counties with USDA ERS Rural-Urban Continuum Codes greater than or equal to 4
- Percentage White by county calculated by 'One Race -- White' divided by 'Total population' from ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05)

### Non-Southern Rural
Defined as non-southern rural counties.
- Non-South defined as counties not in the US Census Region: South
- Rural defined as counties with USDA ERS Rural-Urban Continuum Codes greater than or equal to 4

### Southern Metro
Defined as southern non-rural counties.
- South defined by US Census Region: South
- Non-Rural defined as counties with USDA ERS Rural-Urban Continuum Codes less than 4

### South
Defined as counties in the US Census Region: South

### Rural United States
Defined as counties with USDA ERS Rural-Urban Continuum Codes greater than or equal to 4.

### USA
All counties in the USA


## Defining the Black Rural South

### Demographics of the Black Rural South, U.S. & Rural U.S. (demographics.R)
Racial/ethnic makeup of the Black Rural South, the United States, and the Rural United States.
- Percentage Black calculated by aggregating total 'Non Hispanic or Latino -- Black or African American Alone' population across region and dividing by 'Total Population' across region, from ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05)
- Percentage Latino calculated by aggregating total 'Hispanic or Latino' population across region and dividing by 'Total Population' across region, from ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05)
- Percentage Asian American calculated by aggregating total 'Non Hispanic or Latino -- Asian Alone' population across region and dividing by 'Total Population' across region, from ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05)
- Percentage White calculated by aggregating total 'Non Hispanic or Latino -- White Alone' population across region and dividing by 'Total Population' across region, from ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05)
- Percentage Other calculated by aggregating total 'Non Hispanic or Latino -- American Indian and Alaska Native alone', 'Non Hispanic or Latino -- Native Hawaiian and Other Pacific Islander alone', 'Non Hispanic or Latino -- Some other race alone', and 'Non Hispanic or Latino -- Two or More Races' populations across region and dividing by 'Total Population' across region, from ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05)

## The History of Work in the Black Rural South

### Cotton Exports from the United States, 1815-1860
Modernized chart, originally Table A-VIII from Douglass C. North's 1961 book *The Economic Growth of the United States*, as cited in Roger L. Ransom's webpage "The Economics of the Civil War". Data points only marked for every five years.

### Hand-Picked Cotton in the Black Rural South, 1949-1969

# Scripts
- cleaning.R -- used to combine population data, rurality data, and percentage black/white into one data frame, output into data/cleaned.csv
- demographics.R -- used to calculate demographic makeup of different regions, output into outputs/raw/demographics.csv and figures/demographics.png
