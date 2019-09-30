
<!-- README.md is generated from README.Rmd. Please edit that file -->

# add2gl

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/211744624.svg)](https://zenodo.org/badge/latestdoi/211744624)
<!-- badges: end -->

The goal of add2gl is to use GitLab API with R. If you use GitLab, use
[add2gh](https://github.com/JiaxiangBU/add2gh).

## Installation

You can install the released version of add2gl from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("add2gl")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(add2gl)
## basic example code
```

``` r
get_issue_content(
    "https://gitlab.com/JiaxiangBU/learn_git/issues/1",
    .api_url = readr::read_file("private-tokens/gitlab_api_url"),
    .token = readr::read_file("private-tokens/macbook-token-oct-gitlab")
)
```

-----

<h4 align="center">

**Code of Conduct**

</h4>

<h6 align="center">

Please note that the `add2gl` project is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md).<br>By contributing to this
project, you agree to abide by its terms.

</h6>

<h4 align="center">

**License**

</h4>

<h6 align="center">

MIT © [Jiaxiang Li](LICENSE.md)

</h6>
