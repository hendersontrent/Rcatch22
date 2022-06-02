context("test-catch22_all")

data <- stats::rnorm(100)

test_that("catch22 works", {

  outs22 <- catch22_all(data, catch24 = FALSE)

  expect_equal(22,
               nrow(outs22))
})

test_that("catch24 works", {

  outs24 <- catch22_all(data, catch24 = TRUE)

  expect_equal(24,
               nrow(outs24))
})
