#' Returns a percentage value of a decimal
#'
#' @param x the string
#' @param digits number of decimal places
#' @param ... arguments passed to format.
#' @export
#'
formatPercent <- function(x, digits = 0, ...) {
  paste0(formatC(100 * x, format = "f", digits = digits, ...), "%")
}
