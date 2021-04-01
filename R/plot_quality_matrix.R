#' Produce a matrix visualisation of data types computed by feature calculation function.
#' @import dplyr
#' @import ggplot2
#' @param data a dataframe with at least 2 columns called 'names' and 'values'
#' @return an object of class ggplot that contains the graphic
#' @author Trent Henderson
#' @seealso [catchEmAll::catch22_all()]
#' @export
#' @examples
#' \dontrun{
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- catch22_all(x)
#' plot_quality_matrix(outs)
#' }
#'

plot_quality_matrix <- function(data){

  expected_cols_1 <- "names"
  expected_cols_2 <- "values"
  the_cols <- colnames(data)
  '%ni%' <- Negate('%in%')

  if(expected_cols_1 %ni% the_cols){
    stop("data should contain at least two columns called 'names' and 'values'. These are automatically produced by feature calculations such as catch_all(). Please consider running one of these first and then passing the resultant dataframe in to this function.")
  }

  if(expected_cols_2 %ni% the_cols){
    stop("data should contain at least two columns called 'names' and 'values'. These are automatically produced by feature calculations such as catch_all(). Please consider running one of these first and then passing the resultant dataframe in to this function.")
  }

  if(!is.numeric(data$values)){
    stop("'values' column in data should be a numerical vector.")
  }

  #--------------- Calculate proportions ------------

  tmp <- data %>%
    dplyr::mutate(quality = case_when(
                  is.na(values)                                                    ~ "NaN",
                  is.nan(values)                                                   ~ "NaN",
                  is.infinite(values)                                              ~ "Inf",
                  is.numeric() & !is.na(values) & !is.na(values) & !is.nan(values) ~ "Good")) %>%
    dplyr::group_by(names, quality) %>%
    dplyr::summarise() %>%
    dplyr::group_by(names) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(props = counter / sum(counter))

  #--------------- Draw plot ------------------------

  # Make a colour palette
  # Palette from: https://colorbrewer2.org/#type=diverging&scheme=RdBu&n=4

  my_palette <- c("-Inf" = "#ca0020",
                  "Inf" = "#f4a582",
                  "NaN" = "#92c5de",
                  "Good" = "#0571b0")

  # Plot

  p <- tmp %>%
    ggplot2::ggplot(ggplot2::aes(x = names, y = props)) +
    ggplot2::geom_bar(stat = "identity", ggplot2::aes(fill = quality)) +
    ggplot2::labs(title "Data quality matrix for computed features",
                  x = "Feature",
                  y = "Proportion of Outputs") +
    ggplot2::scale_y_continuous(limits = c(0,1),
                                breaks = seq(from = 0, to = 1, by = 0.1)) +
    ggplot2::scale_fill_manual(values = my_palette) +
    ggplot2::theme_bw() +
    ggplot2::theme(panel.grid = ggplot2::element_blank(),
                   legend.position = "bottom")

  return(p)
}
