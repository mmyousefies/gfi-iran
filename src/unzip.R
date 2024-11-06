if (!"package:tidyverse" %in% search()) library(tidyverse)
if (!file.exists('intermediate-data')) dir.create('intermediate-data')
list.files(
  file.path('data'),
  pattern = "\\.zip$",
  full.names = T
  ) |> 
  walk(~unzip(.x,exdir = file.path('intermediate-data')))

