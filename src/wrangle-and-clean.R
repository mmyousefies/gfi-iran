if (!"package:tidyverse" %in% search()) library(tidyverse)
if (!"package:readxl" %in% search()) library(readxl)
gfi_2021.tbl <- file.path("intermediate-data","micro_irn.csv") |>
  read_csv() |> 
  mutate(
    year = 2021,
    ID = row_number()
  ) |> 
  select_if(~!all(is.na(.x)))
gfi_2017_1.tbl <- file.path(
  "intermediate-data",
  "IRN_2017_FINDEX_v02_M_EXCEL",
  "micro_irn_varlabel.xls"
  ) |> 
  read_xls() |> 
  mutate(
    year = 2017,
    ID = row_number()
    ) |> 
  select_if(~!all(is.na(.x)))
gfi_2017_2.tbl <- file.path(
  "intermediate-data",
  "IRN_2017_FINDEX_v02_M_EXCEL",
  "micro_irn_varname.xls"
) |> 
  read_xls() |> 
  mutate(
    year = 2017,
    ID = row_number()
  ) |> 
  select_if(~!all(is.na(.x)))
