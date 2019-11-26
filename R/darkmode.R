#' Title
#'
#' @param bottom,right,left,time,mixColor,backgroundColor,buttonColorDark,buttonColorLight,saveInCookies,label,autoMatchOsTheme Parameters to pass to Darkmode.js
#' @param online Use CDN or local version
#' @rdname darkmode
#' @export
#' @importFrom shiny addResourcePath
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
  label = '',
  autoMatchOsTheme = TRUE,
  online = TRUE
){
  if (online){
    src <- "https://cdn.jsdelivr.net/npm/darkmode-js@1.5.3/lib/darkmode-js.min.js"
  } else {
    src <- "www/darkmode-js.min.js"
  }

  addResourcePath(
    "www", system.file(package = "darkmode")
  )

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

  options <- toJSON( options, auto_unbox = TRUE)

  tagList(
    tags$script(
      src = src
    ),
    tags$script(
      sprintf(
        'const darkmode = new Darkmode(%s); darkmode.showWidget();',
        options
      )

    )
  )
}
