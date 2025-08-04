#' Get Statistics for All Teams in a League
#'
#' This function retrieves statistics for all teams in a specified league
#' (LOVB or PVF) and year(s).
#'
#' @inheritParams get_stats
#'
#' @return A data frame containing statistics for all teams in the specified
#'   league and year(s). The structure depends on the league and level:
#'   \itemize{
#'     \item For PVF team-level: Team match statistics
#'     \item For PVF player-level: Individual player statistics
#'     \item For LOVB team-level: Team match statistics
#'     \item For LOVB player-level: Individual player statistics
#'   }
#'
#' @family statistics functions
#'
#' @examplesIf interactive()
#' # Get all team statistics for both leagues
#' lovb_team_data <- group_stats(league = "LOVB", year = 2025, level = "team")
#' lovb_player_data <- group_stats(league = "LOVB", year = 2025, level = "player")
#' pvf_team_data <- group_stats(league = "PVF", year = 2024:2025, level = "team")
#' pvf_player_data <- group_stats(league = "PVF", year = 2024:2025, level = "player")
#' @export
group_stats <- function(league = NULL, year = NULL, level = NULL) {
  if (league == "PVF") {
    teams <- provolleyballr::pvf_teams$city
  } else {
    teams <- provolleyballr::lovb_teams$name
  }
  all_teams <- data.frame(
    teams = rep(teams, times = length(year)),
    years = rep(year, each = length(teams))
  ) |>
    dplyr::filter(.data$teams != "Indy" | .data$years != 2024)

  purrr::map2(
    all_teams$teams,
    all_teams$years,
    ~ get_stats(league = league, team = .x, year = .y, level = level)
  ) |>
    purrr::list_rbind()
}
