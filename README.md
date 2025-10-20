
<!-- README.md is generated from README.Rmd. Please edit that file -->

# provolleyballr <a href="https://jeffreyrstevens.github.io/provolleyballr/"><img src="man/figures/logo.png" align="right" height="139" alt="provolleyballr website" /></a>

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](man/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The
[`{provolleyballr}`](https://jeffreyrstevens.github.io/provolleyballr) R
package provides tools for scraping match statistics and player data
from the Major League (MLV) website <https://provolleyball.com>
(formerly the Pro Volleyball Federation), the League One Volleyball
website <https://lovb.com>, and the Athletes Unlimited (UA) website
<https://auprosports.com/volleyball>.

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
#> 3       Dallas       <NA>            Dallas            dallas       2026
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
get_stats(league = "LOVB", team = "Austin", year = 2025, level = "team")

# Get individual player statistics
get_stats(league = "MLV", team = "Omaha", year = 2024, level = "player")
```

### Working with Included Datasets

The package includes pre-scraped datasets (using `group_stats()`
aggregating function) for analysis that includes all AU player data from
2021-2025 and all LOVB and MLV team and player data for 2024-2025.

- `lovb_player_data`

- `lovb_team_data`

- `mlv_player_data`

- `mlv_team_data`

For more information, see the package vignette:

``` r
# View the analysis vignette
vignette("get-started", package = "provolleyballr")
```

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

## License

This package is licensed under the MIT License. See `LICENSE` file for
details.

## Disclaimer

This package scrapes data from the official League One Volleyball and
Pro Volleyball Federation websites. Please use responsibly and in
accordance with the websites’ terms of service.

This package was developed with the assistance of [Claude Sonnet
4](https://www.anthropic.com/claude).
