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

