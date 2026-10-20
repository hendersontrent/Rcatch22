#include <Rcpp.h>
#include <climits>
#include <vector>

// The catch22 C library's single entry point (catch22.h), shared by every
// catch22 wrapper so that they all behave identically: z-scoring, masking and
// NaN/Inf handling all happen inside catch22_compute*, so nothing here
// transforms the input or the output.
extern "C" {
#include "catch22.h"
}

using namespace Rcpp;

static int series_length(const NumericVector &x)
{
  if (x.size() > INT_MAX) {
    stop("the time series is too long");
  }
  return (int) x.size();
}

// catch22_compute(): all 22 (or 24) features of a time series, as
// list(values, masked, ok)
// [[Rcpp::export]]
List catch22_compute_cpp(NumericVector x, bool catch24, bool mask_nans)
{
  const int n = series_length(x);
  const int nOut = catch22_n_features(catch24);
  std::vector<double> out(CATCH24_N_FEATURES);
  std::vector<int> masked(CATCH24_N_FEATURES);

  const int status = catch22_compute(x.begin(), n, catch24, mask_nans, out.data(), masked.data());

  NumericVector values(nOut);
  LogicalVector isMasked(nOut);
  for (int i = 0; i < nOut; i++) {
    values[i] = out[i];
    isMasked[i] = masked[i] != 0;
  }
  return List::create(Named("values") = values, Named("masked") = isMasked,
                      Named("ok") = status == CATCH22_OK);
}

// catch22_compute_feature(): one feature (0-based index) of a time series, as
// list(value, masked, ok)
// [[Rcpp::export]]
List catch22_compute_feature_cpp(NumericVector x, int index, bool mask_nans)
{
  if (index < 0 || index >= CATCH24_N_FEATURES) {
    stop("feature index out of range");
  }
  const int n = series_length(x);
  double out;
  int masked;

  const int status = catch22_compute_feature(x.begin(), n, index, mask_nans, &out, &masked);

  return List::create(Named("value") = out, Named("masked") = masked != 0,
                      Named("ok") = status == CATCH22_OK);
}

// The features' names, short names, catch22 v0.x names and hctsa calls, in the
// order of catch22_compute()
// [[Rcpp::export]]
DataFrame catch22_feature_table_cpp(bool catch24)
{
  const int nOut = catch22_n_features(catch24);
  CharacterVector name(nOut), shortName(nOut), legacyName(nOut), hctsaCall(nOut);
  for (int i = 0; i < nOut; i++) {
    name[i] = catch22_feature_name(i);
    shortName[i] = catch22_short_name(i);
    legacyName[i] = catch22_legacy_name(i);
    hctsaCall[i] = catch22_hctsa_call(i);
  }
  return DataFrame::create(Named("name") = name, Named("short_name") = shortName,
                           Named("legacy_name") = legacyName, Named("hctsa_call") = hctsaCall,
                           Named("stringsAsFactors") = false);
}

// The (0-based) index of the feature with this long or short name, or -1
// [[Rcpp::export]]
int catch22_feature_index_cpp(std::string name)
{
  return catch22_feature_index(name.c_str());
}
