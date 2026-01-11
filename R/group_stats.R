#' Get Statistics for All Teams in a League
#'
#' This function retrieves statistics for all teams in a specified league
#' (LOVB or MLV) and year(s).
#'
#' @inheritParams get_stats
#'
#' @return A data frame containing statistics for all teams in the specified
#'   league and year(s). The structure depends on the league and level:
#'   \itemize{
#'     \item For MLV team-level: Team match statistics
#'     \item For MLV player-level: Individual player statistics
#'     \item For LOVB team-level: Team match statistics
#'     \item For LOVB player-level: Individual player statistics
#'   }
#'
#' @family statistics functions
#'
#' @examplesIf interactive()
#' # Get all team statistics for both leagues
#' au_team_data <- group_stats(league = "AU", year = 2021:2025)
#' lovb_team_data <- group_stats(league = "LOVB", year = 2025, level = "team")
#' lovb_player_data <- group_stats(league = "LOVB", year = 2025, level = "player")
#' mlv_team_data <- group_stats(league = "MLV", year = 2024:2025, level = "team")
#' mlv_player_data <- group_stats(league = "MLV", year = 2024:2025, level = "player")
#' @export
group_stats <- function(league = NULL, year = NULL, level = NULL) {
  check_match(name = "league", value = league, vec = c("AU", "LOVB", "MLV"))
  if (league == "AU") {
    check_year(min(year), min = 2021)
  } else if (league == "LOVB") {
    check_year(min(year), min = 2025)
  } else {
    check_year(min(year), min = 2024)
  }
  if (league == "LOVB") {
    teams <- provolleyballr::lovb_teams$name
  } else if (league == "MLV") {
    teams <- provolleyballr::mlv_teams$city
  } else {
    teams <- "none"
  }
  all_teams <- data.frame(
    teams = rep(teams, times = length(year)),
    years = rep(year, each = length(teams))
  ) |>
    dplyr::filter(.data$teams != "Indy" | .data$years >= 2025) |>
    dplyr::filter(.data$teams != "Dallas" | .data$years >= 2026) |>
    dplyr::filter(
      .data$teams != "Omaha" | league != "LOVB" | .data$years == 2025
    ) |>
    dplyr::filter(
      .data$teams != "Nebraska" | league != "LOVB" | .data$years >= 2026
    )

  purrr::map2(
    all_teams$teams,
    all_teams$years,
    ~ get_stats(league = league, team = .x, year = .y, level = level)
  ) |>
    purrr::list_rbind()
}
