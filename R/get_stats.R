#' Extract Data from US Women's Professional Volleyball Websites
#'
#' This function scrapes team match-by-match and player season statistics for
#' Athletes Unlimited (UA), League One Volleyball (LOVB), or Major League Volleyball (MLV)
#' players and teams from the official websites.
#'
#' @param league A character string specifying which league to retrieve. Must be
#' "AU", "LOVB" or "MLV".
#' @param team A character string specifying the team name or city. Accepts
#'   city names (e.g., "Omaha", "Atlanta") or variations like "Indianapolis"
#'   (converted to "Indy") and "Las Vegas" (converted to "Vegas"). Must match
#'   one of the valid LOVB or MLV team cities. AU has no teams.
#' @param year A numeric value specifying the year for which to retrieve
#'   statistics. Must be 2024 or later for LOVB or MLV and 2021 or later for AU.
#' @param level A character string specifying whether to extract the "team" or individual
#' "player" statistics. AU has no team statistics.
#'
#' @return A tibble containing team match-by-match or player season statistics.
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
#' get_stats(league = "AU", year = 2025)
#' get_stats(league = "LOVB", team = "Austin", year = 2025, level = "team")
#' get_stats(league = "LOVB", team = "Austin", year = 2025, level = "player")
#' get_stats(league = "MLV", team = "Omaha", year = 2024, level = "team")
#' get_stats(league = "MLV", team = "Omaha", year = 2024, level = "player")
#'
#' @export
get_stats <- function(league = NULL, team = NULL, year = NULL, level = NULL) {
  # Validate inputs
  check_match(name = "league", value = league, vec = c("AU", "LOVB", "MLV"))
  if (league == "AU") {
    check_year(year = year, min = 2021)
  } else if (league == "LOVB") {
    check_year(year = year, min = 2025)
    check_match(name = "level", value = level, vec = c("player", "team"))
  } else {
    check_year(year = year, min = 2024)
    check_match(name = "level", value = level, vec = c("player", "team"))
  }

  # Apply league function
  if (league == "AU") {
    au_stats(year = year)
  } else if (league == "LOVB") {
    lovb_stats(team = team, year = year, level = level)
  } else {
    mlv_stats(team = team, year = year, level = level)
  }
}
