# Major League Volleyball Teams

A dataset containing information about Major League Volleyball (MLV)
teams, including team names, cities, mascots, URL slugs, and first year
used for web scraping.

## Usage

``` r
mlv_teams
```

## Format

A data frame with 8 rows and 5 variables:

- city:

  Team city name

- mascot:

  Team mascot name

- name:

  Full team name (city + mascot)

- slug:

  URL slug used in MLV website URLs

- first_year:

  Year that team started in MLV

## Source

<https://provolleyball.com>

## Details

This dataset is used internally by the package functions to map
user-provided team names to the appropriate URL slugs needed for web
scraping the MLV website.

## See also

Other datasets:
[`au_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/au_player_data.md),
[`lovb_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_player_data.md),
[`lovb_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_team_data.md),
[`lovb_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_teams.md),
[`mlv_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_player_data.md),
[`mlv_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_team_data.md)

## Examples

``` r
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
