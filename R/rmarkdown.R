#' Counts the number of words within an RMarkdown document
#'
#' Counts the words within an RMarkdown document. Ignores any code within the document.
#' Any content between the tags <!---TC:ignore---> <!---TC:endignore---> won't be included
#' within the wordcount
#'
#' @param file The path to the RMarkdown document
#'
#' @importFrom stringi str_replace_all
#' @import magrittr
#' @export
#'
RmdWords <- function(file) {

  # Creates a string of text
  file_string <- file %>%
    readLines() %>%
    paste0(collapse = " ") %>%
    # Remove YAML header
    str_replace_all("^<--- .*?--- ", "") %>%
    str_replace_all("^--- .*?--- ", "") %>%
    # Remove code
    str_replace_all("```.*?```", "") %>%
    str_replace_all("`.*?`", "") %>%
    # Remove LaTeX
    str_replace_all("[^\\\\]\\$\\$.*?[^\\\\]\\$\\$", "") %>%
    str_replace_all("[^\\\\]\\$.*?[^\\\\]\\$", "") %>%
    # Deletes text between tags
    str_replace_all("TC:ignore.*?TC:endignore", "") %>%
    str_replace_all("[[:punct:]]", " ") %>%
    str_replace_all("  ", "") %>%
    str_replace_all("<", "") %>%
    str_replace_all(">", "")

  # Save several different results
  word_count <- str_count(file_string, "\\S+")
  char_count <- str_replace_all(string = file_string, " ", "") %>% str_count()

  return(list(num_words = word_count, num_char = char_count, word_list = file_string))
}
