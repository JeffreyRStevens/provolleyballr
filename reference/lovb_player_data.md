# League One Volleyball Individual Player Statistics

A dataset containing individual player season statistics for League One
Volleyball (LOVB) players across the league for the 2025 season.

## Usage

``` r
lovb_player_data
```

## Format

A data frame with 94 rows and 27 variables:

- year:

  Season year

- team:

  Player's team name

- number:

  Player jersey number

- player:

  Player name

- points:

  Total Points

- matches_started:

  Matches Started

- sets_started:

  Sets Started

- sets_played:

  Sets Played

- hitting_efficiency:

  Attack Efficiency percentage

- kill_percentage:

  Kill percentage

- kills:

  Kills - successful attacks

- attack_errors:

  Attack Errors

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
[`lovb_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_team_data.md),
[`lovb_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_teams.md),
[`mlv_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_player_data.md),
[`mlv_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_team_data.md),
[`mlv_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_teams.md)

## Examples

``` r
head(lovb_player_data)
#>   year    team number         player points matches_started sets_started
#> 1 2025 Atlanta      8 Kayla Haneline     47               5           20
#> 2 2025 Atlanta      3   Marta Bechis      0               0            0
#> 3 2025 Atlanta     23    Kelsey Cook    198              16           66
#> 4 2025 Atlanta     10      Madi Bugg     24               9           36
#> 5 2025 Atlanta      9 Iga Wasilewska      1               1            1
#> 6 2025 Atlanta     17   Tessa Grubbs    103               5           20
#>   sets_played hitting_efficiency kill_percentage kills attack_errors
#> 1          23              0.350            48.3    29             6
#> 2          11              0.000             0.0     0             0
#> 3          66              0.220            33.5   166            32
#> 4          59              0.304            39.1     9             2
#> 5           2              0.333            33.3     1             0
#> 6          29              0.293            45.5    87            23
#>   attacks_blocked attack_attempts in_system_percentage reception_errors
#> 1               2              60                   50                0
#> 2               0               0                    0                0
#> 3              25             495                   60               13
#> 4               0              23                    0                0
#> 5               0               3                    0                0
#> 6               8             191                  100                0
#>   reception_attempts service_aces service_errors opponent_in_system_percentage
#> 1                  8            8             10                          33.8
#> 2                  0            0              2                          50.0
#> 3                270           19             19                          42.5
#> 4                  1            8             10                          39.8
#> 5                  0            0              0                          50.0
#> 6                  1            7             20                          20.8
#>   service_attempts blocks block_touch_percentage digs dig_percentage assists
#> 1               71     10                   38.3    8           80.0       1
#> 2                8      0                  100.0    2           66.7      13
#> 3              287     13                   47.5  218           87.9      17
#> 4              191      7                   49.0  125           82.8     397
#> 5                2      0                    0.0    0            0.0       0
#> 6               53      9                   59.4   35           92.1       0
#>   setting_efficiency
#> 1              0.000
#> 2              0.000
#> 3              0.164
#> 4              0.246
#> 5              0.000
#> 6             -0.400
```
