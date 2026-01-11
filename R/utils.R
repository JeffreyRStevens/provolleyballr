#' Assigns current year
#'
#' @keywords internal
#'
current_year <- function() {
  2026
}

#' Checks if a logical input is valid
#'
#' @param name Argument name.
#' @param value Argument value.
#'
#' @keywords internal
#'
check_logical <- function(name = NULL, value = NULL) {
  if (is.null(name)) {
    cli::cli_abort(paste0("Enter valid `name`."))
  }
  if (is.null(value)) {
    cli::cli_abort(paste0("Enter valid `{name}` value (TRUE or FALSE)."))
  }
  if (is.na(value)) {
    cli::cli_abort(paste0("Enter valid value (TRUE or FALSE)."))
  }
  if (!is.logical(value)) {
    cli::cli_abort("`{name}` must be a logical (TRUE or FALSE).")
  }
}


#' Checks if value is matched in vector
#'
#' @param name Argument name.
#' @param value Value.
#' @param vec Vector.
#'
#' @keywords internal
#'
check_match <- function(name = NULL, value = NULL, vec = NULL) {
  if (is.null(name)) {
    cli::cli_abort(paste0("Enter valid `name`."))
  }
  if (is.null(value)) {
    cli::cli_abort(paste0("Enter valid {name}."))
  }
  if (is.null(vec)) {
    cli::cli_abort(paste0("Enter valid `vec`."))
  }
  if (length(value) > 1) {
    cli::cli_abort("Enter single value for {name}.")
  }
  if (!value %in% vec) cli::cli_abort("Enter valid {name}: {vec}.")
}

#' Checks if year is valid
#'
#' @param year Year.
#' @param min Numeric for minimum year available.
#'
#' @keywords internal
#'
check_year <- function(year = NULL, min = NULL) {
  max_year <- current_year()
  if (length(year) > 1) {
    cli::cli_abort("Enter a single year.")
  }
  if (is.null(year) || is.na(year)) {
    cli::cli_abort(paste0("Enter valid year."))
  }
  if (is.null(min) || is.na(min)) {
    cli::cli_abort(paste0("Enter valid minimum year."))
  }
  if (!is.numeric(year) || !all(year %in% min:max_year)) {
    cli::cli_abort(paste0("Enter valid year between {min}-{max_year}."))
  }
}
