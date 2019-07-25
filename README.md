# Methodology for Graphs and Charts in "An Introduction to the Future of Work in the Black Rural South"
Up to date as of 7/25

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
- 'All' Calculated by taking the weighted median of 'Median Earnings in the Past 12 Months (in 2017 Inflation-Adjusted Dollars)' from ACS 2013-2017 5-Year Median Earnings in the Past 12 Months (in 2017 Inflation-Adjusted Dollars) for the Population 16 Years and Over with Earnings in the Past 12 Months Estimates (Table B20017), weighted by 'Population 16 years and over -- Total' from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- 'White' Calculated by taking the weighted median of 'Median Earnings in the Past 12 Months (in 2017 Inflation-Adjusted Dollars)' from ACS 2013-2017 5-Year Median Earnings in the Past 12 Months (in 2017 Inflation-Adjusted Dollars) for the Population 16 Years and Over with Earnings in the Past 12 Months (White Alone, Not Hispanic or Latino) Estimates (Table B20017H), weighted by 'White alone, not Hispanic or Latino Population 16 years and over -- Total' from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- 'Black' Calculated by taking the weighted median of 'Median Earnings in the Past 12 Months (in 2017 Inflation-Adjusted Dollars)' from ACS 2013-2017 5-Year Median Earnings in the Past 12 Months (in 2017 Inflation-Adjusted Dollars) for the Population 16 Years and Over with Earnings in the Past 12 Months (Black or African American Alone) Estimates (Table B20017B), weighted by 'Black or African American Alone Population 16 years and over -- Total' from ACS 2013-2017 5-Year Employment Status Estimates (Table S2301)
- Region/Races: Black in Black Rural South, White in Black Rural South, All in Non-South Rural, Black in South Metro, White in South Metro, All in South, Black in USA, White in USA, All in USA

### Average Percentage of Children in Poverty (2013-2017) (acs_childpoverty.R)
Average child poverty rates by race and region over 2013-2017.
- 'All' Calculated by aggregating total population under 18 years with income in the past 12 months below poverty level across the region, and dividing by total population under 18 years for whom poverty status is determined across the region from ACS 2013-2017 5-Year Poverty Status in the Past 12 Months by Sex by Age Estimates (Table B17001)
- 'White' Calculated by aggregating total population under 18 years with income in the past 12 months below poverty level across the region, and dividing by total population under 18 years for whom poverty status is determined across the region from ACS 2013-2017 5-Year Poverty Status in the Past 12 Months by Sex by Age (White Alone, Not Hispanic or Latino) Estimates (Table B17001H)
- 'Black' Calculated by aggregating total population under 18 years with income in the past 12 months below poverty level across the region, and dividing by total population under 18 years for whom poverty status is determined across the region from ACS 2013-2017 5-Year Poverty Status in the Past 12 Months by Sex by Age (Black or African American Alone) Estimates (Table B17001B)
- Region/Races: Black in Black Rural South, White in Black Rural South, All in Non-South Rural, Black in South Metro, White in South Metro, All in South, Black in USA, White in USA, All in USA

### Average Poverty Rate of Whites Alone (2013-2017) (acs_poverty.R)
Average poverty rates among white people by region over 2013-2017.
- Calculated by aggregating 'White alone, not Hispanic or Latino -- Below poverty level' across the region and dividing by aggregated 'White alone, not Hispanic or Latino -- Total' across the region from ACS 2013-2017 5-Year Poverty Status in the Past 12 Months Estimates (Table S1701)
- Regions: Black Rural South, Rural South (Outside of BRS), White Rural South, Non-South Rural


## Labor Markets and Automation in the Black Rural South

### Employment Growth in All Industries from 2001 to 2017 (industries.R)
Percentage growth from 2001 to 2017 of Private Non-Farm Employment by region.
- Calculated by aggregating Private Non-Farm Employment (Line Code 90) across the region in 2001 and 2017 from Total Full-Time and Part-Time Employment by NAICS Industry -- Bureau of Economic Analysis (CAEMP25N), then calculating the difference as a percentage of 2001 employment.
- Regions: Black Rural South, Non-Southern Rural, Southern Metro, South, and USA counties


