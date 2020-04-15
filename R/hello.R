library(binancer)
library(scales)
#' This gets the current bitcoin price in USD from Binance
#' @export
get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    binancer::binance_coins_prices()[symbol == 'BTC', usd],
    error = function(e) {
      ## exponential backoff retries
      Sys.sleep(1 + retried ^ 2)
      get_bitcoin_price(retried = retried + 1)
    })
}

#' This function prints forint formatted.
#' @param x is the value you want to format.
#' @export
forint <- function(x) {
  scales::dollar(x, prefix = '', suffix = 'Ft')
}
