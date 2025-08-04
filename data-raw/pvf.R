# Create PVF teams dataset for the package
pvf_teams <- data.frame(
  name = c(
    "Atlanta Vibe",
    "Columbus Fury",
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
    first_year = c(rep(2024, 3), 2025, rep(2024, 4))
  )
usethis::use_data(pvf_teams, overwrite = TRUE)

# Create PVF player data
pvf_player_data <- group_stats(
  league = "PVF",
  year = 2024:2025,
  level = "player"
)
usethis::use_data(pvf_player_data, overwrite = TRUE)

# Create PVF team data
pvf_team_data <- group_stats(league = "PVF", year = 2024:2025, level = "team")
usethis::use_data(pvf_team_data, overwrite = TRUE)
