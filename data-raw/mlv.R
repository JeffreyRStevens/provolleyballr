# Create PVF teams dataset for the package
mlv_teams <- data.frame(
  name = c(
    "Atlanta Vibe",
    "Columbus Fury",
    "Dallas Pulse",
    "Grand Rapids Rise",
    "Indy Ignite",
    "Omaha Supernovas",
    "Orlando Valkyries",
    "San Diego Mojo",
    "Vegas Thrill"
  )
) |>
  dplyr::mutate(
    city = stringr::str_remove(name, "\\s\\w+$"),
    mascot = stringr::str_trim(stringr::str_extract(name, "\\s\\w+$")),
    .before = 1
  ) |>
  dplyr::mutate(
    slug = tolower(gsub(" ", "-", name)),
    first_year = c(rep(2024, 2), 2026, 2024, 2025, rep(2024, 4))
  )
usethis::use_data(mlv_teams, overwrite = TRUE)

# Create PVF player data
mlv_player_data <- group_stats(
  league = "MLV",
  year = 2024:2025,
  level = "player"
)
write.csv(mlv_player_data, "data-csv/mlv_player_data.csv", row.names = FALSE)
usethis::use_data(mlv_player_data, overwrite = TRUE)

# Create PVF team data
mlv_team_data <- group_stats(league = "MLV", year = 2024:2025, level = "team")
write.csv(mlv_team_data, "data-csv/mlv_team_data.csv", row.names = FALSE)
usethis::use_data(mlv_team_data, overwrite = TRUE)
