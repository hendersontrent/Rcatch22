# Rcatch22 1.0.0

* Updates the C code to catch22 v1.1.0.
  Every feature now exactly reproduces a feature of hctsa v3.0.0, so values change for most features.
  This includes fixes to four features, which now return the lag (not the lag minus one) for `PD_PeriodicityWang_th0_01` and `IN_AutoMutualInfoStats_40_gaussian_fmmi`, and count the longest stretches correctly for `SB_BinaryStats_mean_longstretch1` and `SB_BinaryStats_diff_longstretch0`.
* Ten features are renamed to their hctsa names (see `catch22_feature_table()`).
  `DN_Mean`, `DN_Spread_Std`, `MD_hrv_classic_pnn40` and `FC_LocalSimple_mean3_stderr` are only renamed, to `DN_mean`, `DN_Spread_std`, `MD_pNN_pnn40` and `FC_LocalSimple_mean3_stde`.
  `CO_f1ecac`, `CO_HistogramAMI_even_2_5`, `SB_TransitionMatrix_3ac_sumdiagcov`, `FC_LocalSimple_mean1_tauresrat`, `SP_Summaries_welch_rect_area_5_1` and `SP_Summaries_welch_rect_centroid` are renamed and redefined to match hctsa, as `CO_FirstCrossing_acf_1e_pointOfCrossing`, `CO_HistogramAMI_even_5bin_ami2`, `SB_TransitionMatrix_quantile_3_ac_sumdiagcov`, `FC_LocalSimple_mean1_taurat`, `SP_Summaries_fft_area_5_1` and `SP_Summaries_fft_wq_50`.
  The old names still work as deprecated aliases that compute the renamed feature, with a warning.
* `catch22_all()` returns the features in catch22 v1.0's order, which differs from earlier versions.
  `feature_list` holds the new names in this order.
* Features that cannot be estimated (e.g., for a constant or very short time series) are now masked by default: set to a fixed value at the appropriate end of their range, so that `catch22_all()` always returns real numbers.
  `mask_nans = FALSE` gives `NaN` for them instead, and `return_masked = TRUE` adds a `masked` column showing which values were masked.
  A time series containing `NaN`, `NA` or `Inf`, or an empty one, gives `NaN` for every feature, with a warning.
* `catch22_all()` gains `short_names = TRUE`, which adds the features' short names (e.g., `trev` for `CO_trev_1_num`) in a `short_names` column.
* The function for each feature takes `mask_nans` and gives exactly the value that `catch22_all()` gives.
* New `catch22_feature()` computes a single feature by its name or short name.
  Names from before 1.0.0 are an error that gives the feature's new name.
* New `catch22_feature_table()` gives each feature's name, short name, name before 1.0.0, and the hctsa call that reproduces it.
* The R code calls the catch22 C library's single entry point (`catch22_compute`), which does the z-scoring, masking and `NaN` handling, and takes the feature names from the C library.
* Removes the dependency on rlang.
* Tests check that every feature reproduces catch22 v1.1.0's expected outputs on its basic, simulated and pathological test data.
