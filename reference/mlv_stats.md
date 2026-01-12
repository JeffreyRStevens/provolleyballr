# Extract Data from Major League Volleyball Website

This function scrapes team match-by-match and player season statistics
for Major League Volleyball (MLV) teams from the official website
<https://provolleyball.com>.

## Usage

``` r
mlv_stats(team = NULL, year = NULL, level = NULL, stored = TRUE)
```

## Arguments

- team:

  A character string specifying the team name or city. Accepts city
  names (e.g., "Omaha", "Atlanta") or variations like "Indianapolis"
  (converted to "Indy") and "Las Vegas" (converted to "Vegas"). Must
  match one of the valid LOVB or MLV team cities. AU has no teams.

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

A tibble containing team match-by-match or player season statistics.

Team match data include: year, team, date, opponent, result, kills,
assists, service_aces, blocks, out, attack_attempts, hitting_efficiency,
digs, digs_per_set, sets_played

Player data include: year, team, number, player, sets_played,
matches_played, points, points_per_set, kills, kills_per_set,
attack_errors, attack_attempts, hitting_efficiency, assists,
assists_per_set, service_aces, service_aces_per_set, serve_errors,
service_errors_per_set, digs, digs_per_set, blocks, blocks_per_set

## Note

This function requires:

- The [`{selenider}`](https://ashbythorpe.github.io/selenider/) R
  package for web automation

- [Google Chrome](https://www.google.com/chrome/) browser installed on
  the system

- An active internet connection

The function uses a headless Chrome browser session, so no browser
window will be visible during execution. Browser sessions are
automatically closed after data extraction.

## See also

Other statistics functions:
[`au_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/au_stats.md),
[`get_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/get_stats.md),
[`group_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/group_stats.md),
[`lovb_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_stats.md)

## Examples

``` r
if (FALSE) { # interactive()
# Get Omaha Supernovas 2024 match statistics
mlv_stats(team = "Omaha", year = 2024, level = "team")
mlv_stats(team = "Omaha", year = 2024, level = "player")
}
```
