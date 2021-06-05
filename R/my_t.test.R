#' Student's T Test
#'
#' Performs a one-sample t-test on the given vector of data
#'
#' @param x a numeric vector of data
#' @param alternative a character string specifying the alternative hypothesis,
#' must be one of "two.sided", "greater", or "less"
#' @param mu the null hypothesis value of the mean
#' @keywords inference
#'
#' @return List with entries for the t-statistic, the degrees of freedom,
#' the alternative hypothesis, and the p-value of the test
#'
#' @examples
#' my_t.test(c(1, 2, 1.5, 3, 2.1), "two.sided", 2)
#' my_t.test(c(3, 1, -2, -1, 0, -1), "less", 0)
#'
#' @export
my_t.test <- function(x, alternative, mu) {
  sample_mean <- mean(x)
  sample_sd <- sd(x) / sqrt(length(x))
  df <- length(x) - 1
  p <- 0
  t_statistic <- (sample_mean - mu) / sample_sd
  if (alternative == "less") {
    p <- pt(t_statistic, df)
  } else if (alternative == "greater") {
    p <- pt(t_statistic, df, lower.tail = FALSE)
  } else if (alternative == "two.sided") {
    # alternative is both sided test
    if (sample_mean < mu) {
      p <- 2 * pt(t_statistic, df)
    } else {
      p <- 2 * pt(t_statistic, df, lower.tail = FALSE)
    }

  } else {
    stop("The argument for 'alternative' should be either
         \"less\", \"greater\", or \"two.sided\"")
  }
  return(list(
    "test_stat" = t_statistic,
    "df" = df,
    "alternative" = alternative,
    "p_val" = p
  ))
}
