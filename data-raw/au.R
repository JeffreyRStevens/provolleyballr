
au_player_data <- readr::read_csv(c("data-csv/au2021.csv", "data-csv/au2022.csv", "data-csv/au2023.csv", "data-csv/au2024.csv", "data-csv/au2025.csv")) |> 
  dplyr::mutate(year = c(rep(2021L, 43), rep(2022L, 44), rep(2023L, 45), rep(2024L, 44), rep(2025L, 44)),
.before = 1)

usethis::use_data(au_player_data, overwrite = TRUE)
