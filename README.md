
<!-- README.md is generated from README.Rmd. Please edit that file -->

HarpR <img src="man/figures/logo.png" align="right" />
======================================================

[![Travis-CI Build Status](https://travis-ci.org/mikey-harper/HarpR.svg?branch=master)](https://travis-ci.org/mikey-harper/HarpR)

Overview
--------

HarpR is a collection of general purpose functions which have been gathered and used frequently across projects. Having a general package like this was designed to bring together and simplifying using them across projects, and to save having to copy and paste between multiple projects.

Installation
------------

``` r
# Make sure devtools is installed to allow packages to be loaded from Github
install.packages("devtools")
devtools::install_github("mikey-harper/HarpR")
library(HarpR)
```

Useful functions:
-----------------

Users should read the [reference manual](HarpR.pdf) to find out more about the functions. Some of the useful functions within the package are:

-   `loadRequiredPackages(...)` checks installed packages, installs those which are missing, and loads the pacakges into the session.
-   `tidyNum(...)` reformats long numbers to include commas and prevents scientific formats
-   `outputMessage(...)` display a message in the console and pastes together strings. Equivalent to`print(paste(c(...)))`

Licence
-------

The code is shared under an MIT licence.

Copyright (c) 2018 Michael Harper

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
