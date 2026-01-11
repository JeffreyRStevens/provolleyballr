# tests/testthat/test-utils.R

test_that("check_logical validates year ranges correctly", {
  expect_silent(check_logical(name = "name", value = TRUE))

  expect_error(
    check_logical(),
    "Enter valid `name`"
  )
  expect_error(
    check_logical(name = "name"),
    "Enter valid `name` value "
  )
  expect_error(
    check_logical(name = "name", value = NA),
    "Enter valid value "
  )
})

test_that("check_match validates input correctly", {
  expect_silent(check_match(name = "test", value = "A", vec = c("A", "B")))
  expect_error(check_match(), "Enter valid `name`.")
  expect_error(check_match(name = "test"), "Enter valid test.")
  expect_error(check_match(name = "test", value = "A"), "Enter valid `vec`.")
  expect_error(
    check_match(name = "test", value = "C", vec = c("A", "B")),
    "Enter valid test"
  )
  expect_error(
    check_match(name = "test", value = NULL, vec = c("A", "B")),
    "Enter valid test"
  )
})

test_that("check_year validates year ranges correctly", {
  expect_silent(check_year(year = 2025, min = 2024))

  expect_error(
    check_year(),
    "Enter valid year."
  )
  expect_error(
    check_year(year = NA),
    "Enter valid year."
  )
  expect_error(
    check_year(year = 2024),
    "Enter valid minimum year."
  )
  expect_error(
    check_year(year = 2024, min = NA),
    "Enter valid minimum year."
  )
  expect_error(
    check_year(year = 2024, min = 2025),
    "Enter valid year between 2025"
  )
  expect_error(
    check_year(year = "2024", min = 2024),
    "Enter valid year between 2024"
  )
  expect_error(check_year(year = 2024:2025, min = 2024), "Enter a single year.")
})
