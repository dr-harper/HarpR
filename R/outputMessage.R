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
