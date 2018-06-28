if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))


#' Check age of R Markdown Compiled files
#'
#' Will search a directory and list out all R Markdown files, highlighing when
#'  they were last updated and whether the PDF, HTML and Word outputs documents
#'  are out-of-date.
#'
#' @param directory the directory to search
#' @param recursive should search include subdirectories
#'
#' @export
#' @author Michael
#'
RmdLastKnitted <- function(directory = getwd(), recursive = TRUE){

  # Extract all the R Markdown files
  files <- base::list.files(directory, recursive = recursive, pattern = "*.Rmd") %>%
    base::file.info() %>%
    tibble::rownames_to_column("rmdFile") %>%
    dplyr::mutate(noExt = tools::file_path_sans_ext(rmdFile)) %>%
    dplyr::select(c(rmdFile, mtime, noExt)) %>%
    purrr::set_names("RMD", "Updated", "noExt")

  # List the HTML files
  filesHtml <- base::list.files(getwd(), recursive = TRUE, pattern = "*.pdf|*.html|*.docx") %>%
    base::file.info() %>%
    tibble::rownames_to_column("compiled") %>%
    dplyr::mutate(noExt = tools::file_path_sans_ext(compiled),
                  ext = tools::file_ext(compiled)) %>%
    dplyr:: select(c(compiled, mtime, noExt, ext)) %>%
    purrr::set_names("Output", "Compiled", "noExt", "Extension")

  # Compare the files and extract the date
  comparison <-
    files %>%
    dplyr::left_join(filesHtml, by = "noExt") %>%
    dplyr::select(-c(noExt)) %>%
    dplyr::mutate(LastUpdated =
                    difftime(Updated, Compiled, units = "days") %>%
                    round(0)) %>%
    dplyr::arrange(-LastUpdated) %>%
    dplyr::select(c(RMD, LastUpdated, Extension))


  return(comparison)

}


#' Updates R Markdown output files
#'
#' Checks the age of R Markdown files and their respective outputs, and will update
#'  any documents which are out of date. The function will use the `output` options
#'  of the YAML frontmatter of the document.
#'
#' @param directory the directory to search for the files. Defaults to the working directory
#' @param recursive should the search include subdirectories?
#' @param firstKnit should the function compile files if they have not be knitted before? Default is FALSE
#' @param minAge the minimum time difference between the updated R Markdown and the HTML.
#'
#' @export
#' @author Michael Harper
#'
RmdUpdateOutputs <- function(directory = getwd(), recursive = TRUE, firstKnit = FALSE, minAge = 0){

  RmdFiles <- RmdLastKnitted() %>%
    dplyr::filter(LastUpdated > minAge)

  if(!isTRUE(firstKnit)){
    RmdFiles <- RmdFiles %>%
      dplyr::filter(!is.na(LastUpdated))

  }

  message(nrow(RmdFiles), " to be recompiled.\n-------------------")

  # Update the files selected
  for(i in 1:nrow(RmdFiles)){

    message(i,"/",nrow(RmdFiles), "\nRecompiling ", RmdFiles$RMD[i], "\n",
            "Time difference between RMD and compiled documents: ", RmdFiles$LastUpdated[i], " days")

    suppressMessages(rmarkdown::render(RmdFiles$RMD[i], "all", envir = new.env(), clean = TRUE, quiet = TRUE))
    message("Complete.\n-------------------")
  }


}

