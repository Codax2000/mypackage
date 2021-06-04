#' Linear Model
#'
#' This function fits a linear model for the given data using the given formula.
#'
#' @param data a data frame with named columns
#' @param formula a formula object specifying which columns of the data frame
#' to use in the model
#' @keywords regression
#'
#' @return table with the coefficients, standard errors, t values, and p values
#' of each term in the coefficient.
#'
#' @examples
#' data(my_gapminder)
#' my_lm(my_gapminder, lifeExp ~ pop + gdpPercap)
#'
#' @export
my_lm <- function(data, formula) {
  x <- model.matrix(object=formula, data=data)
  y <- model.response(model.frame(formula=formula, data=data))
  beta <- solve(t(x) %*% x) %*% t(x) %*% y
  df <- dim(data)[1] - length(beta)
  sigma_squared <- sum((y - x %*% beta) * (y - x %*% beta) / df)
  beta_error <- diag(sqrt(sigma_squared * solve(t(x) %*% x)))
  t <- beta / (beta_error)
  p_vals <- 2 * pt(abs(t), df, lower.tail = FALSE)
  result <- data.frame(
    "coefficients" = beta,
    "Std. Err" = beta_error,
    "t" = t,
    "Pr(>|t|)" = p_vals
  )
  result <- as.table(as.matrix(result))
  return(result)
}
