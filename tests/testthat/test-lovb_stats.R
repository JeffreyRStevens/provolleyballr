test_that("lovb_stats() works", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()

  result <- lovb_stats(team = "Omaha", year = 2025, level = "team")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 24)
  expect_true(all(
    c("year", "team", "opponent", "date", "points") %in% names(result)
  ))

  result <- lovb_stats(team = "Atlanta", year = 2026, level = "team")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 24)
  expect_true(all(
    c("year", "team", "opponent", "date", "points") %in% names(result)
  ))

  result <- lovb_stats(team = "Omaha", year = 2025, level = "player")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 27)
  expect_true(all(
    c("year", "team", "number", "player", "points") %in% names(result)
  ))

  result <- lovb_stats(team = "Nebraska", year = 2026, level = "player")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 27)
  expect_true(all(
    c("year", "team", "number", "player", "points") %in% names(result)
  ))

  expect_warning(
    lovb_stats(team = "Nebraska", year = 2025, level = "player"),
    "No data available for Nebraska in 2025"
  )
})
