#' Custom Knit function for RStudio
#'
#' @export
knit2date <- function(inputFile, encoding) {

  # render slides
  rmarkdown::render(inputFile,
                    encoding = encoding,
                    output_file = paste0(dirname(inputFile),'/', tools::file_path_sans_ext(basename(inputFile)),
                                         '-',
                                         format(Sys.Date(), "%Y%m%d"),
                                         '.html'))
  }
