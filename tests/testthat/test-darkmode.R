test_that("with_darkmode works", {
  expect_true(
    inherits(
      with_darkmode(),
      "shiny.tag.list"
    )
  )
})

test_that("html_dependency_darkmode works", {
  expect_true(
    inherits(
      html_dependency_darkmode(),
      "html_dependency"
    )
  )
})