### Employment Growth in Manufacturing and Professional, Scientific, and Technical Services from 2001 to 2017
Percentage growth from 2001 to 2017 of Manufacturing Industry and Professional, Scientific, and Technical Services Industry by region.
- Manufacturing Calculated by aggregating Manufacturing Industry (Line Code 500) across the region in 2001 and 2017 from Total Full-Time and Part-Time Employment by NAICS Industry -- Bureau of Economic Analysis (CAEMP25N), then calculating the difference as a percentage of 2001 level
- Professional, Scientific, and Technical Services Calculated by aggregating Professional, Scientific, and Technical Services (Line Code 1200) across the region in 2001 and 2017 from Total Full-Time and Part-Time Employment by NAICS Industry -- Bureau of Economic Analysis (CAEMP25N), then calculating the difference as a percentage of 2001 level
- Regions: Black Rural South, Non-Southern Rural, Southern Metro, South, and USA counties


## Recommendations for the Future of Work in the Black Rural South

### 10-20-30 Counties in the Black Rural South (tableau.R)
Map of all 10-20-30 Counties located in the Black Rural South
- 10-20-30 Counties, as defined by the American Recovery and Reinvestment Act of 2009, are all counties that have had poverty rates of 20% or more for thMath by the 1980, 1990, and 2000 decennial censuses. A full list, using Census and SAIPE poverty rates of 19.5% or greater is provided by the CRS (https://www.everycrsreport.com/files/20170127_R44748_9d9df7e676af79ffba4ba1d04f12da2ef693144a.pdf) by FIPS code. This map shows all 10-20-30 counties in the Black Rural South in orange, and all other counties in the Black Rural South in blue.

## Internet and Computer Access by Region (broadband.R)
Percentage of population with broadband, without broadband but with a computer, and with neither, by race and region.
- 'All' Calculated by aggregating total population without a computer, with a computer but without broadband, with a computer and broadband, and dividing each by total population in households from ACS 2013-2017 5-Year Presence of a Computer and Type of Internet Subscription in Household Estimates (Table B28009)
- 'White' Calculated by aggregating total population without a computer, with a computer but without broadband, with a computer and broadband, and dividing each by total population in households from ACS 2013-2017 5-Year Presence of a Computer and Type of Internet Subscription in Household (White Alone, Not Hispanic or Latino) Estimates (Table B28009H)
- 'Black' Calculated by aggregating total population without a computer, with a computer but without broadband, with a computer and broadband, and dividing each by total population in households from ACS 2013-2017 5-Year Presence of a Computer and Type of Internet Subscription in Household (Black or African American Alone) Estimates (Table B28009B)
- Region/Races: Black in Black Rural South, White in Black Rural South, All in Non-South Rural, Black in South Metro, White in South Metro, All in South, Black in USA, White in USA, All in USA

### NAEP Reading Scores for Grade 4 Students (naep.R)
Average NAEP English Language Arts scores among Grade 4 Students by region.
- 'All' Calculated by taking weighted average of mean NAEP ELA scores by county across the region, weighted by number of students who took the test in each county from NCES & NAEP, retrieved from Stanford Education Data Archive (Long Form, by County)
- 'White' Calculated by taking weighted average of mean White NAEP ELA scores by county across the region, weighted by number of White students who took the test in each county from NCES & NAEP, retrieved from Stanford Education Data Archive (Long Form, by County)
- 'Black' Calculated by taking weighted average of mean Black NAEP ELA scores by county across the region, weighted by number of Black students who took the test in each county from NCES & NAEP, retrieved from Stanford Education Data Archive (Long Form, by County)


### NAEP Math Scores for Grade 4 Students (naep.R)
Average NAEP Math scores among Grade 4 Students by region.
- 'All' Calculated by taking weighted average of mean NAEP Math scores by county across the region, weighted by number of students who took the test in each county from NCES & NAEP, retrieved from Stanford Education Data Archive (Long Form, by County)
- 'White' Calculated by taking weighted average of mean White NAEP Math scores by county across the region, weighted by number of White students who took the test in each county from NCES & NAEP, retrieved from Stanford Education Data Archive (Long Form, by County)
- 'Black' Calculated by taking weighted average of mean Black NAEP Math scores by county across the region, weighted by number of Black students who took the test in each county from NCES & NAEP, retrieved from Stanford Education Data Archive (Long Form, by County)

### Historically Black Colleges and Universities in the Black Rural South
Map of Black Rural South counties, overlaid with HBCUs in or near the Black Rural South counties.
- Historically Black Colleges and Universities that are either located within a Black Rural South county, or a neighbouring county.


# Scripts, Data & Outputs
- acs_childpoverty.R -- used to calculate child poverty rates from 2013-2017 ACS 5-Year Estimates. Input from data/cleaned.csv and data/acschildpoverty.csv, output into outputs/raw/acs_childpoverty.csv and figures/childpoverty_bar.png
- acs_poverty.R -- used to calculate poverty rates from 2013-2017 ACS 5-Year Estimates. Input from data/cleaned.csv and data/acs_poverty.csv, output into outputs/raw/acs_poverty.csv, figures/poverty_bar.png, and figures/white_poverty.png
- bls_long.R -- used to pull BLS data using API, calculate longitudinal unemployment rate, labor force level, and total population from BLS and Census data. Input directly from BLS API and data/cleaned.csv, output into outputs/raw/unemp.csv, outputs/raw/lf.csv, outputs/raw/pop.csv, figures/unemp_long.png, and figures/laborforce.png
- broadband.R -- used to calculate broadband and computer access makeup of different regions. Input from data/cleaned.csv and data/broadband.csv, output into outputs/broadband.csv and figures/broadband.png
- cleaning.R -- used to combine population data, rurality data, and percentage black/white into one data frame. Input from data/county_pop.csv and data/ruralcodes.csv, output into data/cleaned.csv
- commute.R -- [DEPRECATED] used to calculate mean travel times to work.
- demographics.R -- used to calculate demographic makeup of different regions. Input from data/cleaned.csv and data/demographics.csv, output into outputs/raw/demographics.csv and figures/demographics.png
- earnings.R -- used to calculate median earnings from 2013-2017 ACS 5-Year Estimates. Input from data/cleaned.csv, data/emp.csv, and data/earnings.csv, output into outputs/raw/earnings.csv and figures/earnings.png
- emp.R -- used to calculate unemployment and labor force participation rates from 2013-2017 ACS 5-Year Estimates. Input from data/cleaned.csv and data/emp.csv, output into outputs/raw/emp.csv, figures/lf_bar.png, figures/unemp_bar.png, and figures/white_unemp.png
- fipszip.R -- used to output a list of zip codes in the Black Rural South. Input from data/cleaned.csv and data/fips_zip.csv, output into data/fipsandziponly.csv
- gdp.R -- [DEPRECATED] used to calculate gdp and gdp per capita by region, from BEA data.
- gen_county_fips -- helper script, used in all scripts to generate lists of FIPS codes for each region.
- industries.R -- used to calculate employment growth in industries and overall from BEA data. Input from data/cleaned.csv and data/industries folder, output into outputs/raw/industries.csv, figures/emp_growth.png, figures/emp_growth_raw.png, and figures/industry_growth.png
- naep.R -- used to calculate mean NAEP scores. Input from data/cleaned.csv and data/naep.csv, output into outputs/raw/naep.csv, outputs/raw/naep_white.csv, figures/naep_ela.png, figures/naep_math.png, figures/white_naep_ela.png, and figures/white_naep_math.png
- saip_long.R -- used to calculate longitudinal median household income, poverty rate, and child poverty rate from the US Census SAIP. Input from data/cleaned.csv and data/pov_all.csv, output into outputs/raw/income.csv, outputs/raw/poverty.csv, figures/median_hhincome.png, figures/poverty_long.png, and figures/childpoverty_long.png
- tableau.R -- used to clean and produce data used to create Tableau maps -- includes identifier for Black Rural South County, % Black, identifier for 10/20/30 County, and HBCUs. Input from data/cleaned.csv, data/persistentpoverty.pdf, data/fipsandziponly.csv, and data/hbcu.csv, output into outputs/tableau.csv
- transportation.R -- used to calculate transportation breakdown by race from ACS Estimates. Input from data/cleaned.csv and data/transportation.csv, output into outputs/raw/transp.csv and figures/transportation.png


# Tableau
- Data file outputs/tableau.csv used as data source.
























