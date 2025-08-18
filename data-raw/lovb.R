# Create LOVB teams dataset for the package

lovb_teams <- data.frame(
  name = c(
    "Atlanta",
    "Austin",
    "Houston",
    "Madison",
    "Nebraska",
    "Omaha",
    "Salt Lake"
  )
) |>
  dplyr::mutate(
    slug = tolower(gsub(" ", "-", name)),
    first_year = 2025
  )
usethis::use_data(lovb_teams, overwrite = TRUE)

# Create LOVB player data
lovb_player_data <- group_stats(league = "LOVB", year = 2025, level = "player")
usethis::use_data(lovb_player_data, overwrite = TRUE)

# Create LOVB team data
lovb_team_data <- group_stats(league = "LOVB", year = 2025, level = "team")
usethis::use_data(lovb_team_data, overwrite = TRUE)
