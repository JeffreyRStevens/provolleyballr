# Extract Data from League One Volleyball Website

This function scrapes team match-by-match and player season statistics
for League One Volleyball (LOVB) teams from the official LOVB website
<https://www.lovb.com>.

## Usage

``` r
lovb_stats(team = NULL, year = NULL, level = NULL)
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

## Value

A tibble containing team match-by-match or player season statistics.

Team match data include: year, team, opponent, date, points,
hitting_efficiency, kill_percentage, kills, attack_errors,
attacks_blocked, attack_attempts, in_system_percentage,
reception_errors, reception_attempts, service_aces, service_errors,
opponent_in_system_percentage, service_attempts, blocks,
block_touch_percentage, digs, dig_percentage, assists,
setting_efficiency

Player data include: year, team, number, player, points,
matches_started, sets_started, sets_played, hitting_efficiency,
kill_percentage, kills, attack_errors, attacks_blocked, attack_attempts,
in_system_percentage, reception_errors, reception_attempts,
service_aces, service_errors, opponent_in_system_percentage,
service_attempts, blocks, block_touch_percentage, digs, dig_percentage,
assists, setting_efficiency

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
[`mlv_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_stats.md)

## Examples

``` r
if (FALSE) { # interactive()
# Get Omaha Supernovas 2024 match statistics
lovb_stats(team = "Omaha", year = 2025, level = "team")
lovb_stats(team = "Omaha", year = 2025, level = "player")
}
```
