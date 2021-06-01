
# Rcatch22 <img src="man/figures/logo.png" align="right" width="120" />

[![CRAN
version](http://www.r-pkg.org/badges/version/Rcatch22)](http://www.r-pkg.org/pkg/Rcatch22)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/Rcatch22)](http://www.r-pkg.org/pkg/Rcatch22)
[![DOI](https://zenodo.org/badge/353530083.svg)](https://zenodo.org/badge/latestdoi/353530083)

R package for the calculation of [22 CAnonical Time-series
CHaracteristics](https://github.com/chlubba/catch22). The package is an
efficient implementation that calculates time-series features coded in
C.

## Installation

You can install the stable version of `Rcatch22` from CRAN using the
following:

``` r
install.packages("Rcatch22")
```

You can install the development version of `Rcatch22` from GitHub using
the following:

``` r
devtools::install_github("hendersontrent/Rcatch22")
```

## Wiki

Please open the included vignette within an R environment or visit the
detailed [`Rcatch22`
Wiki](https://github.com/hendersontrent/Rcatch22/wiki/) for information
and tutorials.

## Computational performance

With features coded in C, `Rcatch22` is highly computationally efficient
- scaling nearly linearly with time-series size. Computation time in
seconds for a range of time series lengths is presented below.

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

## Citation

A DOI is provided at the top of this README. Alternatively, the package
can be cited using the following:

``` 

To cite package 'Rcatch22' in publications use:

  Trent Henderson (2021). Rcatch22: Calculation of 22 CAnonical
  Time-Series CHaracteristics. R package version 0.1.12.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {Rcatch22: Calculation of 22 CAnonical Time-Series CHaracteristics},
    author = {Trent Henderson},
    year = {2021},
    note = {R package version 0.1.12},
  }
```

Please also cite the original *catch22* paper:

  - [Lubba et al. (2019). catch22: CAnonical Time-series
    CHaracteristics.](https://link.springer.com/article/10.1007/s10618-019-00647-x/)
