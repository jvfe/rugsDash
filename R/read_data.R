read_rugs <- function() {
  rugs_csv_url <- "https://raw.githubusercontent.com/benubah/r-community-explorer/master/docs/data/rugs.csv"

  vroom::vroom(rugs_csv_url)[, -1]
}

read_summary <- function() {
  rugs_summary_url <- "https://raw.githubusercontent.com/benubah/r-community-explorer/master/docs/data/rugs_summary.json"

  jsonlite::fromJSON(rugs_summary_url)
}

read_cumulative <- function() {
  rugs_cumulative_url <- "https://raw.githubusercontent.com/benubah/r-community-explorer/master/docs/data/rugs_cumulative.json"

  jsonlite::fromJSON(rugs_cumulative_url) %>%
    tibble::as_tibble() %>%
    dplyr::mutate(datecreated = lubridate::as_date(datecreated))
}
