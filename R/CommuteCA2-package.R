#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

##############################################
##              CENSUS DATA                 ##
##############################################

#' 2021 Census of Population Test Data
#'
#' This object contains test data (fake observations created to represent the original version) of the Census of Population.
#'
#' @format A data frame object containing 20,000 rows and 17 variables; each row represents a unique (fake) respondent.
#'   \describe{
#'   \item{Frame_ID}{Unique identifier of the (fake) respondent.}
#'   \item{PRCDDA}{Refers to the dissemination area (DA) of current residence}
#'   \item{Pr}{Refers to the province or territory of current residence.}
#'   \item{CMA}{Census metropolitan area or census agglomeration of current residence.}
#'   \item{PCD}{Census division of current residence.}
#'   \item{CompW1}{Weight for the households and dwellings universes.}
#'   \item{LBR_FORC}{This variable refers to whether a person was employed, unemployed or not in the labour force.}
#'   \item{CfInc}{Total income of census family (sum of the total incomes of all members of that family).}
#'   \item{CFCNT}{Census family size (numbers of persons).}
#'   \item{CF_PnCF_NumEarners}{Number of earners in census family.}
#'   \item{PWDA}{Place of work dissemination area.}
#'   \item{PWPR}{Place of work province.}
#'   \item{PWCD}{Census metropolitan area or census agglomeration of place of work.}
#'   \item{PWCMA}{Place of work census division.}
#'   \item{PWDUR}{Commuting duration, it refers to the length of time, in minutes, usually required by a person to travel to their place of work.}
#'   \item{PWDist}{Distance (straight-line) from home to work.}
#'   \item{PwMode}{Main mode of commuting' refers to the main mode of transportation a person uses to travel to their place of work.}
#'}
#' @docType data
#' @keywords census test data
#' @name census_test_data
#' @usage data(census_test_data)
"census_test_data"

##############################################
##  TRAVEL TIMES AND IMPEDANCE FUNCTIONS    ##
##############################################

#' Maximum travel times in the Census Division.
#'
#' This object contains the maximum travel times for commuting to work for all Census Divisions (CD) in Canada,
#' obtained from the Census of Population (2021). The methodology to obtain this data set is described in the
#' R markdown 'making-data-v2.Rmd'.
#'
#' @format A simple feature class (sf) polygon object containing 1,083 rows and 3 variables; each row represents a combination of CD and transportation mode.
#'   \describe{
#'   \item{PCD}{Uniquely identifies a census division (composed of the 2-digit province or territory unique identifier followed by the 2-digit census division code).}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{Max_time_value}{Maximum travel time for the CD using the mentioned transportation mode.}
#'}
#' @docType data
#' @keywords maximum travel time in the census division
#' @name pcd_max_travel_times
#' @usage data(pcd_max_travel_times)
#' @source "[Census of Population 2021](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed September 11, 2024.
"pcd_max_travel_times"

#' Maximum travel times in the Census Metropolitan Area.
#'
#' This object contains the maximum travel times for commuting to work for all Census Metropolitan Area (CMA) in Canada,
#' obtained from the Census of Population (2021). The methodology to obtain this data set is described in the
#' R markdown 'making-data-v2.Rmd'.
#'
#' @format A simple feature class (sf) polygon object containing 596 rows and 3 variables; each row represents a combination of CMA and transportation mode.
#'   \describe{
#'   \item{CMA}{Uniquely identifies a CMA.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{Max_time_value}{Maximum travel time for the CMA using the mentioned transportation mode.}
#'}
#' @docType data
#' @keywords maximum travel time in the census metropolitan area
#' @name cma_max_travel_times
#' @usage data(cma_max_travel_times)
#' @source "[Census of Population 2021](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed September 11, 2024.
"cma_max_travel_times"

#' Impedance functions for Canadian Census Divisions
#'
#' This object contains impedance functions for Canadian Census Divisions (CDs)
#' for job destinations, considering different transportation modes ('Bike', 'Car', 'Transit', and 'Walk').
#' We estimated impedance functions  using the fitdistrplus package, using the 'PwDUR' (Commuting duration) of the 2021 Census of Population.
#' The best-fit function was defined by selecting the lowest Akaike information criterion.
#'
#' @format A data frame containing 675 rows and 12 variables; each row represents a unique function.
#'   \describe{
#'   \item{PCD}{Uniquely identifies the census division.}
#'   \item{Pr}{Province or Territory.}
#'   \item{CMA}{Census Metropolitan Area or Census Agglomeration unique identifier.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{distribution}{Name of the function that best adjusted the duration values considering the specific location and transportation mode (can be "exponential", "norm", “lnorm”, “gamma” or “unif”)}.
#'   \item{est_1}{Estimate of the first parameter for the function described in 'distribution.'}
#'   \item{est_2}{Estimate of the second parameter for the function described in 'distribution.'}
#'   \item{loglike}{Log-Likelihood obtained for the function 'distribution.'}
#'   \item{AIC}{Akaike information criterion obtained for function 'distribution.'}
#'   \item{BIC}{Bayesian information criterion obtained for function 'distribution.'}
#'}
#' @docType data
#' @keywords impedance functions decay distance census division pcd
#' @name pcd_impedance_functions
#' @usage data(pcd_impedance_functions)
#' @source "2021 Census of Population, informations about the census is available [here](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed December 19th 2024.
"pcd_impedance_functions"

