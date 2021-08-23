#' get_gazettes
#'
#' @description Requisita diarios oficiais a API do Querido Diario e retorna um json
#'
#' @param since data a partir da qual se deseja pesquisar, em formato YYYY-MM-DD
#' @param until data ate quando, em formato YYYY-MM-DD
#' @param keywords palavras-chave que serão pesquisadas nos diarios oficiais
#' @param territory_id numero dos municipios, seguindo os codigos da tabela
#' @param offset sempre igual a 0
#' @param size a quantidade de itens que serão retornados
#'
#' @return um arquivo json contendo os diarios oficiais para os parametros indicados
#'
#' @seealso data frame com IDs dos [territories]
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
    url <- paste0(url, territory_id)
  }

  url_params = list(since = since,
                    until = until,
                    keywords = keywords,
                    offset = offset,
                    size = size)

  response <- httr::GET(url, query = url_params)
  httr::stop_for_status(response)
  responseParsed <- httr::content(response, "parsed")
  text <- as.character(jsonlite::toJSON(responseParsed))

  data.frame(jsonlite::fromJSON(text))

}
