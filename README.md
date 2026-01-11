
<!-- README.md is generated from README.Rmd. Please edit that file -->

# provolleyballr <a href="https://jeffreyrstevens.github.io/provolleyballr/"><img src="man/figures/logo.png" align="right" height="139" alt="provolleyballr website" /></a>

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

The
[`{provolleyballr}`](https://jeffreyrstevens.github.io/provolleyballr) R
package provides tools for scraping match statistics and player data
from [Athletes Unlimited](%3Chttps://auprosports.com/volleyball),
[League One Volleyball (LOVB)](https://lovb.com) and [Major League
Volleyball (MLV)](https://provolleyball.com) (formerly the Pro
Volleyball Federation) websites.

## Installation

You can install the development version of provolleyballr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("JeffreyRStevens/provolleyballr")
```

## System Requirements

This package requires:

- The [`{selenider}`](https://ashbythorpe.github.io/selenider/) R
  package for web automation
- [Google Chrome](https://www.google.com/chrome/) browser installed on
  your system
- Active internet connection

## Basic Usage

### Load the Package

``` r
library(provolleyballr)
```

### Available Teams

The package includes information about all LOVB and MLV teams:

``` r
# View available teams
lovb_teams
#>        name      slug first_year
#> 1   Atlanta   atlanta       2025
#> 2    Austin    austin       2025
#> 3   Houston   houston       2025
#> 4   Madison   madison       2025
#> 5  Nebraska  nebraska       2025
#> 6     Omaha     omaha       2025
#> 7 Salt Lake salt-lake       2025
mlv_teams
#>           city     mascot              name              slug first_year
#> 1      Atlanta       Vibe      Atlanta Vibe      atlanta-vibe       2024
#> 2     Columbus       Fury     Columbus Fury     columbus-fury       2024
#> 3       Dallas      Pulse      Dallas Pulse      dallas-pulse       2026
#> 4 Grand Rapids       Rise Grand Rapids Rise grand-rapids-rise       2024
#> 5         Indy     Ignite       Indy Ignite       indy-ignite       2025
#> 6        Omaha Supernovas  Omaha Supernovas  omaha-supernovas       2024
#> 7      Orlando  Valkyries Orlando Valkyries orlando-valkyries       2024
#> 8    San Diego       Mojo    San Diego Mojo    san-diego-mojo       2024
#> 9        Vegas     Thrill      Vegas Thrill      vegas-thrill       2024
```

### Scraping Statistics

Use `get_stats()` to retrieve team or individual player statistics from
a particular league:

``` r
# Get team match statistics for Omaha Supernovas in 2024
get_stats(league = "MLV", team = "Omaha", year = 2025, level = "team")
#> # A tibble: 28 × 15
#>     year team  date      opponent result kills assists service_aces blocks   out
#>    <int> <chr> <chr>     <chr>    <chr>  <int>   <int>        <int>  <int> <int>
#>  1  2025 Omaha 01/10/20… vsAtlan… W         60      56            3     13    48
#>  2  2025 Omaha 01/12/20… atGrand… W         55      47            2      4    38
#>  3  2025 Omaha 01/17/20… atVegas… L         51      48            3     14    42
#>  4  2025 Omaha 01/19/20… vsSan D… L         62      54            1      5    46
#>  5  2025 Omaha 01/24/20… atColum… W         38      34            5      9    24
#>  6  2025 Omaha 01/31/20… vsColum… W         32      31            1     13    26
#>  7  2025 Omaha 02/02/20… atOrlan… L         31      31            2      5    23
#>  8  2025 Omaha 02/06/20… atIndy … W         44      43            4     11    35
#>  9  2025 Omaha 02/08/20… atAtlan… W         54      49            0      9    38
#> 10  2025 Omaha 02/16/20… vsSan D… W         42      39            2     10    28
#> # ℹ 18 more rows
#> # ℹ 5 more variables: attack_attempts <int>, hitting_efficiency <dbl>,
#> #   digs <int>, digs_per_set <dbl>, sets_played <int>

# Get individual player statistics
get_stats(league = "MLV", team = "Omaha", year = 2025, level = "player")
#> # A tibble: 15 × 23
#>     year team  number player    sets_played matches_played points points_per_set
#>    <int> <chr>  <dbl> <chr>           <dbl>          <dbl>  <dbl>          <dbl>
#>  1  2025 Omaha      1 Valentin…          91             28     56           0.62
#>  2  2025 Omaha      4 Vazquez …           1              1      0           0   
#>  3  2025 Omaha      5 Nunevill…         101             28    413           4.09
#>  4  2025 Omaha      6 Wait, Ke…          10              6      2           0.2 
#>  5  2025 Omaha      8 Cooper, …          76             25    291           3.83
#>  6  2025 Omaha      9 Podraza,…          33             15     24           0.73
#>  7  2025 Omaha     10 Gómez, C…          90             26      0           0   
#>  8  2025 Omaha     11 Payne, K…          73             24    203           2.78
#>  9  2025 Omaha     14 Batenhor…          44             17    136           3.09
#> 10  2025 Omaha     17 Awoleye,…          25             11     43           1.72
#> 11  2025 Omaha     20 Holder, …          33             13      0           0   
#> 12  2025 Omaha     22 Krause, …          50             22     11           0.22
#> 13  2025 Omaha     23 Hord, Ka…          93             27    191           2.05
#> 14  2025 Omaha     27 Londot, …          46             21    160           3.48
#> 15  2025 Omaha     28 Caffey, …          82             25    173           2.11
#> # ℹ 15 more variables: kills <dbl>, kills_per_set <dbl>, attack_errors <dbl>,
#> #   attack_attempts <dbl>, hitting_efficiency <dbl>, assists <dbl>,
#> #   assists_per_set <dbl>, service_aces <dbl>, service_aces_per_set <dbl>,
#> #   serive_errors <dbl>, service_errors_per_set <dbl>, digs <dbl>,
#> #   digs_per_set <dbl>, blocks <dbl>, blocks_per_set <dbl>
```

Or use the league-specific functions for AU, LOVB, and MLV using
`au_stats()`, `lovb_stats()`, and `mlv_stats()` respectively. For player
data, AU only needs a year, and LOVB and MLV need the team name and
`level = "player"`.

``` r
au_stats(year = 2025)
lovb_stats(team = "Omaha", year = 2025, level = "player")
mlv_stats(team = "Omaha", year = 2025, level = "player")
```

To get team data for LOVB and MLV, use `lovb_stats()` and `mlv_stats()`
respectively with `level = "team"`.

``` r
lovb_stats(team = "Omaha", year = 2025, level = "team")
mlv_stats(team = "Omaha", year = 2025, level = "team")
```

### Available Data

The package includes five main datasets created with the `group_stats()`
function using data: player season data from AU (2021-2025) and player
season and team match data for AU, LOVB, and MLV (2024-2025).

``` r
# Load AU individual player data
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

# Load LOVB individual player data
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

# Load LOVB team match data
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

# Load MLV individual player data
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

# Load MLV team match data
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

These datasets are also directly available for download as CSV files:

- [au_player_data]()
- [lovb_player_data]()
- [lovb_team_data]()
- [mlv_player_data]()
- [mlv_team_data]()

## Data Dictionary

Full definitions available at [LOVB League
Statistics](https://www.lovb.com/2025/league-statistics) and [MLV
Statistics Guide](https://provolleyball.com/statistics-guide).

### Athletes Unlimited (AU) data

- `year`: Season year
- `team`: Player’s team name
- `number`: Player jersey number
- `player`: Player name
- `points`: Total Points
- `matches_started`: Matches Started
- `sets_started`: Sets Started
- `sets_played`: Sets Played
- `hitting_efficiency`: Attack Efficiency percentage
- `kill_percentage`: Kill percentage
- `kills`: Kills - successful attacks
- `attack_errors`: Attack Errors
- `attacks_blocked`: Attacks blocked by opponent
- `attack_attempts`: Total attack attempts
- `in_system_percentage`: In-system percentage
- `reception_errors`: Reception errors
- `reception_attempts`: Reception attempts
- `service_aces`: Service Aces - serves that result directly in a point
- `service_errors`: Service errors
- `opponent_in_system_percentage`: Opponent in-system percentage
- `service_attempts`: Service attempts
- `blocks`: Blocks - successful defensive plays at the net
- `block_touch_percentage`: Block touch percentage
- `digs`: Digs - successful defensive plays
- `dig_percentage`: Dig percentage
- `assists`: Assists - sets that lead directly to a kill
- `setting_efficiency`: Setting efficiency percentage

### League One Volleyball (LOVB) Data

#### Team Data

- `year`: Season year
- `team`: Team name
- `opponent`: Opposing team name  
- `date`: Match date
- `points`: Points scored
- `hitting_efficiency`: Attack efficiency percentage
- `kill_percentage`: Kill percentage
- `kills`: Successful attacks
- `attack_errors`: Attack errors
- `attacks_blocked`: Attacks blocked by opponent
- `attack_attempts`: Total attack attempts
- `in_system_percentage`: In-system percentage
- `reception_errors`: Reception errors
- `reception_attempts`: Reception attempts
- `service_aces`: Service aces
- `service_errors`: Service errors
- `opponent_in_system_percentage`: Opponent in-system percentage
- `service_attempts`: Service attempts
- `blocks`: Blocks
- `block_touch_percentage`: Block touch percentage
- `digs`: Successful defensive plays
- `dig_percentage`: Dig percentage
- `assists`: Assists
- `setting_efficiency`: Setting efficiency percentage

#### Player Data

- `year`: Season year
- `team`: Player’s team name
- `number`: Player jersey number
- `player`: Player name
- `points`: Total points
- `matches_started`: Matches started
- `sets_started`: Sets started
- `sets_played`: Sets played
- `hitting_efficiency`: Attack efficiency percentage
- `kill_percentage`: Kill percentage
- `kills`: Successful attacks
- `attack_errors`: Attack errors
- `attacks_blocked`: Attacks blocked by opponent
- `attack_attempts`: Total attack attempts
- `in_system_percentage`: In-system percentage
- `reception_errors`: Reception errors
- `reception_attempts`: Reception attempts
- `service_aces`: Service aces
- `service_errors`: Service errors
- `opponent_in_system_percentage`: Opponent in-system percentage
- `service_attempts`: Service attempts
- `blocks`: Blocks
- `block_touch_percentage`: Block touch percentage
- `digs`: Successful defensive plays
- `dig_percentage`: Dig percentage
- `assists`: Assists
- `setting_efficiency`: Setting efficiency percentage

### Pro Volleyball Federation (MLV) Data

#### Team Data

- `year`: Season year
- `team`: Team name
- `date`: Match date
- `opponent`: Opposing team name
- `result`: Win/Loss result
- `kills`: Successful attacks
- `assists`: Assists
- `service_aces`: Service aces
- `blocks`: Blocks
- `out`: \[Definition pending\]
- `attack_attempts`: Total attack attempts
- `hitting_efficiency`: Attack efficiency percentage
- `digs`: Successful defensive plays
- `digs_per_set`: Digs per set
- `sets_played`: Sets played in match

#### Player Data

- `year`: Season year
- `team`: Player’s team name
- `number`: Player jersey number
- `player`: Player name
- `sets_played`: Sets played
- `matches_played`: Matches played
- `points`: Total points
- `points_per_set`: Points per set
- `kills`: Successful attacks
- `kills_per_set`: Kills per set
- `attack_errors`: Attack errors
- `attack_attempts`: Total attack attempts  
- `hitting_efficiency`: Attack efficiency percentage
- `assists`: Assists
- `assists_per_set`: Assists per set
- `service_aces`: Service aces
- `service_aces_per_set`: Service aces per set
- `service_errors`: Service errors
- `service_errors_per_set`: Service errors per set
- `digs`: Successful defensive plays
- `digs_per_set`: Digs per set
- `blocks`: Blocks
- `blocks_per_set`: Blocks per set

## Contributing

Please report bugs and suggest features on [GitHub
Issues](https://github.com/JeffreyRStevens/provolleyballr/issues).

## Citation

To cite
[`{provolleyballr}`](https://jeffreyrstevens.github.io/provolleyballr/),
use:

Stevens JR (2026). *Extract Data from US Women’s Professional Volleyball
Websites*. R package version 0.1.0,
<https://github.com/JeffreyRStevens/provolleyballr>.

## License

This package is licensed under the MIT License. See `LICENSE` file for
details.

## Disclaimer

This package scrapes data from the official Athletes Unlimited, League
One Volleyball and Major League Volleyball websites. Please use
responsibly and in accordance with the websites’ terms of service.

## Acknowledgments

Many thanks to [Bill Petti](https://github.com/BillPetti) for making the
code for NCAA stats extraction freely available in the
[`{baseballr}`](https://billpetti.github.io/baseballr/) package.

The volleyball background in the logo was designed by
[Freepik](https://www.freepik.com/free-vector/volleyball-grey-gradient_59539214.htm).

This package was developed with the assistance of [Claude Sonnet
4](https://www.anthropic.com/claude).
