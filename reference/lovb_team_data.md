# League One Volleyball Team Match Statistics

A dataset containing team match-by-match statistics for League One
Volleyball (LOVB) teams for the 2025 season.

## Usage

``` r
lovb_team_data
```

## Format

A data frame with 96 rows and 24 variables:

- year:

  Season year

- team:

  Team name

- opponent:

  Opposing team name

- date:

  Match date

- points:

  Points scored

- hitting_efficiency:

  Attack efficiency percentage

- kill_percentage:

  Kill percentage

- kills:

  Kills - successful attacks that result in a point

- attack_errors:

  Attack Errors - unsuccessful attacks

- attacks_blocked:

  Attacks blocked by opponent

- attack_attempts:

  Total attack attempts

- in_system_percentage:

  In-system percentage

- reception_errors:

  Reception errors

- reception_attempts:

  Reception attempts

- service_aces:

  Service Aces - serves that result directly in a point

- service_errors:

  Service errors

- opponent_in_system_percentage:

  Opponent in-system percentage

- service_attempts:

  Service attempts

- blocks:

  Blocks - successful defensive plays at the net

- block_touch_percentage:

  Block touch percentage

- digs:

  Digs - successful defensive plays

- dig_percentage:

  Dig percentage

- assists:

  Assists - sets that lead directly to a kill

- setting_efficiency:

  Setting efficiency percentage

## Source

<https://lovb.com>

## See also

Other datasets:
[`au_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/au_player_data.md),
[`lovb_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_player_data.md),
[`lovb_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_teams.md),
[`mlv_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_player_data.md),
[`mlv_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_team_data.md),
[`mlv_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_teams.md)

## Examples

``` r
head(lovb_team_data)
#>   year    team  opponent       date points hitting_efficiency kill_percentage
#> 1 2025 Atlanta Salt Lake 01/08/2025     65              0.236            35.7
#> 2 2025 Atlanta    Austin 01/15/2025     77              0.236            41.9
#> 3 2025 Atlanta   Madison 01/25/2025     86              0.288            41.3
#> 4 2025 Atlanta Salt Lake 01/31/2025     64              0.367            46.8
#> 5 2025 Atlanta     Omaha 02/01/2025     77              0.203            39.2
#> 6 2025 Atlanta Salt Lake 02/07/2025     79              0.306            49.6
#>   kills attack_errors attacks_blocked attack_attempts in_system_percentage
#> 1    50            10               7             140                 50.0
#> 2    62            18               9             148                 63.1
#> 3    66            12               8             160                 52.7
#> 4    51             8               3             109                 45.9
#> 5    62            17              13             158                 58.8
#> 6    60            17               6             121                 50.7
#>   reception_errors reception_attempts service_aces service_errors
#> 1                1                 78            4              6
#> 2                4                 84            5             13
#> 3                5                 93            9             16
#> 4                4                 61            6              9
#> 5                2                 80            7             10
#> 6                0                 71           10             12
#>   opponent_in_system_percentage service_attempts blocks block_touch_percentage
#> 1                          46.2               93     11                   32.8
#> 2                          33.3               93     10                   41.8
#> 3                          37.9              103     11                   40.3
#> 4                          36.5               74      7                   52.2
#> 5                          42.1               95      8                   55.6
#> 6                          38.1               97      9                   47.7
#>   digs dig_percentage assists setting_efficiency
#> 1   66           76.7      47              0.237
#> 2   64           84.2      62              0.250
#> 3   71           86.6      62              0.275
#> 4   48           84.2      48              0.369
#> 5   55           80.9      58              0.192
#> 6   49           86.0      58              0.308
```
