#' gazettes
#'Descrição da função
#'parâmetros
#'
#'
#'
#'retur descrição do resultado
#'export

gazettes <- function(since = NULL,
                     until = NULL,
                     keywords = NULL,
                     territory_id = NULL,
                     offset = 0,
                     size = 10) {
  endpoint <- "gazettes/"
  if (!is.null(territory_id)) {
    endpoint <-  sprintf("gazettes/ %s", NULL)
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
      payload <- append(payload, sprintf("kyword=%s", keywords))
    }
  url_params <-  paste(payload, collapse = "&")

  #response  <- api(c(sprintf("BASE_API_URL=%s", BASE_API_URL),
  # sprintf("endpoint=%s", endpoint),

  #requests.get(f"{BASE_API_URL}{endpoint}?{url_params}")
  # response.raise_for_status()

  # return response.json()


}
