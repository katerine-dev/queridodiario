#' get_gazettes
#'Descrição da função
#'parâmetros
#'
#'
#'
#'return descrição do resultado
#'export

library(httr)

BASE_API_URL <- "https://queridodiario.ok.org.br/api/"

get_gazettes <- function(since = NULL,
                     until = NULL,
                     keywords = NULL,
                     territory_id = NULL,
                     offset = 0,
                     size = 10) {
  endpoint <- "gazettes/"
  if (!is.null(territory_id)) {
    endpoint <-  sprintf("gazettes/%s", territory_id)
  }
  payload <- c(sprintf("offset=%s", offset),
               sprintf("size=%s", size))
  if (!is.null(since)) {
    payload <- append(payload, sprintf("since=%s", since))
  }
  if (!is.null(until)) {
    payload <- append(payload, sprintf("until=%s", until))
  }
  if (!is.null(keywords))
    for (i in keyword) {
      payload <- append(payload, sprintf("keyword=%s", keywords))
    }
  url_params <-  paste(payload, collapse = "&")
  api  <-paste(c(BASE_API_URL, endpoint, "?", url_params), collapse = "")
  response <- GET(api)
  # response.raise_for_status()
  # return response.json()
}
