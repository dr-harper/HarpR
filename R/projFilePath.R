#' Creates a file path within the project
#'
#' Adaptation to the \@code{file.path} function to inlclude the project parent directory file path.
#' Construct the path to a file from components in a platform-independent way.
#'
#' @param root the name of the root project directory
#' @param ... character vectors
#' @param fsep the path separator to use
#'
#' @author Mikey Harper, \email{m.harper@@soton.ac.uk}
#' @export

projFilePath <- function(root , ..., fsep = .Platform$file.sep){

  projLoc <- findParentDirectory(root)

  file.path(projLoc, ...)
}
