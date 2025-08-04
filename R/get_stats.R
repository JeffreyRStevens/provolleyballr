#' Extract Data from US Women's Pro Volleyball Websites
#'
#' This function scrapes team match-by-match and player season statistics for a specified
#' League One Volleyball (LOVB) or Pro Volleyball Federation (PVF) team and
#' year from the official website.
#'
#' @param league A character string specifying which league to retrieve. Must be
#' "LOVB" or "PVF".
#' @param team A character string specifying the team name or city. Accepts
#'   city names (e.g., "Omaha", "Atlanta") or variations like "Indianapolis"
#'   (converted to "Indy") and "Las Vegas" (converted to "Vegas"). Must match
#'   one of the valid LOVB or PVF team cities.
#' @param year A numeric value specifying the year for which to retrieve
#'   statistics. Must be 2024 or later, corresponding to available LOVB or PVF seasons.
#' @param level A character string specifying whether to extract the "team" or individual
#' "player" statistics.
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
#' get_stats(league = "PVF", team = "Omaha", year = 2024, level = "team")
#' get_stats(league = "PVF", team = "Omaha", year = 2024, level = "player")
#' get_stats(league = "LOVB", team = "Austin", year = 2025, level = "team")
#' get_stats(league = "LOVB", team = "Austin", year = 2025, level = "player")
#'
#' @export
get_stats <- function(league = NULL, team = NULL, year = NULL, level = NULL) {
  # Validate inputs
  check_match(name = "league", value = league, vec = c("LOVB", "PVF"))
  if (league == "LOVB") {
    check_year(year = year, min = 2025)
  } else {
    check_year(year = year, min = 2024)
  }
  check_match(name = "level", value = level, vec = c("player", "team"))

  # Apply league function
  if (league == "PVF") {
    pvf_stats(team = team, year = year, level = level)
  } else {
    lovb_stats(team = team, year = year, level = level)
  }
}
