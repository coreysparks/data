library(tidycensus)
myvars <-c("ST","PUMA", "PWGTP", "AGEP", "SCHL", "SEX", "WAGP", "HISP","ESR" , "RAC1P", "OCCP", "FOD1P")

vars <-pums_variables

pums <- get_pums(year = 2019,
                 state = c("TX", "CA"), 
                 survey = "acs1",
                 variables =c("ST","PUMA", "PWGTP", "AGEP", "SCHL", "SEX", "WAGP", "HISP","ESR" , "RAC1P", "OCCP", "FOD1P"),
                 recode = T,
                 variables_filter = list(TYPE = 1) )


# pums<- pums%>%
#   filter(substr(pums$SERIALNO, 5,6) == "HU")


pumshh <- get_pums(year = 2019,
                 state = c("TX", "CA"), 
                 survey = "acs1",
                 variables =c("ST","PUMA","REGION", "NP", "ACCESS", "HISPEED", "TEN", "VALP"),
                 recode = T,
                 variables_filter = list(TYPE = 1, SPORDER=1) )

table(substr(pums$SERIALNO, 5,6))

readr::write_csv(pums, file  = "G:/My Drive/excelencia_uncf_gamma_shared_files/data/pums_tx_ca_2019.csv")

readr::write_csv(pumshh, file  = "G:/My Drive/excelencia_uncf_gamma_shared_files/data/pums_tx_ca_hh_2019.csv")


write.csv(vars[vars$var_code%in%names(pums), ], file = "G:/My Drive/excelencia_uncf_gamma_shared_files/data/pums_vars.csv", row.names = F)
write.csv(vars[vars$var_code%in%names(pumshh), ], file = "G:/My Drive/excelencia_uncf_gamma_shared_files/data/pums_hh_vars.csv", row.names = F)
