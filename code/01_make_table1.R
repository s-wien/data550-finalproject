#setwd("C:/Users/swien/OneDrive - Emory University/GoodNotes/Courses/DATA-550/final-project")

#packages
pacman::p_load(tidyverse, #general data handling
               here,      #easy file referencing
               gtsummary, #Table 1
               labelled,  #labeling data
               gt)        #basic table

#loading data
here::i_am("code/01_make_table1.R")

data <- readRDS(
  file = here::here("data/data_clean.rds")
)

#labels for table 1
var_label(data) <- list(
  PREG = "Pregnant",
  RACE = "Race",
  REGION = "Region",
  HLTHINS = "Insurance",
  ADMYR = "Admission Year"
)

#making table 1
table_one <- data %>%
  select("PREG", "RACE", "REGION", "HLTHINS") %>%
  tbl_summary(by = REGION) %>%
  add_overall()

#saving table 1
saveRDS(
  table_one,
  file = here::here("tables/table_one.rds")
)