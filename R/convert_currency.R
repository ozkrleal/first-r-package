#' This function shows the exchange rate of the desired currencies, with any day rate.
#'
#' Note that weekends are off for the API used: api.exchangesratesapi.io/
#' @param incurrency is the currency you want to convert from
#' @param outcurrency is the currency you want to convert to
#' @param days is the amount of days you want to see the conversion rate
#' @export
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom data.table data.table
convert_currency <- function(incurrency, outcurrency, days){
  exchange_rates <- content(GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = Sys.Date() - days,
      end_at   = Sys.Date(),
      base     = incurrency,
      symbols  = outcurrency
    )))$rates

  result <- data.table(
    date = as.Date(names(exchange_rates)),
    rate = as.numeric(unlist(exchange_rates)))

  return(result)
}
