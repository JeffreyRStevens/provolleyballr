# Extract Data from Athletes Unlimited Volleyball Website

This function scrapes player season statistics for Athletes Unlimited
Volleyball (AU) players from the official AU website
<https://auprosports.com/volleyball>.

## Usage

``` r
au_stats(year = NULL, stored = TRUE)
```

## Arguments

- year:

  A numeric value specifying the year for which to retrieve statistics.
  Must be 2024 or later for LOVB or MLV and 2021 or later for AU.

- stored:

  A logical specifying whether to use stored data for previous years
  (TRUE is default) or force the function to scrape the website (FALSE)

## Value

A tibble containing team player season statistics.

Player data include: year, rank, player, points, sets_played, kills,
kills_per_set, attack_errors, attack_attempts, kill_percentage, assists,
assists_per_set, setting_errors, service_aces, service_errors,
service_aces_per_set, total_reception_attempts, reception_errors,
positive_reception_percentage, digs, digs_per_set, blocks,
blocks_per_set, block_assists, good_receptions

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
[`get_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/get_stats.md),
[`group_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/group_stats.md),
[`lovb_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/lovb_stats.md),
[`mlv_stats()`](https://jeffreyrstevens.github.io/provolleyballr/reference/mlv_stats.md)

## Examples

``` r
if (FALSE) { # interactive()
# Get 2025 player statistics
au_stats(year = 2025)
}
```
