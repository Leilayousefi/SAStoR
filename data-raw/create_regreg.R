regreg <-read.csv("./data-raw/register.csv", check.names = TRUE)

devtools::use_data_raw(regreg)



## cmd + shift + L:devtools::load_all(".")
##regreg
##?regreg
rm(regreg)
# some code to go from raw data csv to a nice RDA object
# create_regreg

regreg <- readr::read_csv("./data-raw/register.csv")

# as factor
regreg$phase <- forcats::as_factor(regreg$phase)

# overwrite old data
devtools::use_data_raw(regreg)#, overwrite = TRUE
## cmd + shift + D:devtools::document(roclets = c('rd', 'collate', 'namespace'))
##regreg
##?regreg

#rm(regreg)
