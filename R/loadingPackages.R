#' Installs and loads packages
#'
#' \code{myRequiredPackages} checks whether the package is already installed,
#'   installing those which are not preinstalled. All the libraries are then load.
#'
#'   Especially useful when running on virtual machines where package installation
#'   is not persistent (Like UoS sve). It will fail if the packages need to be
#'   installed but there is no internet access
#'
#' @param ... A list of packages
#' @param repository The repository to load functions from. Defaults to "https://cran.ma.imperial.ac.uk/"
#' @importFrom  utils install.packages
#'
#' @author Luke Blunden, \email{lsb@@soton.ac.uk} (original)
#'   Michael Harper \email{m.harper@@soton.ac.uk} (revised version)
#' @export
#'
loadRequiredPackages <- function(..., repository = "https://cran.ma.imperial.ac.uk/"){

  packages <- c(...)

  # Find if package isn't installed
  newPackages <- packages[!(packages %in% utils::installed.packages()[,1])]

  # Install if required
  if (length(newPackages)){install.packages(newPackages, dependencies = TRUE)}

  # Load packages
  sapply(packages, require, character.only = TRUE)
  sapply(packages, require, character.only = TRUE)
}
