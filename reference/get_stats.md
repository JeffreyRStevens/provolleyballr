# Extract Data from US Women's Professional Volleyball Websites

This function scrapes team match-by-match and player season statistics
for Athletes Unlimited (UA), League One Volleyball (LOVB), or Major
League Volleyball (MLV) players and teams from the official websites.

## Usage

``` r
get_stats(league = NULL, team = NULL, year = NULL, level = NULL, stored = TRUE)
```

## Arguments

- league:

  A character string specifying which league to retrieve. Must be "AU",
  "LOVB" or "MLV".

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
[`group_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/group_stats.md),
[`lovb_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_stats.md),
[`mlv_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_stats.md)

## Examples

``` r
if (FALSE) { # interactive()
# Get Omaha Supernovas 2024 match statistics
get_stats(league = "AU", year = 2025)
get_stats(league = "LOVB", team = "Austin", year = 2025, level = "team")
get_stats(league = "LOVB", team = "Austin", year = 2025, level = "player")
get_stats(league = "MLV", team = "Omaha", year = 2024, level = "team")
get_stats(league = "MLV", team = "Omaha", year = 2024, level = "player")
}
```
