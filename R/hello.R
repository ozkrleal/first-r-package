library(binancer)
library(scales)

#' Gets the most recent bitcoin price in USD from Binance API
#'
#' This is a wrapper around a \code{library(binancer)}
#' @export
#' @param retried the number of retries previously done before the exponential backoff sleep
#' @importFrom binancer binance_coins_prices
get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    binance_coins_prices()[symbol == 'BTC', usd],
    error = function(e) {
      ## exponential backoff retries
      Sys.sleep(1 + retried ^ 2)
      get_bitcoin_price(retried = retried + 1)
    })
}

#' This function prints forint formatted.
#' @param x is the value you want to format.
#' @export
#' @importFrom scales dollar
forint <- function(x) {
  dollar(x, prefix = '', suffix = 'Ft')
}
