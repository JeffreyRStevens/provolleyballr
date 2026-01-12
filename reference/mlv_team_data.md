# Major League Volleyball Team Match Statistics

A dataset containing team match-by-match statistics for Major League
Volleyball (MLV) teams for the 2024-2025 seasons.

## Usage

``` r
mlv_team_data
```

## Format

A data frame with 392 rows and 15 variables:

- year:

  Season year

- team:

  Team name

- date:

  Match date

- opponent:

  Opposing team name

- result:

  Win/Loss result

- kills:

  Kills - successful attacks that result in a point

- assists:

  Assists - sets that lead directly to a kill

- service_aces:

  Service Aces - serves that result directly in a point

- blocks:

  Blocks - successful defensive plays at the net

- out:

  Definition pending

- attack_attempts:

  Total attack attempts

- hitting_efficiency:

  Attack efficiency percentage

- digs:

  Digs - successful defensive plays

- digs_per_set:

  Digs per set

- sets_played:

  Sets played in the match

## Source

<https://provolleyball.com>

## See also

Other datasets:
[`au_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/au_player_data.md),
[`lovb_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_player_data.md),
[`lovb_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_team_data.md),
[`lovb_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_teams.md),
[`mlv_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_player_data.md),
[`mlv_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_teams.md)

## Examples

``` r
head(mlv_team_data)
#> # A tibble: 6 × 15
#>    year team    date     opponent result kills assists service_aces blocks   out
#>   <int> <chr>   <chr>    <chr>    <chr>  <int>   <int>        <int>  <int> <int>
#> 1  2024 Atlanta 01/24/2… atOmaha… W         62      58            2     16    49
#> 2  2024 Atlanta 01/26/2… atOrlan… W         52      46            5     13    39
#> 3  2024 Atlanta 02/01/2… vsSan D… W         43      40            6      9    28
#> 4  2024 Atlanta 02/09/2… vsGrand… L         52      52            2      9    43
#> 5  2024 Atlanta 02/12/2… vsOrlan… W         60      54            6     16    49
#> 6  2024 Atlanta 02/18/2… atGrand… L         66      62            3     11    48
#> # ℹ 5 more variables: attack_attempts <int>, hitting_efficiency <dbl>,
#> #   digs <int>, digs_per_set <dbl>, sets_played <int>
```
