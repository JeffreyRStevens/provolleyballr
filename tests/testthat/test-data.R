test_that("datasets are correct", {
  # Check teams dataset
  expect_equal(ncol(lovb_teams), 3)
  expect_equal(nrow(lovb_teams), 7)
  expect_equal(lovb_teams$name[1], "Atlanta")
  expect_equal(ncol(mlv_teams), 5)
  expect_equal(nrow(mlv_teams), 9)
  expect_equal(mlv_teams$city[1], "Atlanta")

  # Check team_data datasets
  expect_equal(ncol(lovb_team_data), 24)
  expect_equal(nrow(lovb_team_data), 96)
  expect_equal(lovb_team_data$date[1], "01/08/2025")
  expect_equal(ncol(mlv_team_data), 15)
  expect_equal(nrow(mlv_team_data), 392)
  expect_equal(mlv_team_data$date[1], "01/24/2024")

  # Check player_data datasets
  expect_equal(ncol(au_player_data), 25)
  expect_equal(nrow(au_player_data), 220)
  expect_equal(au_player_data$player[1], "Larson, Jordan")
  expect_equal(ncol(lovb_player_data), 27)
  expect_equal(nrow(lovb_player_data), 94)
  expect_equal(lovb_player_data$player[1], "Kayla Haneline")
  expect_equal(ncol(mlv_player_data), 23)
  expect_equal(nrow(mlv_player_data), 262)
  expect_equal(mlv_player_data$player[1], "Edmond, Leah")
})
