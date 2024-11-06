long_tbl_2017 <- gfi_2017_1.tbl |> 
  select(-c(Economy,`Economy Code`,`Gallup World Poll identifier`)) |> 
  mutate(
    `Respondent is female` = case_match(
      `Respondent is female`,
      'Male'~F,
      'Female'~T),
    `Respondent education level` = case_match(
      `Respondent education level`,
      c("(dk)","(rf)") ~ NA,
      .default = `Respondent education level`
    ),
    `Respondent is in the workforce` = case_match(
      `Respondent is in the workforce`,
      "in workforce" ~ T,
      "out of workforce" ~ F
    ),
    `Main source of emergency funds` = case_match(
      `Main source of emergency funds`,
      c("(dk)","ref") ~ NA,
      .default = `Main source of emergency funds`
    )
  ) |> 
  pivot_longer(
    cols = -c(
      year,
      ID,
      Weight,
      `Respondent is female`,
      `Respondent age`,
      `Respondent education level`,
      `Respondent is in the workforce`,
      `Within-economy household income quintile`,
      `Main source of emergency funds`,
      `Payments: wage payments`,
      `Payments: government transfers`,
      `Payments: government pension`,
      `Payments: utility bills`
      ),
    names_to = "Question",
    values_to = "Answers"
    ) |> 
  mutate(
    Answers = case_match(
      Answers,
      c("(ref)","(DK)","(dk)","ref","(Refused)") ~ NA,
      c("yes","Yes","Possible") ~ "1",
      c("no","No","Not possible") ~ "0",
      .default = Answers
      ),
    Answers = Answers |> as.integer() |> as.logical()) |> 
  group_by(ID) |> 
  mutate(Question_no = row_number()) |> 
  ungroup() |> 
  mutate(
    across(
      c(
        `Respondent is female`,
        `Respondent is in the workforce`,
        `Main source of emergency funds`,
        `Payments: wage payments`,
        `Payments: government transfers`,
        `Payments: government pension`,
        `Payments: utility bills`,
        `Answers`
      ),
      ~as.factor(.x)
    )
  ) |>
  mutate(
    `Respondent age` = case_when(
      is.na(`Respondent age`) ~ NA,
      `Respondent age` == "99+" ~ 100,
      .default = as.integer(`Respondent age`)
    ),
    `Respondent education level` = `Respondent education level` |> fct(),
    `Within-economy household income quintile` = `Within-economy household income quintile` |> fct()
  )
