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
Percentage of cotton harvested by hand, in the Black Rural South States, from 1949-1969.
- Calculated by subtracting percentage of cotton harvested mechanically, (Peterson and Kislev, 1986 -- Table 1) from 100.

## The Present Status of Work in the Black Rural South


### Unemployment Rate by Region (bls_long.R)
Unemployment rate by region in 1990, 2000, 2010, and 2018.
- Calculated by pulling Annual Average Non-Seasonally Adjusted Unemployment Rates by county in these years, and calculating average across region, weighted by Annual Average Non-Seasonally Adjusted Labor Force Level per county in the same years, from BLS Local Area Unemployment Statistics (LAUS)
- Regions: Black Rural South, Non-Southern Rural, Southern Metro, South, and USA counties

### Average Labor Force Participation Rates by Region (2013-2017) (emp.R)
Average Labor Force Participation Rate by race and region.
- 'All' Calculated by taking average of 'Population 16 years and over -- Labor Force Participation Rate', weighted by 'Population 16 years and over -- Total' from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- 'White' Calculated by taking average of 'White alone, not Hispanic or Latino Population 16 years and over -- Labor Force Participation Rate', weighted by 'White alone, not Hispanic or Latino Population 16 years and over -- Total' from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- 'Black' Calculated by taking average of 'Black or African American Alone Population 16 years and over -- Labor Force Participation Rate', weighted by 'Black or African American Alone Population 16 years and over -- Total' from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- Region/Races: Black in Black Rural South, White in Black Rural South, All in Non-South Rural, Black in South Metro, White in South Metro, All in South, Black in USA, White in USA, All in USA

### Median Household Income by Region (saip_long.R)
Median Household Income by region in 1989, 2000, 2010, and 2017. 
- Calculated by taking the weighted median of the Median Household Incomes by county in 1989, 2000, 2010, and 2017 from Small Area Income and Poverty Estimates -- US Census Bureau, weighted by the 1990, 2000, 2010 Census population and the 2013-2017 ACS population estimates respectively for each region, from US Census 1990, 2000, 2010 and ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05).
- Regions: Black Rural South, Non-Southern Rural, Southern Metro, South, and USA counties

### Percentage of Children Below the Poverty Line by Region (saip_long.R)
Percentage of children below the poverty line by region in 1989, 2000, 2010, and 2017. 
- Calculated by taking the weighted mean of the Percentage of Population Under 18 Below the Poverty Line by county in 1989, 2000, 2010, and 2017 from Small Area Income and Poverty Estimates -- US Census Bureau, weighted by the 1990, 2000, 2010 Census population and the 2013-2017 ACS population estimates respectively for each region, from US Census 1990, 2000, 2010 and ACS 2013-2017 5-Year Demographic and Housing Estimates (Table DP05).
- Regions: Black Rural South, Non-Southern Rural, Southern Metro, South, and USA counties

### Average Unemployment Rates by Region (2013-2017) (emp.R)
Average Unemployment Rate by race and region over 2013-2017.
- 'All' Calculated by taking average of 'Population 16 years and over -- Unemployment Rate', weighted by Labor Force Level (Labor Force Level calculated by multiplying 'Population 16 years and over -- Labor Force Participation Rate' by 'Population 16 years and over -- Total') from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- 'White' Calculated by taking average of 'White alone, not Hispanic or Latino Population 16 years and over -- Unemployment Rate', weighted by White alone, not Hispanic or Latino Labor Force Level (Labor Force Level calculated by multiplying 'White alone, not Hispanic or Latino Population 16 years and over -- Labor Force Participation Rate' by 'White alone, not Hispanic or Latino Population 16 years and over -- Total') from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- 'Black' Calculated by taking average of 'Black alone Population 16 years and over -- Unemployment Rate', weighted by Black alone Labor Force Level (Labor Force Level calculated by multiplying 'Black alone Population 16 years and over -- Labor Force Participation Rate' by 'White alone, not Hispanic or Latino Population 16 years and over -- Total') from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- Region/Races: Black in Black Rural South, White in Black Rural South, All in Non-South Rural, Black in South Metro, White in South Metro, All in South, Black in USA, White in USA, All in USA

### Median Earnings by Region (earnings.R)
Median Earnings by race and region over 2013-2017.
- 'All' Calculated by taking the weighted median of 'Median Earnings 
- 'Black' Calculated by taking the weighted median of 'Median Earnings in the Past 12 Months (in 2017 Inflation-Adjusted Dollars)' from ACS 2013-2017 5-Year Median Earnings in the Past 12 Months (in 2017 Inflation-Adjusted Dollars) for the Population 16 Years and Over with Earnings in the Past 12 Months (Black or African American Alone) Estimates (Table B20017B), weighted by 2013-2017 ACS 

# Scripts, Data & Outputs
- bls_long.R -- used to pull BLS data using API, calculate longitudinal unemployment rate, labor force level, and total population from BLS and Census data. Input directly from BLS API and data/cleaned.csv, output into outputs/raw/unemp.csv, outputs/raw/lf.csv, outputs/raw/pop.csv, figures/unemp_long.png, and figures/laborforce.png
- cleaning.R -- used to combine population data, rurality data, and percentage black/white into one data frame. Input from data/county_pop.csv and data/ruralcodes.csv, output into data/cleaned.csv
- demographics.R -- used to calculate demographic makeup of different regions. Input from data/cleaned.csv and data/demographics.csv, output into outputs/raw/demographics.csv and figures/demographics.png
- emp.R -- used to calculate unemployment and labor force participation rates from 2013-2017 ACS 5-Year Estimates. Input from data/clenaed.csv and data/emp.csv, output into outputs/raw/emp.csv, figures/lf_bar.png, figures/unemp_bar.png, and figures/white_unemp.png.
- saip_long.R -- used to calculate longitudinal median household income, poverty rate, and child poverty rate from the US Census SAIP. Input from data/cleaned.csv and data/pov_all.csv, output into outputs/raw/income.csv, outputs/raw/poverty.csv, figures/median_hhincome.png, figures/poverty_long.png, and figures/childpoverty_long.png

