#' Impedance functions for Census Metropolitan Areas and Census Agglomerations
#'
#' This object contains impedance functions for Census Metropolitan Areas
#' and Census Agglomerations (CMA/CAs), for job destinations,
#' considering different transportation modes ('Bike', 'Car', 'Transit', and 'Walk').
#' We estimated impedance functions  using the fitdistrplus package, using the 'PwDUR'
#' (Commuting duration) of the 2021 Census of Population.
#' The best-fit function was defined by selecting the lowest Akaike information criterion.
#'
#' @format A data frame containing 675 rows and 12 variables; each row represents a unique function.
#'   \describe{
#'   \item{CMA}{Census Metropolitan Area or Census Agglomeration unique identifier.}
#'   \item{Pr}{Province or Territory.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{distribution}{Name of the function that best adjusted the duration values considering the specific location and transportation mode (can be "exponential", "norm", “lnorm”, “gamma” or “unif”)}.
#'   \item{est_1}{Estimate of the first parameter for the function described in 'distribution.'}
#'   \item{est_2}{Estimate of the second parameter for the function described in 'distribution.'}
#'   \item{loglike}{Log-Likelihood obtained for the function 'distribution.'}
#'   \item{AIC}{Akaike information criterion obtained for function 'distribution.'}
#'   \item{BIC}{Bayesian information criterion obtained for function 'distribution.'}
#'}
#' @docType data
#' @keywords impedance functions decay distance census metropolitan area agglomerations cma ca
#' @name cma_impedance_functions
#' @usage data(cma_impedance_functions)
#' @source "2021 Census of Population, informations about the census is available [here](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed December 19th 2024.
"cma_impedance_functions"

#' Impedance functions for Canadian Provinces and Territories
#'
#' This object contains impedance functions for Canadian Provinces and Territories, for job destinations,
#' considering different transportation modes ('Bike', 'Car', 'Transit', and 'Walk')
#' and types of CMA/CAs ('Territories (outside CAs)','CMA/CA','Strong metropolitan influenced zone',
#' 'Moderate metropolitan influenced zone','Weak metropolitan influenced zone',
#' 'No metropolitan influenced zone'). We estimated impedance functions  using the fitdistrplus package, using the 'PwDUR'
#' (Commuting duration) of the 2021 Census of Population.
#' The best-fit function was defined by selecting the lowest Akaike information criterion.
#'
#' @format A data frame containing 675 rows and 12 variables; each row represents a unique function.
#'   \describe{
#'   \item{Pr}{Province or Territory.}
#'   \item{CMA_type}{Type of Census Metropolitan Area or Census Agglomeration (Possible values: 'Territories (outside CAs)','CMA/CA','Strong metropolitan influenced zone', 'Moderate metropolitan influenced zone','Weak metropolitan influenced zone', or 'No metropolitan influenced zone').}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{distribution}{Name of the function that best adjusted the duration values considering the specific location and transportation mode (can be "exponential", "norm", “lnorm”, “gamma” or “unif”)}.
#'   \item{est_1}{Estimate of the first parameter for the function described in 'distribution.'}
#'   \item{est_2}{Estimate of the second parameter for the function described in 'distribution.'}
#'   \item{loglike}{Log-Likelihood obtained for the function 'distribution.'}
#'   \item{AIC}{Akaike information criterion obtained for function 'distribution.'}
#'   \item{BIC}{Bayesian information criterion obtained for function 'distribution.'}
#'}
#' @docType data
#' @keywords impedance functions decay distance province territory census metropolitan area agglomerations
#' @name pr_impedance_functions
#' @usage data(pr_impedance_functions)
#' @source "2021 Census of Population, informations about the census is available [here](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed December 19th 2024.
"pr_impedance_functions"

##############################################
##              LAND USE                    ##
##############################################

