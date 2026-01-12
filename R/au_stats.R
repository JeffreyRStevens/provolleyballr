#' Extract Data from Athletes Unlimited Volleyball Website
#'
#' This function scrapes player season statistics for Athletes Unlimited Volleyball (AU)
#' players from the official AU website
#' <https://auprosports.com/volleyball/>.
#'
#' @inheritParams get_stats
#'
#' @return A tibble containing team player season statistics.
#'
#' Player data include:
#'   year, rank, player, points, sets_played, kills, kills_per_set, attack_errors, attack_attempts, kill_percentage, assists, assists_per_set, setting_errors, service_aces, service_errors, service_aces_per_set, total_reception_attempts, reception_errors, positive_reception_percentage, digs, digs_per_set, blocks, blocks_per_set, block_assists, good_receptions
#'
#' @inherit mlv_stats note
#'
#' @family statistics functions
#'
#' @examplesIf interactive()
#' # Get 2025 player statistics
#' au_stats(year = 2025)
#'
#' @export
au_stats <- function(year = NULL, stored = TRUE) {
  # Validate inputs
  check_year(year = year, min = 2021)
  check_logical(name = "stored", value = stored)

  # Convert year to character
  year_option_text <- paste(year, "Volleyball")

  # For previous years, get data from pre-existing datasets
  current_year <- current_year()
  yr <- year
  if (yr < current_year & stored) {
    table <- provolleyballr::au_player_data |>
      dplyr::filter(.data$year == yr)
  } else {
    # For current year, scrape website
    url <- "https://auprosports.com/volleyball/stats/#season"

    # First check internet connection
    if (!curl::has_internet()) {
      message("No internet connection.")
      return(invisible(NULL))
    }

    tryCatch(
      # Open selenider_session and URL
      session <- selenider::selenider_session(
        "chromote",
        timeout = 5,
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

    # Select year
    s(".css-fyz21e-singleValue") |>
      selenider::elem_click()
    if (year == 2024) {
      s("input") |>
        selenider::elem_send_keys(selenider::keys$up, selenider::keys$enter)
    } else if (year == 2023) {
      s("input") |>
        selenider::elem_send_keys(
          selenider::keys$up,
          selenider::keys$up,
          selenider::keys$enter
        )
    } else if (year == 2022) {
      s("input") |>
        selenider::elem_send_keys(
          selenider::keys$up,
          selenider::keys$up,
          selenider::keys$up,
          selenider::keys$enter
        )
    } else if (year == 2021) {
      s("input") |>
        selenider::elem_send_keys(
          selenider::keys$up,
          selenider::keys$up,
          selenider::keys$up,
          selenider::keys$up,
          selenider::keys$enter
        )
    }

    Sys.sleep(2)

    # Get page source
    table <- selenider::get_page_source() |>
      rvest::html_element(
        css = '#block-stats-root > div.table-wrap > div > div.relative.css-rfns5p-Table > div.table-overflow.css-1r97v5e-Table > table'
      ) |>
      rvest::html_table()
    table <- table[, 1:24]
    colnames(table) <- colnames(provolleyballr::au_player_data)[-1]
    table <- table |>
      dplyr::filter(!is.na(rank)) |>
      dplyr::mutate(year = as.integer(year), .before = 1) |>
      dplyr::mutate(
        player = stringr::str_split_fixed(.data$player, " ", 2)[, 2]
      ) |>
      dplyr::mutate(
        dplyr::across(dplyr::where(is.character), ~ dplyr::na_if(.x, "\u2013")),
        dplyr::across("kills":"good_receptions", as.numeric)
      )

    selenider::close_session()
  }
  return(table)
}
