#' Title
#'
#' @param bottom,right,left,time,mixColor,backgroundColor,buttonColorDark,buttonColorLight,saveInCookies,label,autoMatchOsTheme Parameters to pass to Darkmode.js
#' @rdname darkmode
#' @export
#' @importFrom jsonlite toJSON
#' @importFrom htmltools tags tagList
with_darkmode <- function(
  bottom = '32px',
  right = '32px',
  left = 'unset',
  time = '0.3s',
  mixColor = '#fff',
  backgroundColor = '#fff',
  buttonColorDark = '#100f2c',
  buttonColorLight = '#fff',
  saveInCookies = TRUE,
  label = "",
  autoMatchOsTheme = TRUE
){
  options <- list(
    bottom = bottom,
    right = right,
    left = left,
    time = time,
    mixColor = mixColor,
    backgroundColor = backgroundColor,
    buttonColorDark = buttonColorDark,
    buttonColorLight = buttonColorLight,
    saveInCookies = saveInCookies,
    label = label,
    autoMatchOsTheme = autoMatchOsTheme
  )

  options <- toJSON(options, auto_unbox = TRUE)

  tagList(
    html_dependency_darkmode(),
    tags$script(
      sprintf(
        'window.addEventListener("load", function(){new Darkmode(%s).showWidget();});',
        options
      )
    )
  )
}

#' @rdname darkmode
#' @export
html_dependency_darkmode <- function() {
  htmltools::htmlDependency(
    name = "darkmode-js",
    version = "1.5.3",
    package = "darkmode",
    src = c(
      file = "",
      href = "https://cdn.jsdelivr.net/npm/darkmode-js@1.5.3/lib/"
    ),
    script = "darkmode-js.min.js",
    all_files = FALSE
  )
}
