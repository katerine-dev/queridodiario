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
#' @param returnDF para indicar se o retorno deve ser JSON or data.frame
#'
#' @return um arquivo json contendo os diarios oficiais para os parametros indicados
#'
#' @seealso data frame com IDs dos [territories]
#'
#' @export

get_gazettes <- function(
  since = NULL,
  until = NULL,
  keywords = NULL,
  territory_id = NULL,
  offset = 0,
  size = NULL,
  returnDF = TRUE
){

  # define API params
  BASE_API_URL <- "https://queridodiario.ok.org.br"
  url <- httr::modify_url(BASE_API_URL, path = "/api/gazettes/")

  # build URL and query parameters
  if (!is.null(territory_id)) {
    url <- paste0(url, territory_id)
  }

  # define url parameters
  url_params = list(since = since,
                    until = until,
                    keywords = keywords,
                    offset = offset,
                    size = size)

  # visit API and get results
  response <- httr::GET(url, query = url_params)
  httr::stop_for_status(response)
  responseParsed <- httr::content(response, "parsed")

  # check whether return is null
  if (responseParsed$total_gazettes == 0) {
    message(
      paste0(
        'Your query returned empty.',
        ' Have you passed the right args to your API call?'
      )
    )
  } else {

    text <- as.character(jsonlite::toJSON(responseParsed))

    # store JSON result to object
    result <- jsonlite::fromJSON(text)

    # use dataframe option if that'd be best for the use
    if (returnDF) {
      result <- data.frame(result)
    }

    # return call
    return(result)
  }

}
