# Get Statistics for All Teams in a League

This function retrieves statistics for all teams in a specified league
(LOVB or MLV) and year(s).

## Usage

``` r
group_stats(league = NULL, year = NULL, level = NULL, stored = TRUE)
```

## Arguments

- league:

  A character string specifying which league to retrieve. Must be "AU",
  "LOVB" or "MLV".

- year:

  A numeric value specifying the year for which to retrieve statistics.
  Must be 2024 or later for LOVB or MLV and 2021 or later for AU.

- level:

  A character string specifying whether to extract the "team" or
  individual "player" statistics. AU has no team statistics.

- stored:

  A logical specifying whether to use stored data for previous years
  (TRUE is default) or force the function to scrape the website (FALSE)

## Value

A data frame containing statistics for all teams in the specified league
and year(s). The structure depends on the league and level:

- For MLV team-level: Team match statistics

- For MLV player-level: Individual player statistics

- For LOVB team-level: Team match statistics

- For LOVB player-level: Individual player statistics

## See also

Other statistics functions:
[`au_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/au_stats.md),
[`get_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/get_stats.md),
[`lovb_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_stats.md),
[`mlv_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_stats.md)

## Examples

``` r
if (FALSE) { # interactive()
# Get all team statistics for both leagues
au_team_data <- group_stats(league = "AU", year = 2021:2025)
lovb_team_data <- group_stats(league = "LOVB", year = 2025, level = "team")
lovb_player_data <- group_stats(league = "LOVB", year = 2025, level = "player")
mlv_team_data <- group_stats(league = "MLV", year = 2024:2025, level = "team")
mlv_player_data <- group_stats(league = "MLV", year = 2024:2025, level = "player")
}
```
