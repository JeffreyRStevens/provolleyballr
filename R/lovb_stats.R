#' Extract Data from League One Volleyball Website
#'
#' This function scrapes team match-by-match and player season statistics for League One
#' Volleyball (LOVB) teams from the official LOVB website
#' <https://www.lovb.com>.
#'
#' @inheritParams get_stats
#'
#' @return A tibble containing team match-by-match or player season statistics.
#'
#' Team match data include:
#'   year, team, opponent, date, points, hitting_efficiency, kill_percentage, kills, attack_errors, attacks_blocked, attack_attempts, in_system_percentage, reception_errors, reception_attempts, service_aces, service_errors, opponent_in_system_percentage, service_attempts, blocks, block_touch_percentage, digs, dig_percentage, assists, setting_efficiency
#'
#' Player data include:
#'   year, team, number, player, points, matches_started, sets_started, sets_played, hitting_efficiency, kill_percentage, kills, attack_errors, attacks_blocked, attack_attempts, in_system_percentage, reception_errors, reception_attempts, service_aces, service_errors, opponent_in_system_percentage, service_attempts, blocks, block_touch_percentage, digs, dig_percentage, assists, setting_efficiency
#'
#' @inherit pvf_stats note
#'
#' @family statistics functions
#'
#' @examplesIf interactive()
#' # Get Omaha Supernovas 2024 match statistics
#' lovb_stats(team = "Omaha", year = 2025, level = "team")
#' lovb_stats(team = "Omaha", year = 2025, level = "player")
#'
#' @export
lovb_stats <- function(team = NULL, year = NULL, level = NULL) {
  teams <- provolleyballr::lovb_teams

  # Validate inputs
  check_match(name = "team", value = team, vec = teams$name)
  check_year(year = year, min = 2025)
  check_match(name = "level", value = level, vec = c("player", "team"))

  # Get team name and fix likely city name issues
  team_lower <- tolower(team)

  # Get team name slug for URL
  if (team_lower %in% tolower(teams$name)) {
    slug <- teams$slug[which(team_lower == tolower(teams$name))]
  } else {
    cli::cli_abort("'{team}' not found in the list of teams: {teams$city}")
    return(invisible())
  }

  url <- paste0(
    "https://www.lovb.com/teams/lovb-",
    slug,
    "-volleyball"
  )

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

  # Get page source
  page_html <- selenider::get_page_source()

  # Extract team or player stats
  if (level == "team") {
    table <- extract_lovb_team_stats(page_html) |>
      dplyr::filter(.data$opponent != "Totals") |>
      dplyr::mutate(year = year, team = team, .before = 1)
  } else {
    table <- extract_lovb_player_stats(page_html) |>
      dplyr::filter(.data$player != "Totals") |>
      dplyr::mutate(year = year, team = team, .before = 1)
  }
  return(table)
}


extract_lovb_player_stats <- function(page_html) {
  # Extract data table
  numbers_col <- page_html |>
    rvest::html_elements(
      xpath = "/html/body/main/div[5]/div/div[2]/div[2]/div[1]"
    )

  numbers <- numbers_col |>
    rvest::html_elements(".text-sm") |>
    rvest::html_text2()

  data_table <- page_html |>
    rvest::html_elements(
      xpath = "/html/body/main/div[5]/div/div[2]/div[2]/div[2]/div"
    ) |>
    rvest::html_elements(".overflow-hidden")

  table_vec <- data_table |>
    rvest::html_elements(".h-10") |>
    rvest::html_text2()

  name_points <- extract_columns(
    start = 1,
    stop = "Appearances",
    ncols = 2,
    rowwise = FALSE,
    table_vec = table_vec
  )
  names(name_points) <- c("player", "points")

  appearances <- extract_columns(
    start = "Appearances",
    stop = "Attack",
    ncols = 3,
    table_vec = table_vec
  )
  names(appearances) <- c("matches_started", "sets_started", "sets_played")

  attack <- extract_columns(
    start = "Attack",
    stop = "Reception",
    ncols = 6,
    table_vec = table_vec
  )
  names(attack) <- c(
    "hitting_efficiency",
    "kill_percentage",
    "kills",
    "attack_errors",
    "attacks_blocked",
    "attack_attempts"
  )

  reception <- extract_columns(
    start = "Reception",
    stop = "Serving",
    ncols = 3,
    table_vec = table_vec
  )
  names(reception) <- c(
    "in_system_percentage",
    "reception_errors",
    "reception_attempts"
  )

  serving <- extract_columns(
    start = "Serving",
    stop = "Block",
    ncols = 4,
    table_vec = table_vec
  )
  names(serving) <- c(
    "service_aces",
    "service_errors",
    "opponent_in_system_percentage",
    "service_attempts"
  )

  block <- extract_columns(
    start = "Block",
    stop = "Defense",
    ncols = 2,
    table_vec = table_vec
  )
  names(block) <- c("blocks", "block_touch_percentage")

  defense <- extract_columns(
    start = "Defense",
    stop = "Setting",
    ncols = 2,
    table_vec = table_vec
  )
  names(defense) <- c("digs", "dig_percentage")

  setting <- extract_columns(
    start = "Setting",
    ncols = 2,
    table_vec = table_vec
  )
  names(setting) <- c("assists", "setting_efficiency")

  # Combine into data frame
  player_table <- dplyr::bind_cols(
    number = numbers,
    name_points,
    appearances,
    attack,
    reception,
    serving,
    block,
    defense,
    setting
  ) |>
    dplyr::mutate(
      dplyr::across(dplyr::everything(), ~ sub("\\%", "", x = .x)),
      dplyr::across(!.data$player, as.numeric)
    )

  selenider::close_session()

  return(player_table)
}

