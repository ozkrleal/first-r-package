#' This function prints forint formatted.
#' @param x is the value you want to format.
#' @export
#' @importFrom scales dollar
forint <- function(x) {
  dollar(x, prefix = '', suffix = 'Ft')
}
