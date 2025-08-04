#' League One Volleyball Teams
#'
#' A dataset containing information about League One Volleyball (LOVB) teams,
#' including team names, URL slugs, and first year used for web scraping.
#'
#' @format A data frame with 8 rows and 5 variables:
#' \describe{
#'   \item{name}{Team city name}
#'   \item{slug}{URL slug used in LOVB website URLs}
#'   \item{first_year}{Year that team started in LOVB}
#' }
#'
#' @details This dataset is used internally by the package functions to map
#' user-provided team names to the appropriate URL slugs needed for web scraping
#' the LOVB website.
#'
#' @family datasets
#'
#' @examples
#' lovb_teams
#'
#' @source \url{https://www.lovb.com}
"lovb_teams"

#' League One Volleyball Team Match Statistics
#'
#' A dataset containing team match-by-match statistics for League One Volleyball (LOVB) teams
#' for the 2025 season.
#'
#' @format A data frame with 96 rows and 24 variables:
#' \describe{
#'   \item{year}{Season year}
#'   \item{team}{Team name}
#'   \item{opponent}{Opposing team name}
#'   \item{date}{Match date}
#'   \item{points}{Points scored}
#'   \item{hitting_efficiency}{Attack efficiency percentage}
#'   \item{kill_percentage}{Kill percentage}
#'   \item{kills}{Kills - successful attacks that result in a point}
#'   \item{attack_errors}{Attack Errors - unsuccessful attacks}
#'   \item{attacks_blocked}{Attacks blocked by opponent}
#'   \item{attack_attempts}{Total attack attempts}
#'   \item{in_system_percentage}{In-system percentage}
#'   \item{reception_errors}{Reception errors}
#'   \item{reception_attempts}{Reception attempts}
#'   \item{service_aces}{Service Aces - serves that result directly in a point}
#'   \item{service_errors}{Service errors}
#'   \item{opponent_in_system_percentage}{Opponent in-system percentage}
#'   \item{service_attempts}{Service attempts}
#'   \item{blocks}{Blocks - successful defensive plays at the net}
#'   \item{block_touch_percentage}{Block touch percentage}
#'   \item{digs}{Digs - successful defensive plays}
#'   \item{dig_percentage}{Dig percentage}
#'   \item{assists}{Assists - sets that lead directly to a kill}
#'   \item{setting_efficiency}{Setting efficiency percentage}
#' }
#'
#' @family datasets
#'
#' @examples
#' head(lovb_team_data)
#'
#' @source \url{https://lovb.com}
"lovb_team_data"

#' League One Volleyball Individual Player Statistics
#'
#' A dataset containing individual player season statistics for League One Volleyball (LOVB) players
#' across the league for the 2025 season.
#'
#' @format A data frame with 94 rows and 27 variables:
#' \describe{
#'   \item{year}{Season year}
#'   \item{team}{Player's team name}
#'   \item{number}{Player jersey number}
#'   \item{player}{Player name}
#'   \item{points}{Total Points}
#'   \item{matches_started}{Matches Started}
#'   \item{sets_started}{Sets Started}
#'   \item{sets_played}{Sets Played}
#'   \item{hitting_efficiency}{Attack Efficiency percentage}
#'   \item{kill_percentage}{Kill percentage}
#'   \item{kills}{Kills - successful attacks}
#'   \item{attack_errors}{Attack Errors}
#'   \item{attacks_blocked}{Attacks blocked by opponent}
#'   \item{attack_attempts}{Total attack attempts}
#'   \item{in_system_percentage}{In-system percentage}
#'   \item{reception_errors}{Reception errors}
#'   \item{reception_attempts}{Reception attempts}
#'   \item{service_aces}{Service Aces - serves that result directly in a point}
#'   \item{service_errors}{Service errors}
#'   \item{opponent_in_system_percentage}{Opponent in-system percentage}
#'   \item{service_attempts}{Service attempts}
#'   \item{blocks}{Blocks - successful defensive plays at the net}
#'   \item{block_touch_percentage}{Block touch percentage}
#'   \item{digs}{Digs - successful defensive plays}
#'   \item{dig_percentage}{Dig percentage}
#'   \item{assists}{Assists - sets that lead directly to a kill}
#'   \item{setting_efficiency}{Setting efficiency percentage}
#' }
#'
#' @family datasets
#'
#' @examples
#' head(lovb_player_data)
#'
#' @source \url{https://lovb.com}
"lovb_player_data"

