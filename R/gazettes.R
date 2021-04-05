#' get_gazettes
#'
#' @description Requisita diarios oficiais a API do Querido Diário e retorna um json
#'
#' @param since data a partir da qual se deseja pesquisar, em formato YYY-MM-DD
#' @param until data ate quando, em formato YYY-MM-DD
#' @param keywords palavras-chave que serão pesquisadas nos diarios oficiais
#' @param territory_id número dos municipios, seguindo os codigos da tabela
#' @param offset sempre igual a 0
#'
#' @return um arquivo json contendo os diários oficiais para os parâmetros indicados
#'
#' @export
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
  responseParsed <- httr::content(response, as="parsed")
  responseParsed
}
