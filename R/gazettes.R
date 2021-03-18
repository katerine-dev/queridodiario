#' get_gazettes
#'Descrição da função
#'parâmetros
#' @param since data a partir da qual, em formato YYY-MM-DD
#' @param until data até quando, em formato YYY-MM-DD
#' @param keywords palavras-chave que serão pesquisadas nos diários oficiais
#' @param territory_id número dos municípios, seguindo os códigos da tabela
#' @param offset
#' @param size
#'
#'return descrição do resultado
#'export

get_gazettes <- function(since = NULL,
                     until = NULL,
                     keywords = NULL,
                     territory_id = NULL,
                     offset = 0,
                     size = 10) {
  BASE_API_URL <- "https://queridodiario.ok.org.br/api/"
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
  if (!is.null(keywords)) {
    payload <- append(payload, sprintf("keywords=%s", keywords))
  }
  url_params <-  paste(payload, collapse = "&")
  api  <-paste(c(BASE_API_URL, endpoint, "?", url_params), collapse = "")
  response <- httr::GET(api)
  response$status
  responseParsed <- content(response, as="parsed")
  responseParsed
}
