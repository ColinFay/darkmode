
<!-- README.md is generated from README.Rmd. Please edit that file -->

# darkmode

<!-- badges: start -->

[![R-CMD-check](https://github.com/ColinFay/darkmode/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ColinFay/darkmode/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of darkmode is to provide a wrapper for
[Darkmode.js](https://github.com/sandoche/Darkmode.js) in `{shiny}`.

## Installation

You can install the released version of darkmode from GitHub with

``` r
pak::pak("colinfay/darkmode")
```

## About

You’re reading the doc about version : 1.0.0

This README has been compiled on the

``` r
Sys.time()
#> [1] "2023-03-26 14:41:47 CEST"
```

Here are the test & coverage results :

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading darkmode
#> ── R CMD check results ───────────────────────────────────── darkmode 1.0.0 ────
#> Duration: 8.5s
#> 
#> 0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

``` r
covr::package_coverage()
#> darkmode Coverage: 100.00%
#> R/darkmode.R: 100.00%
```

## Example

``` r
library(darkmode)
library(shiny)
ui <- function(request){
  fluidPage(
    with_darkmode(),
    h2("Plop"),
    tableOutput("bing")
  )
}

server <- function(
  input,
  output,
  session
){

  output$bing <- renderTable({
    head(iris)
  })
}

shinyApp(ui, server)
```

You can set parameters for the darkmode:

``` r
library(darkmode)
library(shiny)
ui <- function(request){
  fluidPage(
    with_darkmode(label = "🤘"),
    h2("Plop"),
    tableOutput("bing")
  )
}

server <- function(
  input,
  output,
  session
){

  output$bing <- renderTable({
    head(iris)
  })
}

shinyApp(ui, server)
```

![](readmefigs/darkmode.gif)