#' Pro Volleyball Federation Teams
#'
#' A dataset containing information about Pro Volleyball Federation (PVF) teams,
#' including team names, cities, mascots, URL slugs, and first year used for web scraping.
#'
#' @format A data frame with 8 rows and 5 variables:
#' \describe{
#'   \item{city}{Team city name}
#'   \item{mascot}{Team mascot name}
#'   \item{name}{Full team name (city + mascot)}
#'   \item{slug}{URL slug used in PVF website URLs}
#'   \item{first_year}{Year that team started in PVF}
#' }
#'
#' @details This dataset is used internally by the package functions to map
#' user-provided team names to the appropriate URL slugs needed for web scraping
#' the PVF website.
#'
#' @family datasets
#'
#' @examples
#' pvf_teams
#'
#' @source \url{https://provolleyball.com}
"pvf_teams"

#' Pro Volleyball Federation Team Match Statistics
#'
#' A dataset containing team match-by-match statistics for Pro Volleyball Federation (PVF) teams
#' for the 2024-2025 seasons.
#'
#' @format A data frame with 392 rows and 15 variables:
#' \describe{
#'   \item{year}{Season year}
#'   \item{team}{Team name}
#'   \item{date}{Match date}
#'   \item{opponent}{Opposing team name}
#'   \item{result}{Win/Loss result}
#'   \item{kills}{Kills - successful attacks that result in a point}
#'   \item{assists}{Assists - sets that lead directly to a kill}
#'   \item{service_aces}{Service Aces - serves that result directly in a point}
#'   \item{blocks}{Blocks - successful defensive plays at the net}
#'   \item{out}{Definition pending}
#'   \item{attack_attempts}{Total attack attempts}
#'   \item{hitting_efficiency}{Attack efficiency percentage}
#'   \item{digs}{Digs - successful defensive plays}
#'   \item{digs_per_set}{Digs per set}
#'   \item{sets_played}{Sets played in the match}
#' }
#'
#' @family datasets
#'
#' @examples
#' head(pvf_team_data)
#'
#' @source \url{https://provolleyball.com}
"pvf_team_data"

#' Pro Volleyball Federation Individual Player Statistics
#'
#' A dataset containing individual player season statistics for Pro Volleyball Federation (PVF) players
#' across the league for the 2024-2025 seasons.
#'
#' @format A data frame with 264 rows and 23 variables:
#' \describe{
#'   \item{year}{Season year}
#'   \item{team}{Player's team name}
#'   \item{number}{Player jersey number}
#'   \item{player}{Player name}
#'   \item{sets_played}{Sets Played}
#'   \item{matches_played}{Matches Played}
#'   \item{points}{Total Points}
#'   \item{points_per_set}{Points per Set}
#'   \item{kills}{Kills - successful attacks}
#'   \item{kills_per_set}{Kills per Set}
#'   \item{attack_errors}{Attack Errors}
#'   \item{attack_attempts}{Total Attacks}
#'   \item{hitting_efficiency}{Attack Efficiency percentage}
#'   \item{assists}{Assists - sets that lead directly to a kill}
#'   \item{assists_per_set}{Assists per Set}
#'   \item{service_aces}{Service Aces - serves that result directly in a point}
#'   \item{service_aces_per_set}{Service Aces per Set}
#'   \item{serive_errors}{Service Errors}
#'   \item{service_errors_per_set}{Service Errors per Set}
#'   \item{digs}{Digs - successful defensive plays}
#'   \item{digs_per_set}{Digs per Set}
#'   \item{blocks}{Blocks - successful defensive plays at the net}
#'   \item{blocks_per_set}{Blocks per Set}
#' }
#'
#' @family datasets
#'
#' @examples
#' head(pvf_player_data)
#'
#' @source \url{https://provolleyball.com}
"pvf_player_data"
