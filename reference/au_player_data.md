# Athletes Unlimited Individual Player Statistics

A dataset containing individual player season statistics for Athletes
Unlimited (UA) players for the 2021-2025 seasons.

## Usage

``` r
au_player_data
```

## Format

A data frame with 220 rows and 25 variables:

- year:

  Season year

- rank:

  Player rank

- player:

  Player name

- points:

  Total points achieved

- sets_played:

  Sets played

- kills:

  Kills - successful attacks

- kills_per_set:

  Kills per set

- attack_errors:

  Attack Errors

- attack_attempts:

  Total attack attempts

- kill_percentage:

  Kill percentage

- assists:

  Assists - sets that lead directly to a kill

- assists_per_set:

  Assists per set

- setting_errors:

  Setting errors

- service_aces:

  Service Aces - serves that result directly in a point

- service_errors:

  Service errors

- service_aces_per_set:

  Service aces per set

- total_reception_attempts:

  Total reception attempts

- reception_errors:

  Reception errors

- positive_reception_percentage:

  Percentage of reception attempts that are either positive or perfect

- digs:

  Digs - successful defensive plays

- digs_per_set:

  Digs per set

- blocks:

  Blocks - successful defensive plays at the net

- blocks_per_set:

  Blocks per set

- block_assists:

  Block assists - two- or three-person blocks

- good_receptions:

  Number of positive receptions

## Source

<https://auprosports.com/volleyball/>

## See also

Other datasets:
[`lovb_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_player_data.md),
[`lovb_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_team_data.md),
[`lovb_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_teams.md),
[`mlv_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_player_data.md),
[`mlv_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_team_data.md),
[`mlv_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_teams.md)

## Examples

``` r
head(au_player_data)
#> # A tibble: 6 × 25
#>    year  rank player        points sets_played kills kills_per_set attack_errors
#>   <int> <int> <chr>          <int>       <int> <dbl>         <dbl>         <dbl>
#> 1  2021     1 Larson, Jord…   4569          45   213          4.73            79
#> 2  2021     2 De La Cruz-M…   3690          45   193          4.29            51
#> 3  2021     3 King, Brie      3675          45    20          0.44             3
#> 4  2021     4 Cruz, Aury      3582          42   171          4.07            54
#> 5  2021     5 Lowe, Karsta    3566          45   230          5.11            74
#> 6  2021     6 McClendon, D…   3127          44   118          2.68            58
#> # ℹ 17 more variables: attack_attempts <dbl>, kill_percentage <dbl>,
#> #   assists <dbl>, assists_per_set <dbl>, setting_errors <dbl>,
#> #   service_aces <dbl>, service_errors <dbl>, service_aces_per_set <dbl>,
#> #   total_reception_attempts <dbl>, reception_errors <dbl>,
#> #   positive_reception_percentage <dbl>, digs <dbl>, digs_per_set <dbl>,
#> #   blocks <dbl>, blocks_per_set <dbl>, block_assists <dbl>,
#> #   good_receptions <dbl>
```
