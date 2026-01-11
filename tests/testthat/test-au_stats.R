test_that("au_stats() works", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()

  result <- au_stats(year = 2025)
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 25)
  expect_true(all(
    c("year", "rank", "player", "points") %in% names(result)
  ))

  result <- au_stats(year = 2021, stored = FALSE)
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 25)
  expect_true(all(
    c("year", "rank", "player", "points") %in% names(result)
  ))

  expect_warning(
    lovb_stats(team = "Nebraska", year = 2025, level = "player"),
    "No data available for Nebraska in 2025"
  )
})
