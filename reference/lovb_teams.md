# League One Volleyball Teams

A dataset containing information about League One Volleyball (LOVB)
teams, including team names, URL slugs, and first year used for web
scraping.

## Usage

``` r
lovb_teams
```

## Format

A data frame with 8 rows and 5 variables:

- name:

  Team city name

- slug:

  URL slug used in LOVB website URLs

- first_year:

  Year that team started in LOVB

## Source

<https://www.lovb.com>

## Details

This dataset is used internally by the package functions to map
user-provided team names to the appropriate URL slugs needed for web
scraping the LOVB website.

## See also

Other datasets:
[`au_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/au_player_data.md),
[`lovb_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_player_data.md),
[`lovb_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_team_data.md),
[`mlv_player_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_player_data.md),
[`mlv_team_data`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_team_data.md),
[`mlv_teams`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_teams.md)

## Examples

``` r
lovb_teams
#>        name      slug first_year
#> 1   Atlanta   atlanta       2025
#> 2    Austin    austin       2025
#> 3   Houston   houston       2025
#> 4   Madison   madison       2025
#> 5  Nebraska  nebraska       2025
#> 6     Omaha     omaha       2025
#> 7 Salt Lake salt-lake       2025
```
