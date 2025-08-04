#' Extract Data from Pro Volleyball Federation Website
#'
#' This function scrapes team match-by-match and player season statistics for Pro
#' Volleyball Federation (PVF) teams from the official PVF website
#' <https://provolleyball.com>.
#'
#' @inheritParams get_stats
#'
#' @return A tibble containing team match-by-match or player season statistics.
#'
#' Team match data include:
#' year, team, date, opponent, result, kills, assists, service_aces, blocks, out, attack_attempts, hitting_efficiency, digs, digs_per_set, sets_played
#'
#' Player data include:
#' year, team, number, player, sets_played, matches_played, points, points_per_set, kills, kills_per_set, attack_errors, attack_attempts, hitting_efficiency, assists, assists_per_set, service_aces, service_aces_per_set, serive_errors, service_errors_per_set, digs, digs_per_set, blocks, blocks_per_set
#'
#' @note This function requires:
#' * The <a href="https://ashbythorpe.github.io/selenider/"><code>\{selenider\}</code></a> R package
#'  for web automation
#' * [Google Chrome](https://www.google.com/chrome/) browser installed on the system
#' * An active internet connection
#'
#' The function uses a headless Chrome browser session, so no browser window
#' will be visible during execution. Browser sessions are automatically closed
#' after data extraction.
#'
#' @family statistics functions
#'
#' @examplesIf interactive()
#' # Get Omaha Supernovas 2024 match statistics
#' pvf_stats(team = "Omaha", year = 2024, level = "team")
#' pvf_stats(team = "Omaha", year = 2024, level = "player")
#'
#' @export
pvf_stats <- function(team = NULL, year = NULL, level = NULL) {
  teams <- provolleyballr::pvf_teams

  # Validate inputs
  check_match(name = "team", value = team, vec = teams$city)
  check_year(year = year, min = 2024)
  check_match(name = "level", value = level, vec = c("player", "team"))

  # Get team name and fix likely city name issues
  team_lower <- tolower(team) |>
    sub("indianapolis", "indy", x = _) |>
    sub("las vegas", "vegas", x = _)
  team_name <- teams$name[which(team_lower == tolower(teams$city))]

  # Create team name slug for URL
  if (team_lower %in% tolower(teams$city)) {
    slug <- teams$slug[which(team_lower == tolower(teams$city))]
  } else {
    cli::cli_abort("'{team}' not found in the list of teams: {teams$city}")
    return(invisible())
  }

  # Convert level to url slug
  if (level == "team") {
    level_slug <- "matchByMatch"
  } else {
    level_slug <- "individual"
  }

  if (team_lower == "indy" & year < 2025) {
    cli::cli_warn(
      "No data available for {stringr::str_to_title(team)} in {year}."
    )
  } else {
    # Create URL
    url <- paste0(
      "https://provolleyball.com/teams/",
      slug,
      "/statistics?tab=",
      level_slug
    )

    # Convert year to character
    year_option_text <- as.character(year)

    # First check internet connection
    if (!curl::has_internet()) {
      message("No internet connection.")
      return(invisible(NULL))
    }

    tryCatch(
      # Open selenider_session and URL
      session <- selenider::selenider_session(
        "chromote",
        timeout = 10,
        options = selenider::chromote_options(headless = TRUE)
      ),
      error = function(cnd) {
        cli::cli_abort(
          "Unable to proceed. Ensure Google Chrome and the R package `selenider` are installed."
        )
      }
    )
    selenider::open_url(url = url)
    Sys.sleep(2)

    # Extract data table
    if (level == "player") {
      selenider::s("div.dropdown[data-v-ce723b48=''] select") |>
        selenider::elem_select(text = year_option_text)
      Sys.sleep(2)
      table <- session |>
        selenider::get_page_source() |>
        rvest::html_element("table") |>
        rvest::html_table(header = FALSE)
      colnames(table) <- c(
        "number",
        "player",
        "sets_played",
        "matches_played",
        "points",
        "points_per_set",
        "kills",
        "kills_per_set",
        "attack_errors",
        "attack_attempts",
        "hitting_efficiency",
        "assists",
        "assists_per_set",
        "service_aces",
        "service_aces_per_set",
        "serive_errors",
        "service_errors_per_set",
        "digs",
        "digs_per_set",
        "blocks",
        "blocks_per_set",
        "ball_handling_errors"
      )
      table <- table |>
        dplyr::slice(-c(1:3)) |>
        dplyr::mutate(
          hitting_efficiency = sub("\\%", "", .data$hitting_efficiency),
          dplyr::across(!c("player"), as.numeric)
        ) |>
        dplyr::mutate(year = year, team = team, .before = 1)
    } else {
      selenider::s("div.dropdown[data-v-99032de0=''] select") |>
        selenider::elem_select(text = year_option_text)
      Sys.sleep(2)
      table <- session |>
        selenider::get_page_source() |>
        rvest::html_element("table") |>
        rvest::html_table() |>
        dplyr::mutate(EFF = as.numeric(sub("\\%", "", .data$EFF))) |>
        dplyr::mutate(Year = year, .before = 1) |>
        dplyr::mutate(Team = team, .after = "Year") |>
        dplyr::relocate(.data$`AVG/S`, .after = "DIG")
      colnames(table) <- c(
        "year",
        "team",
        "date",
        "opponent",
        "result",
        "kills",
        "assists",
        "service_aces",
        "blocks",
        "out",
        "attack_attempts",
        "hitting_efficiency",
        "digs",
        "digs_per_set",
        "sets_played"
      )
    }

    selenider::close_session()

    return(table)
  }
}
