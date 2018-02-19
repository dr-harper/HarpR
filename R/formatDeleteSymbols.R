#' Function deletes any symbols from the inserted dataframe
#'
#' @param vector an input vector
#' @return A vector with no ASCI symbols
#'@export
#'
deleteSymbols <- function(vector){
  return(gsub("\\(|\\)|\\-", "", vector))
}
