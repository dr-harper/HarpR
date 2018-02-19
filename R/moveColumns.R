#' Rearrange columns in a df
#'
#' For the reorganisation of dataframes, moving the position of columns or rows within a dataframe.
#'
#' @param data a dataframe
#' @param tomove a list of column names to be moved
#' @param where specify the location of the dataframe to be moved (either "first" or "last", "before" or "after")
#' @param ba Specify the column name to move before or after
#' @export
#'
moveColumns <- function(data, tomove, where = "last", ba = NULL) {

  temp <- setdiff(names(data), tomove)
  x <- switch(
    where,
    first = data[c(tomove, temp)],
    last = data[c(temp, tomove)],
    before = {
      if (is.null(ba)) stop("must specify ba column")
      if (length(ba) > 1) stop("ba must be a single character string")
      data[append(temp, values = tomove, after = (match(ba, temp)-1))]
    },
    after = {
      if (is.null(ba)) stop("must specify ba column")
      if (length(ba) > 1) stop("ba must be a single character string")
      data[append(temp, values = tomove, after = (match(ba, temp)))]
    })
  x
}
