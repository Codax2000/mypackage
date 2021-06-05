
# mypackage

<!-- badges: start -->
[![R-CMD-check](https://github.com/Codax2000/mypackage/workflows/R-CMD-check/badge.svg)](https://github.com/Codax2000/mypackage/actions)
[![codecov](https://codecov.io/gh/Codax2000/mypackage/branch/master/graph/badge.svg?token=93S218HZLT)](https://codecov.io/gh/Codax2000/mypackage)
<!-- badges: end -->

The goal of `mypackage` is to demonstrate my knowledge of writing packages
for STAT 302 at the University of Washington.

## Installation

You can install the released version of mypackage from GitHub with:

``` r
devtools::install_github("Codax2000/mypackage", build_vignette = TRUE, build_opts = c())
library(mypackage)
```

## Tutorial
To view the vignette for the demonstration of all main functions, use the
following code:

``` r
help(package = "mypackage", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "mypackage")
```