extract_lovb_team_stats <- function(page_html) {
  # Extract data table
  data_table <- page_html |>
    rvest::html_elements(
      xpath = "/html/body/main/div[5]/div/div[3]/div[2]/div[2]/div"
    ) |>
    rvest::html_elements(".overflow-hidden")

  table_vec <- data_table |>
    rvest::html_elements(".h-10") |>
    rvest::html_text2()

  opponent_points <- extract_columns(
    start = 1,
    stop = "Attack",
    ncols = 3,
    rowwise = FALSE,
    table_vec = table_vec
  )
  names(opponent_points) <- c("opponent", "date", "points")

  attack <- extract_columns(
    start = "Attack",
    stop = "Reception",
    ncols = 6,
    table_vec = table_vec
  )
  names(attack) <- c(
    "hitting_efficiency",
    "kill_percentage",
    "kills",
    "attack_errors",
    "attacks_blocked",
    "attack_attempts"
  )

  reception <- extract_columns(
    start = "Reception",
    stop = "Serving",
    ncols = 3,
    table_vec = table_vec
  )
  names(reception) <- c(
    "in_system_percentage",
    "reception_errors",
    "reception_attempts"
  )

  serving <- extract_columns(
    start = "Serving",
    stop = "Block",
    ncols = 4,
    table_vec = table_vec
  )
  names(serving) <- c(
    "service_aces",
    "service_errors",
    "opponent_in_system_percentage",
    "service_attempts"
  )

  block <- extract_columns(
    start = "Block",
    stop = "Defense",
    ncols = 2,
    table_vec = table_vec
  )
  names(block) <- c("blocks", "block_touch_percentage")

  defense <- extract_columns(
    start = "Defense",
    stop = "Setting",
    ncols = 2,
    table_vec = table_vec
  )
  names(defense) <- c("digs", "dig_percentage")

  setting <- extract_columns(
    start = "Setting",
    ncols = 2,
    table_vec = table_vec
  )
  names(setting) <- c("assists", "setting_efficiency")

  # Combine into data frame
  team_table <- dplyr::bind_cols(
    opponent_points,
    attack,
    reception,
    serving,
    block,
    defense,
    setting
  ) |>
    dplyr::mutate(
      dplyr::across(dplyr::everything(), ~ sub("\\%", "", x = .x)),
      dplyr::across(!c(.data$opponent, .data$date), as.numeric)
    )

  selenider::close_session()

  return(team_table)
}

# Function to extract column subsets
extract_columns <- function(
  start = 1,
  stop = NULL,
  ncols,
  rowwise = TRUE,
  table_vec
) {
  if (start == 1) {
    first <- 1
  } else {
    first <- which(table_vec == start) + 1
  }
  if (is.null(stop)) {
    last <- length(table_vec)
  } else {
    last <- which(table_vec == stop) - 1
  }
  table_vec[first:last] |>
    matrix(ncol = ncols, byrow = rowwise) |>
    data.frame() |>
    janitor::row_to_names(1)
}
