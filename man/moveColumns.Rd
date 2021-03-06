% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/moveColumns.R
\name{moveColumns}
\alias{moveColumns}
\title{Rearrange columns in a df}
\usage{
moveColumns(data, tomove, where = "last", ba = NULL)
}
\arguments{
\item{data}{a dataframe}

\item{tomove}{a list of column names to be moved}

\item{where}{specify the location of the dataframe to be moved (either "first" or "last", "before" or "after")}

\item{ba}{Specify the column name to move before or after}
}
\description{
For the reorganisation of dataframes, moving the position of columns or rows within a dataframe.
}
