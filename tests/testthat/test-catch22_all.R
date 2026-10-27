set.seed(1)
data <- stats::rnorm(100)

test_that("catch22 works", {

  outs22 <- catch22_all(data, catch24 = FALSE)

  expect_equal(22,
               nrow(outs22))
  expect_equal(c("names", "values"), colnames(outs22))
  expect_type(outs22$names, "character")
  expect_type(outs22$values, "double")
})

test_that("catch24 works", {

  outs24 <- catch22_all(data, catch24 = TRUE)

  expect_equal(24,
               nrow(outs24))
})

test_that("catch24 extends catch22 with the mean and standard deviation of the raw series", {

  x <- stats::rnorm(500, mean = 3, sd = 2)
  outs22 <- catch22_all(x)
  outs24 <- catch22_all(x, catch24 = TRUE)

  expect_identical(as.list(outs24[1:22, ]), as.list(outs22))
  expect_equal(c("DN_mean", "DN_Spread_std"), outs24$names[23:24])
  expect_equal(mean(x), outs24$values[23])
  expect_equal(stats::sd(x), outs24$values[24])
})

test_that("optional columns: short names and masked", {

  for (catch24 in c(FALSE, TRUE)) {
    outs <- catch22_all(data, catch24 = catch24, short_names = TRUE, return_masked = TRUE)
    expect_equal(c("names", "values", "short_names", "masked"), colnames(outs))
    expect_equal(catch22_feature_table(catch24)$short_name, outs$short_names)
    expect_type(outs$masked, "logical")
    expect_false(any(outs$masked))
  }
})

test_that("integer, logical and ts inputs work like doubles", {

  x <- c(3L, 1L, 4L, 1L, 5L, 9L, 2L, 6L, 5L, 3L, 5L, 8L, 9L, 7L, 9L, 3L, 2L, 3L, 8L, 4L)
  expect_identical(catch22_all(x, catch24 = TRUE), catch22_all(as.double(x), catch24 = TRUE))
  expect_identical(catch22_all(stats::ts(data)), catch22_all(data))
  expect_equal(22, nrow(catch22_all(data > 0)))
})

test_that("non-numeric input is an error", {

  expect_error(catch22_all(c("a", "b")), "numeric")
  expect_error(catch22_all(NULL), "numeric")
  expect_error(CO_trev_1_num(list(1, 2, 3)), "numeric")
})

test_that("NaN, NA or Inf in the series gives NaN for every feature (never masked), with a warning", {

  for (bad in c(NaN, NA, Inf, -Inf)) {
    x <- data
    x[1] <- bad
    expect_warning(outs <- catch22_all(x, catch24 = TRUE, return_masked = TRUE), "NaN")
    expect_true(all(is.nan(outs$values)))
    expect_false(any(outs$masked))
  }
  expect_warning(outs <- catch22_all(numeric(0)), "empty")
  expect_true(all(is.nan(outs$values)))
})

test_that("a constant series is masked by default, and NaN without masking", {

  x <- rep(3, 100)
  outs <- catch22_all(x, catch24 = TRUE, return_masked = TRUE)
  expect_equal(c(rep(TRUE, 22), FALSE, FALSE), outs$masked)
  expect_false(any(is.na(outs$values)))
  expect_equal(c(3, 0), outs$values[23:24])

  outs <- catch22_all(x, catch24 = TRUE, mask_nans = FALSE)
  expect_true(all(is.nan(outs$values[1:22])))
})

test_that("masking only replaces features that cannot be estimated", {

  x <- stats::rnorm(500)
  outs <- catch22_all(x, catch24 = TRUE, return_masked = TRUE)
  expect_false(any(outs$masked))
  expect_identical(outs$values, catch22_all(x, catch24 = TRUE, mask_nans = FALSE)$values)

  # dfa needs at least 79 samples (as in hctsa): masked below that, NaN without masking
  x <- stats::rnorm(60)
  outs <- catch22_all(x, return_masked = TRUE)
  i <- match("SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1", outs$names)
  expect_true(outs$masked[i])
  expect_true(is.nan(catch22_all(x, mask_nans = FALSE)$values[i]))
})

test_that("output is deterministic and the input is not modified", {

  x <- stats::rnorm(100)
  x_copy <- x + 0
  expect_identical(catch22_all(x, catch24 = TRUE), catch22_all(x, catch24 = TRUE))
  expect_identical(x_copy, x)
})

test_that("lag features are integer-valued", {

  x <- sin(2 * pi * (0:199) / 20)
  expect_equal(20, PD_PeriodicityWang_th0_01(x))
  expect_equal(10, CO_FirstMin_ac(x))
})

test_that("valid input gives no warnings", {

  expect_silent(catch22_all(data, catch24 = TRUE))
})
