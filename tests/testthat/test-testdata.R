# Rcatch22 must reproduce the catch22 C exactly: compare with the expected outputs
# in catch22 v1.1.0's testData (copied to testData/), which run_features writes as
# lines of "value, feature name, computation time (ms)" (catch24, masked).

# values separated by any whitespace; "nan", "inf" and "-inf" as written by C
read_values <- function(strings) {
  values <- suppressWarnings(as.numeric(strings))
  lower <- tolower(strings)
  values[lower == "nan"] <- NaN
  values[lower %in% c("inf", "+inf")] <- Inf
  values[lower == "-inf"] <- -Inf
  values
}

read_series <- function(path) {
  read_values(scan(path, what = character(), quiet = TRUE))
}

read_expected <- function(path) {
  lines <- readLines(path, warn = FALSE)
  parts <- strsplit(lines[nzchar(trimws(lines))], ",", fixed = TRUE)
  stats::setNames(read_values(trimws(vapply(parts, `[`, "", 1))),
                  trimws(vapply(parts, `[`, "", 2)))
}

outputs <- sort(list.files(test_path("testData"), pattern = "_output\\.txt$",
                           recursive = TRUE, full.names = TRUE))

test_that("the test data are present", {
  expect_equal(16, length(outputs))
})

for (out_path in outputs) {

  in_path <- sub("_output\\.txt$", ".txt", out_path)

  test_that(paste("matches catch22 C on", basename(in_path)), {

    expected <- read_expected(out_path)
    expect_equal(24, length(expected))
    x <- read_series(in_path)
    outs <- suppressWarnings(catch22_all(x, catch24 = TRUE))
    expect_equal(names(expected), outs$names)

    for (i in seq_along(expected)) {
      if (is.nan(expected[i])) {
        expect_true(is.nan(outs$values[i]), info = outs$names[i])
      } else {
        # the expected outputs are printed to 14 decimal places
        expect_lte(abs(outs$values[i] - expected[[i]]), 1e-9 * max(1, abs(expected[[i]])),
                   label = outs$names[i])
      }
    }
  })
}
