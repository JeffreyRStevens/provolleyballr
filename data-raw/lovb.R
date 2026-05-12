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
# lovb_player_data <- group_stats(league = "LOVB", year = 2025, level = "player")
lovb_player_data_2025 <- read.csv("data-csv/lovb_player_data_2025.csv")
lovb_player_data_2026 <- read.csv("data-csv/lovb_player_data_2026.csv")
lovb_player_data <- dplyr::bind_rows(
  lovb_player_data_2025,
  lovb_player_data_2026
)
write.csv(lovb_player_data, "data-csv/lovb_player_data.csv", row.names = FALSE)
usethis::use_data(lovb_player_data, overwrite = TRUE)

# Create LOVB team data
# lovb_team_data <- group_stats(league = "LOVB", year = 2025, level = "team")
lovb_team_data_2025 <- read.csv("data-csv/lovb_team_data_2025.csv")
lovb_team_data_2026 <- read.csv("data-csv/lovb_team_data_2026.csv")
lovb_team_data <- dplyr::bind_rows(
  lovb_team_data_2025,
  lovb_team_data_2026
)
write.csv(lovb_team_data, "data-csv/lovb_team_data.csv", row.names = FALSE)
usethis::use_data(lovb_team_data, overwrite = TRUE)
