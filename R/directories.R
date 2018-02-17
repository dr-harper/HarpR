#' Find the path to Parent Directory
#'
#' Equivalent of \code{mh_findParentDirectory}. Is useful for running a project
#'   across multiple computers where the project is stored in different directories.
#'
#' @param Parent the name of the directory to which the function should track back.
#' Should be the root of the GitHub repository
#'
#' @author Mikey Harper, \email{m.harper@@soton.ac.uk}
#' @export
#'
findParentDirectory <- function(Parent){
  directory <-getwd()
  while(basename(directory) != Parent){
    directory <- dirname(directory)

  }
  return(directory)
}


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


#' Sources a file path within the project
#'
#' Adaptation to the \code{file.path} function to inlclude the project parent directory file path.
#' Construct the path to a file from components in a platform-independent way.
#'
#' @param root the name of the root project directory
#' @param ... character vectors
#' @param fsep the path separator to use
#'
#' @author Mikey Harper, \email{m.harper@@soton.ac.uk}
#' @export
sourceProjScript <- function(root , ..., fsep = .Platform$file.sep){

  source(projFilePath(root , ..., fsep = .Platform$file.sep))

}


