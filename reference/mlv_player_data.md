# Major League Volleyball Individual Player Statistics

A dataset containing individual player season statistics for Major
League Volleyball (MLV) players across the league for the 2024-2025
seasons.

## Usage

``` r
mlv_player_data
```

## Format

A data frame with 264 rows and 23 variables:

- year:

  Season year

- team:

  Player's team name

- number:

  Player jersey number

- player:

  Player name

- sets_played:

  Sets Played

- matches_played:

  Matches Played

- points:

  Total Points

- points_per_set:

  Points per Set

- kills:

  Kills - successful attacks

- kills_per_set:

  Kills per Set

- attack_errors:

  Attack Errors

- attack_attempts:

  Total Attacks

- hitting_efficiency:

  Attack Efficiency percentage

- assists:

  Assists - sets that lead directly to a kill

- assists_per_set:

  Assists per Set

- service_aces:

  Service Aces - serves that result directly in a point

- service_aces_per_set:

  Service Aces per Set

- serive_errors:

  Service Errors

- service_errors_per_set:

  Service Errors per Set

- digs:

  Digs - successful defensive plays

- digs_per_set:

  Digs per Set

- blocks:

  Blocks - successful defensive plays at the net

- blocks_per_set:

  Blocks per Set

## Source

<https://provolleyball.com>

## See also

Other datasets:
[`au_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/au_player_data.md),
[`lovb_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_player_data.md),
[`lovb_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_team_data.md),
[`lovb_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_teams.md),
[`mlv_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_team_data.md),
[`mlv_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_teams.md)

## Examples

``` r
head(mlv_player_data)
#> # A tibble: 6 × 23
#>    year team    number player   sets_played matches_played points points_per_set
#>   <int> <chr>    <dbl> <chr>          <dbl>          <dbl>  <dbl>          <dbl>
#> 1  2024 Atlanta     NA Edmond,…          89             24    438           4.92
#> 2  2024 Atlanta     NA Wade, G…          29             11     71           2.45
#> 3  2024 Atlanta     NA Nwokolo…           0              0      0           0   
#> 4  2024 Atlanta      1 Member-…          67             22    185           2.76
#> 5  2024 Atlanta      3 Fanning…          87             24    230           2.64
#> 6  2024 Atlanta      7 Lazarev…          59             17    278           4.71
#> # ℹ 15 more variables: kills <dbl>, kills_per_set <dbl>, attack_errors <dbl>,
#> #   attack_attempts <dbl>, hitting_efficiency <dbl>, assists <dbl>,
#> #   assists_per_set <dbl>, service_aces <dbl>, service_aces_per_set <dbl>,
#> #   serive_errors <dbl>, service_errors_per_set <dbl>, digs <dbl>,
#> #   digs_per_set <dbl>, blocks <dbl>, blocks_per_set <dbl>
```
