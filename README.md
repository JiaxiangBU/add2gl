
<!-- README.md is generated from README.Rmd. Please edit that file -->

# add2gl

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/211744624.svg)](https://zenodo.org/badge/latestdoi/211744624)
<!-- badges: end -->

The goal of add2gl is to use GitLab API with R. If you use GitHub, use
[add2gh](https://github.com/JiaxiangBU/add2gh). If you prefer to use
GitLab using Python, try
[python-gitlab](https://python-gitlab.readthedocs.io).

## Installation

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("JiaxiangBU/add2gl")
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

## Citations

Jiaxiang Li. (2019, September 30). JiaxiangBU/add2gl: add2gl 0.1.0
(Version v0.1.0). Zenodo. <http://doi.org/10.5281/zenodo.3464628>

``` bibtex
@software{jiaxiang_li_2019_3464628,
  author       = {Jiaxiang Li},
  title        = {JiaxiangBU/add2gl: add2gl 0.1.0},
  month        = sep,
  year         = 2019,
  publisher    = {Zenodo},
  version      = {v0.1.0},
  doi          = {10.5281/zenodo.3464628},
  url          = {https://doi.org/10.5281/zenodo.3464628}
}
```

If you use add2gl, I would be very grateful if you can add a citation in
your published work. By citing add2gl, beyond acknowledging the work,
you contribute to make it more visible and guarantee its growing and
sustainability. For citation, please use the BibTex or the citation
content.

-----

<h4 align="center">

**Code of Conduct**

</h4>

<h6 align="center">

Please note that the `add2gl` project is released with a [Contributor
Code of
Conduct](https://github.com/JiaxiangBU/add2gl/blob/master/CODE_OF_CONDUCT.md).<br>By
contributing to this project, you agree to abide by its terms.

</h6>

<h4 align="center">

**License**

</h4>

<h6 align="center">

MIT © [Jiaxiang
Li](https://github.com/JiaxiangBU/add2gl/blob/master/LICENSE.md)

</h6>
