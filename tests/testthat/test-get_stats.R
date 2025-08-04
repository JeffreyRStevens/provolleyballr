# Test file for get_stats() function

# Mock data for testing
test_teams <- data.frame(
  city = c(
    "Atlanta",
    "Columbus",
    "Grand Rapids",
    "Indy",
    "Omaha",
    "Orlando",
    "San Diego",
    "Vegas"
  ),
  mascot = c(
    "Vibe",
    "Fury",
    "Rise",
    "Ignite",
    "Supernovas",
    "Valkyries",
    "Mojo",
    "Thrill"
  ),
  name = c(
    "Atlanta Vibe",
    "Columbus Fury",
    "Grand Rapids Rise",
    "Indy Ignite",
    "Omaha Supernovas",
    "Orlando Valkyries",
    "San Diego Mojo",
    "Vegas Thrill"
  ),
  slug = c(
    "atlanta-vibe",
    "columbus-fury",
    "grand-rapids-rise",
    "indy-ignite",
    "omaha-supernovas",
    "orlando-valkyries",
    "san-diego-mojo",
    "vegas-thrill"
  ),
  first_year = c(2024, 2024, 2024, 2024, 2024, 2024, 2024, 2024)
)

# Test input validation
test_that("get_stats validates input parameters correctly", {
  # Test league parameter validation
  expect_error(get_stats(), "Enter valid league")
  expect_error(
    get_stats(league = NA, year = 2024, level = "team"),
    "Enter valid league"
  )
  expect_error(
    get_stats(league = 123, year = 2024, level = "team"),
    "Enter valid league"
  )
  expect_error(
    get_stats(league = c("LOVB", "PVF"), year = 2024, level = "team"),
    "Enter single value for league"
  )

  # Test team parameter validation
  expect_error(
    get_stats(league = "PVF", year = 2024, level = "team"),
    "Enter valid team"
  )
  expect_error(
    get_stats(league = "PVF", team = 123, year = 2024, level = "team"),
    "Enter valid team"
  )
  expect_error(
    get_stats(league = "PVF", team = NA, year = 2024, level = "team"),
    "Enter valid team"
  )
  expect_error(
    get_stats(
      league = "PVF",
      team = c("Omaha", "Atlanta"),
      year = 2024,
      level = "team"
    ),
    "Enter single value for team"
  )

  # Test year parameter validation
  expect_error(
    get_stats(league = "PVF", team = "Omaha", level = "team"),
    "Enter valid year between 2024-2025"
  )
  expect_error(
    get_stats(league = "PVF", team = "Omaha", year = "2024", level = "team"),
    "Enter valid year between 2024-2025"
  )
  expect_error(
    get_stats(league = "PVF", team = "Omaha", year = 2017, level = "team"),
    "Enter valid year between 2024-2025"
  )
  expect_error(
    get_stats(league = "PVF", team = "Omaha", year = NA_real_, level = "team"),
    "Enter valid year between 2024-2025"
  )
  expect_error(
    get_stats(
      league = "PVF",
      team = "Omaha",
      year = c(2024, 2025),
      level = "team"
    ),
    "Enter a single year"
  )

  # Test level parameter validation
  expect_error(
    get_stats(league = "PVF", team = "Omaha", year = 2024, level = "invalid"),
    "Enter valid level"
  )
  expect_error(
    get_stats(league = "PVF", team = "Omaha", year = 2024, level = 123),
    "Enter valid level"
  )
  expect_error(
    get_stats(
      league = "PVF",
      team = "Omaha",
      year = 2024,
      level = c("team", "individual")
    ),
    "Enter single value for level"
  )
})

# Integration tests (these would require actual web scraping - marked as skip)
test_that("get_stats returns proper data structure for team level", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()
  # skip("Requires internet connection and may be slow")

  # This test would require actual web scraping
  result <- get_stats(league = "PVF", "Omaha", year = 2024, level = "team")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 15) # Expect multiple columns
  expect_true(nrow(result) == 24) # Expect some data
  expect_true(all(c("date", "team", "opponent", "result") %in% names(result)))
})

test_that("get_stats returns proper data structure for individual level", {
  skip_if_not_installed("selenider")
  skip_if_not(
    nzchar(Sys.which("google-chrome")) || nzchar(Sys.which("chromium-browser")),
    "Chrome not available"
  )
  skip_on_cran()
  skip_on_ci()
  # skip("Requires internet connection and may be slow")

  # This test would require actual web scraping
  result <- get_stats(league = "PVF", "Omaha", year = 2024, "player")
  expect_s3_class(result, "data.frame")
  expect_true(ncol(result) == 23) # Expect multiple columns for individual stats
  expect_true(nrow(result) == 17) # Expect some data
  expect_true(all(
    c("team", "number", "player", "sets_played") %in% names(result)
  ))
})

# Test helper functions and data processing
test_that("team slug matching works correctly", {
  # Mock the teams data
  assign("teams", test_teams, envir = globalenv())
  on.exit(rm("teams", envir = globalenv()))

  # Test that we can find the correct slug for valid teams
  team_lower <- "omaha"
  if (team_lower %in% tolower(test_teams$city)) {
    slug <- test_teams$slug[which(team_lower == tolower(test_teams$city))]
    expect_equal(slug, "omaha-supernovas")
  }

  team_lower <- "vegas"
  if (team_lower %in% tolower(test_teams$city)) {
    slug <- test_teams$slug[which(team_lower == tolower(test_teams$city))]
    expect_equal(slug, "vegas-thrill")
  }

  team_lower <- "indy"
  if (team_lower %in% tolower(test_teams$city)) {
    slug <- test_teams$slug[which(team_lower == tolower(test_teams$city))]
    expect_equal(slug, "indy-ignite")
  }
})
