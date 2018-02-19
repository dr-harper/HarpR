#' Create a summary table of files within a directory
#'
#'
#' Produce a table which containsthe names and locations of particular files within
#'   the directory.
#'
#' @param filePattern provide a string to be searched for within the file directory (i.e. ".Rmd" or ".Py"). Defaults to NULL
#' @param directory the directory to be search. Defaults to the working directory
#' @param recursive should the function also list subdirectories? Defaults to TRUE
#' @param ... additional arguments provided to list.files
#' @export
#
listFileTables <- function(directory = getwd(), filePattern = NULL,recursive = TRUE, ...){

  filePaths <- list.files(path = directory, pattern = filePattern, recursive = recursive, ...)
  dirNames <- dirname(filePaths)
  fileName <- basename(tools::file_path_sans_ext(filePaths))
  fileExt <- tools::file_ext(filePaths)
  fileSize <- base::file.size(filePaths)/1024


  df <- data.frame("File Path" = filePaths,
                     "Directory" = dirNames,
                     "Name" = fileName,
                     "Extension"= fileExt,
                     "File Size (Mb)" = fileSize)

  # Return the complete table
  return(df)
}