#' Census Tract Land Use (General)
#'
#' This object contains the census tracts (CT) for all census metropolitan areas and census agglomerations (2021),
#' with land use information regarding the number of labour force and number of jobs of each CT.
#' CTs are small, relatively stable geographic areas that usually have a population of fewer than 7,500 persons,
#' based on data from the previous Census of Population Program. They are located in census metropolitan areas (CMAs)
#' and in census agglomerations (CAs) that had a core population of 50,000 or more in the previous census.
#' The labour force and number of jobs in each CT was obtained from the Census of Population. We calculated the labour force
#' by summing the number of employed people and the number of unemployed individuals who are still part of the workforce.
#' This is done by summing the weights of the census variable (CompW1). The number of jobs was obtained applying the
#' weighted sum for cases of respondents mentioning working in the DA.  Only cases of CT in accordance
#' with the Research Data Centre vetting rules were released. The methodology to obtain this data set is described in the
#' R markdown 'making-data-v2.Rmd'.
#'
#' @format A data frame containing 6,148 rows and 8 variables; each row represents a unique CT.
#'   \describe{
#'   \item{CTUID}{Uniquely identifies a census tract. Each CT is assigned a seven‑character numeric "name" (including leading zeros, decimal point and trailing zeros).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{CMAUID}{Census Metropolitan Area or Census Agglomeration unique identifier.}
#'   \item{CMANAME}{Census Metropolitan Area or Census Agglomeration name.}
#'   \item{PCD}{Uniquely identifies the census division.}
#'   \item{PRUID}{Uniquely identifies a province or territory.}
#'   \item{labour_force_rounded}{Number of individuals in labour force (employed or not), rounded to the nearest multiple of 5.}
#'   \item{jobs_rounded}{Number of jobs in this CT rounded to the nearest multiple of 5.}
#'}
#' @docType data
#' @keywords land use census tract general
#' @name land_use_CT_general
#' @usage data(land_use_CT_general)
#' @source "The 2021 census tracts areas files as created by the Canadian Census available [here](https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21) accessed May 6th 2024. All variable definitions are based on the definitions included in the census year 2021 boundary file reference guide (Boundary Files, Reference Guide, Second edition, 2021 Census. Statistics Canada Catalogue no. 92-160-G.).
"land_use_CT_general"



#' Census Tract Land Use (by Mode)
#'
#' This object contains the census tracts (CT) for all census metropolitan areas and census agglomerations (2021),
#' with land use information regarding the number of labour force (estimated) and number of jobs of each CT.
#' CTs are small, relatively stable geographic areas that usually have a population of fewer than 7,500 persons,
#' based on data from the previous Census of Population Program. They are located in census metropolitan areas (CMAs)
#' and in census agglomerations (CAs) that had a core population of 50,000 or more in the previous census.
#' The labour force and number of jobs in each CT was obtained from the Census of Population. We estimated the labour force
#' by calculating the proportion of trips made by each mode of transport in each census tract, then distributing
#' non-commuters (people who either don't work or work from home) among these transport modes. The number of jobs was obtained
#' applying the weighted sum for cases of respondents mentioning working in the DA.  Only cases of CT in accordance
#' with the Research Data Centre vetting rules were released. The methodology to obtain this data set is described in the
#' R markdown 'making-data-v2.Rmd'.
#'
#' @format A data frame containing 23,970 rows and 9 variables; each row represents a unique CT.
#'   \describe{
#'   \item{CTUID}{Uniquely identifies a census tract. Each CT is assigned a seven‑character numeric "name" (including leading zeros, decimal point and trailing zeros).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{CMAUID}{Census Metropolitan Area or Census Agglomeration unique identifier.}
#'   \item{CMANAME}{Census Metropolitan Area or Census Agglomeration name.}
#'   \item{PCD}{Uniquely identifies the census division.}
#'   \item{PRUID}{Uniquely identifies a province or territory.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{labour_force_est_rounded}{Estimated number of individuals in labour force (employed or not), rounded to the nearest multiple of 5.}
#'   \item{jobs_rounded}{Number of jobs in this CT rounded to the nearest multiple of 5.}
#'}
#' @docType data
#' @keywords land use census tract mode walk bike car transit
#' @name land_use_CT_mode
#' @usage data(land_use_CT_mode)
#' @source "The 2021 census tracts areas files as created by the Canadian Census available [here](https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21) accessed May 6th 2024. All variable definitions are based on the definitions included in the census year 2021 boundary file reference guide (Boundary Files, Reference Guide, Second edition, 2021 Census. Statistics Canada Catalogue no. 92-160-G.).
"land_use_CT_mode"

