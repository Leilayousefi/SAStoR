install.packages("devtools")
library(devtools)
install.packages("usethis")
library(usethis)
install.packages("roxygen2")
library(roxygen2)
# some code to go from raw data csv to a nice RDA object
# create_regregtest

regreg <- readr::read_csv("./data-raw/register.csv")

# as factor
regreg$phase <- forcats::as_factor(regreg$phase)

#give nice name
regreg <- dplyr::rename(regreg, date = `entry-timestamp`)

# copyright looks empty
regreg <- dplyr::select(regreg, -copyright)

## cmd + shift + L:devtools::load_all(".")
devtools::load_all(".")
##regreg
##?regreg

# overwrite old data
devtools::use_data(regreg, overwrite = TRUE)

## cmd + shift + D:devtools::
document(roclets = c('rd', 'collate', 'namespace'))
##regreg
##?regreg

rm(regreg)
