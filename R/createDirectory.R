#' Create a new directory
#'
#' Checks if the directory exists. If not, it is created. The function
#'   returns the directory file path.
#'
#' @param directory A filepath to a directory
#'
#' @return The filepath of the directory
#' @export
#'
createDirectory <- function(directory){
  if (!dir.exists(directory)){
    dir.create(file.path(directory))
  }
  return(directory)
}
