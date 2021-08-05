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
                     size = NULL) {
  BASE_API_URL <- "https://queridodiario.ok.org.br"
  url <- httr::modify_url(BASE_API_URL, path = "/api/gazettes/")

  if (!is.null(territory_id)) {
    url <- paste(url, territory_id, sep="")
  }

  url_params = list(since = since,
                    until = until,
                    keywords = keywords,
                    offset = offset,
                    size = size)

  response <- httr::GET(url, query=url_params)

  httr::stop_for_status(response)

  responseParsed <- httr::content(response, "parsed")
  responseParsed

}
