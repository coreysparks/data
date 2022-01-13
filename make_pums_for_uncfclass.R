library(tidycensus)
myvars <-c("ST", "PWGTP", "AGE", "SCHL", "SEX", "WAGP", "HISP","ESR" , "RAC1P", "OCCP", "FOD1P")

vars <-pums_variables
write.csv(vars[vars$var_code%in%myvars, ], file = "~/Documents/Github/data/pums_vars.csv", row.names = F)

pums <- get_pums(year = 2019, state = c("TX", "CA"), survey = "acs1",variables =c("ST", "PWGTP", "AGEP", "SCHL", "SEX", "WAGP", "HISP","ESR" , "RAC1P", "OCCP", "FOD1P"), recode = T, ,variables_filter = list(AGEP = 18:65) )

readr::write_csv(pums, file  = "~/Documents/Github/data/pums_tx_ca_2019.csv")
