#' Installs and loads packages
#'
#' \code{myRequiredPackages} checks whether the package is already installed,
#'   installing those which are not preinstalled. All the libraries are then load.
#'
#'   Especially useful when running on virtual machines where package installation
#'   is not persistent (Like UoS sve). It will fail if the packages need to be
#'   installed but there is no internet access
#' @param ... A list of packages
#' @param repository The repository to load functions from. Defaults to "https://cran.ma.imperial.ac.uk/"
#' @importFrom  utils install.packages
#'
#' @author Luke Blunden, \email{lsb@@soton.ac.uk} (original)
#' @author Michael Harper \email{m.harper@@soton.ac.uk} (revised version)
#' @export
#'
loadRequiredPackages <- function(..., repository = "https://cran.ma.imperial.ac.uk/"){

  packages <- c(...)

  # Find if package isn't installed
  newPackages <- packages[!(packages %in% utils::installed.packages()[,1])]

  # Install if required
  if (length(newPackages)){utils::install.packages(newPackages, dependencies = TRUE)}

  # Load packages
  sapply(packages, require, character.only = TRUE)
}


#' Installs and loads packages from Github
#'
#' \code{myRequiredPackagesGithub} checks whether the package is already installed.
#'   If the package is not detected, it will attempt to install it from GitHub,
#'   before loading the packages.
#'
#'
#' @param ... A list of packages
#' @param quiet should mesages be printed (TRUE/FALSE)
#' @importFrom  utils install.packages
#'
#' @author Michael Harper \email{m.harper@@soton.ac.uk}
#' @export
#'
loadRequiredPackagesGithub <- function(..., quiet = FALSE){

  packages <- c(...)

  # Only keep package name
  packageName <- gsub("^.*/", "", packages)

  # Find if package isn't installed
  newPackages <- packages[!(packageName %in% utils::installed.packages()[,1])]

  # Install if required
  if (length(newPackages)){devtools::install_github(newPackages)}

  # Load packages
  sapply(packageName, require, character.only = TRUE)
}

