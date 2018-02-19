#' Tidy long numbers
#'
#' \code{ba_tidyNum} reformats long numbers to include commas and prevents scientific formats
#'
#' @param number an input number or list
#'
#' @author Ben Anderson, \email{banderson@@soton.ac.uk}
#' @export
#'
formatTidyNum <- function(number) {
  format(number, big.mark=",", scientific=FALSE)
}
