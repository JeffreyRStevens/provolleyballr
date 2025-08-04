test_that("datasets are correct", {
  # Check teams dataset
  expect_equal(ncol(lovb_teams), 3)
  expect_equal(nrow(lovb_teams), 6)
  expect_equal(lovb_teams$name[1], "Atlanta")
  expect_equal(ncol(pvf_teams), 5)
  expect_equal(nrow(pvf_teams), 8)
  expect_equal(pvf_teams$city[1], "Atlanta")

  # Check team_data datasets
  expect_equal(ncol(lovb_team_data), 24)
  expect_equal(nrow(lovb_team_data), 96)
  expect_equal(lovb_team_data$date[1], "01/08/2025")
  expect_equal(ncol(pvf_team_data), 15)
  expect_equal(nrow(pvf_team_data), 392)
  expect_equal(pvf_team_data$date[1], "01/24/2024")

  # Check player_data datasets
  expect_equal(ncol(lovb_player_data), 27)
  expect_equal(nrow(lovb_player_data), 94)
  expect_equal(lovb_player_data$player[1], "Kayla Haneline")
  expect_equal(ncol(pvf_player_data), 23)
  expect_equal(nrow(pvf_player_data), 264)
  expect_equal(pvf_player_data$player[1], "Edmond, Leah")
})
