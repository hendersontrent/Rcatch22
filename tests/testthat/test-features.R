set.seed(2)
data <- stats::rnorm(200)

# featureList.txt (from catch22 v1.2.0): name, short_name, legacy_name, hctsa_call
read_feature_list <- function() {
  path <- test_path("testData", "featureList.txt")
  lines <- readLines(path)
  lines <- lines[nzchar(lines) & !startsWith(lines, "#")]
  rows <- strsplit(lines, "\t", fixed = TRUE)
  table <- as.data.frame(do.call(rbind, rows[-1]), stringsAsFactors = FALSE)
  colnames(table) <- rows[[1]]
  table
}

test_that("the feature table matches catch22's featureList.txt", {

  expected <- read_feature_list()
  expect_equal(c("name", "short_name", "legacy_name", "hctsa_call"), colnames(expected))
  table <- catch22_feature_table(catch24 = TRUE)
  expect_equal(expected, table)
  expect_equal(as.list(expected[1:22, ]), as.list(catch22_feature_table()))
  expect_equal(table$name, catch22_all(data, catch24 = TRUE)$names)
  expect_equal(table$name[1:22], feature_list)
})

test_that("each feature function gives the catch22_all value", {

  outs <- catch22_all(data, catch24 = TRUE)
  exports <- getNamespaceExports("Rcatch22")
  for (i in seq_len(nrow(outs))) {
    name <- outs$names[i]
    expect_true(name %in% exports, info = name)
    expect_identical(outs$values[i], get(name)(data), info = name)
  }
})

test_that("feature functions match catch22_all on edge cases, with and without masking", {

  for (x in list(rep(3, 50), stats::rnorm(60), 2)) {
    for (mask_nans in c(TRUE, FALSE)) {
      outs <- catch22_all(x, catch24 = TRUE, mask_nans = mask_nans)
      for (i in seq_len(nrow(outs))) {
        expect_identical(outs$values[i], get(outs$names[i])(x, mask_nans = mask_nans),
                         info = outs$names[i])
      }
    }
  }
  expect_warning(value <- CO_trev_1_num(c(1, NaN, 2)), "NaN")
  expect_true(is.nan(value))
})

test_that("catch22_feature computes a feature by its name or short name", {

  outs <- catch22_all(data, catch24 = TRUE, short_names = TRUE)
  for (i in seq_len(nrow(outs))) {
    expect_identical(outs$values[i], catch22_feature(data, outs$names[i]))
    expect_identical(outs$values[i], catch22_feature(data, outs$short_names[i]))
  }
  expect_true(is.nan(catch22_feature(rep(3, 50), "trev", mask_nans = FALSE)))
  expect_error(catch22_feature(data, "not_a_feature"), "no catch22 feature")
  expect_error(catch22_feature(data, "CO_f1ecac"), "CO_FirstCrossing_acf_1e_pointOfCrossing")
  expect_error(catch22_feature(data, c("trev", "ami2")), "single")
})

test_that("names before v1.0 are deprecated aliases of the renamed features", {

  table <- catch22_feature_table(catch24 = TRUE)
  renamed <- table[table$legacy_name != table$name, ]
  expect_equal(10, nrow(renamed))
  renamed_only <- c("DN_Mean", "DN_Spread_Std", "MD_hrv_classic_pnn40",
                    "FC_LocalSimple_mean3_stderr")
  expect_setequal(renamed_only, Rcatch22:::RENAMED_ONLY)
  for (i in seq_len(nrow(renamed))) {
    legacy <- renamed$legacy_name[i]
    expect_true(legacy %in% getNamespaceExports("Rcatch22"), info = legacy)
    if (legacy %in% renamed_only) {
      why <- "(renamed in catch22 v1.0)"
    } else {
      why <- "(catch22 v1.0, which also changed its definition to match hctsa)"
    }
    expect_warning(value <- get(legacy)(data),
                   paste(legacy, "is now", renamed$name[i], why), fixed = TRUE)
    expect_identical(get(renamed$name[i])(data), value, info = legacy)
  }
  expect_warning(value <- DN_Spread_Std(rep(1, 10), mask_nans = FALSE), "DN_Spread_std")
  expect_equal(0, value)
})
