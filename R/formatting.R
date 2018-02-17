#' Tidy long numbers
#'
#' \code{ba_tidyNum} reformats long numbers to include commas and prevents scientific formats
#'
#' @param number an input number or list
#'
#' @author Ben Anderson, \email{banderson@@soton.ac.uk}
#' @export
#'
tidyNum <- function(number) {
  format(number, big.mark=",", scientific=FALSE)
}


#' Concatenate vectors after converting to character and print message
#'
#' Display a message in the output. Equivalent to \code{print(paste(c(...)))}
#'
#' @param ... one or more R objects, to be converted to character vectors.
#' @param collapse an optional character string to separate the results. Not NA_character_.
#'
#' @author Mikey Harper, \email{m.harper@@soton.ac.uk}
#' @export
outputMessage <- function(..., collapse = NULL){

  writeLines(paste(..., sep = " "))

}


#' Returns a percentage value of a decimal
#'
#' @param x the string
#' @param digits number of decimal places
#' @param ... arguments passed to format.
#' @export
#'
percent <- function(x, digits = 0, ...) {
  paste0(formatC(100 * x, format = "f", digits = digits, ...), "%")
}


#' Function deletes any symbols from the inserted dataframe
#' @param vector an input vector
#' @return A vector with no ASCI symbols
#'
deleteSymbols <- function(vector){
  return(gsub("\\(|\\)|\\-", "", vector))
}


