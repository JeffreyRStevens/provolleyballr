# tests/testthat/test-group_stats.R

test_that("group_stats returns proper data for AU player level", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()
  skip_if_not(
    interactive()
  )

  result <- group_stats(league = "AU", year = 2025)
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 25)
  expect_true(nrow(result) == 44)
  expect_true(all(
    c("year", "rank", "player", "points") %in% names(result)
  ))
})

test_that("group_stats returns proper data for LOVB team level", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()
  skip_if_not(
    interactive()
  )

  result <- group_stats(league = "LOVB", year = 2025, level = "team")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 24)
  expect_true(all(
    c("year", "team", "opponent", "date", "points") %in% names(result)
  ))
})

test_that("group_stats returns proper data for LOVB player level", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()
  skip_if_not(
    interactive()
  )

  result <- group_stats(league = "LOVB", year = 2025, level = "player")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 27)
  expect_true(all(
    c("year", "team", "number", "player", "points") %in% names(result)
  ))
})

test_that("group_stats returns proper data for MLV team level", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()
  skip_if_not(
    interactive()
  )

  result <- group_stats(league = "MLV", year = 2025, level = "team")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 15)
  expect_true(all(
    c("year", "team", "date", "opponent", "result") %in% names(result)
  ))
})

test_that("group_stats returns proper data for MLV player level", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()
  skip_if_not(
    interactive()
  )

  result <- group_stats(league = "MLV", year = 2025, level = "player")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 23)
  expect_true(all(
    c("year", "team", "number", "player", "sets_played") %in% names(result)
  ))
})

test_that("group_stats handles invalid inputs appropriately", {
  expect_error(
    group_stats(league = "NHL", year = 2025, level = "team"),
    "Enter valid league"
  )

  expect_error(
    group_stats(league = "AU", year = 2017),
    "Enter valid year between 2021-2025"
  )

  expect_error(
    group_stats(league = "LOVB", year = 2017, level = "team"),
    "Enter valid year between 2025-2025"
  )

  expect_error(
    group_stats(league = "MLV", year = 2017, level = "team"),
    "Enter valid year between 2024-2025"
  )
})
