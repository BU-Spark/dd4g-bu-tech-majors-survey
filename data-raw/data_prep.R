library(tidyverse)

survey_file <- "data-raw/2024 DEITC Student Survey_March 11, 2024_Final All.csv"

headers <- read_csv(survey_file, n_max = 1)
df <- read_csv(survey_file,
               skip = 2,
               col_names = FALSE) %>%
    setNames(names(headers))

original_question_df <- headers %>%
    pivot_longer(everything(), names_to = "question_id", values_to = "question_text")


save(original_question_df, file = "R/original_question_df.rda")

ddf <- df %>%
  mutate(work_status = Q21) %>%
  mutate(prep = Q10) %>%
  rename(
    major = Q1,
    major_other_txt = Q1_7_TEXT,
    grad_year = Q2,
    minor = Q3,
    minor_other_txt = Q3_6_TEXT,
    first_gen = Q4,
    international = Q5,
    international_other_txt = Q5_3_TEXT,
    gender = Q6,
    gender_other = Q6_4_TEXT,
    race = Q7,
    race_other_txt = Q7_8_TEXT,
    ## pronouns = Q8,
    ## pronouns_other_txt = Q8_15_TEXT
  )
save(ddf, file = "R/ddf.rda")
