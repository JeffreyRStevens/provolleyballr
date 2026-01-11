test_that("mlv_stats() works", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()

  result <- mlv_stats(team = "Omaha", year = 2025, level = "team")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 15)
  expect_true(all(
    c("year", "team", "date", "opponent", "result") %in% names(result)
  ))

  result <- mlv_stats(
    team = "Omaha",
    year = 2025,
    level = "team",
    stored = FALSE
  )
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 15)
  expect_true(all(
    c("year", "team", "date", "opponent", "result") %in% names(result)
  ))

  result <- mlv_stats(team = "Omaha", year = 2025, level = "player")
  expect_true(ncol(result) == 23)
  expect_true(all(
    c("year", "team", "number", "player", "sets_played") %in% names(result)
  ))

  result <- mlv_stats(
    team = "Omaha",
    year = 2025,
    level = "player",
    stored = FALSE
  )
  expect_true(ncol(result) == 23)
  expect_true(all(
    c("year", "team", "number", "player", "sets_played") %in% names(result)
  ))

  expect_warning(
    mlv_stats(team = "Dallas", year = 2025, level = "player"),
    "No data available for Dallas in 2025"
  )
})
