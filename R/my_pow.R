#' Power function
#'
#' This function raises input to a power.
#'
#' @param x Numeric input to be raised to the power of \code{power}.
#' @param pow Numeric input for the power that \code{x} will be raised to,
#'   defaults to \code{2}.
#'
#' @return Numeric representing \code{x} raised to the power of \code{power}.
#'
#' @examples
#' my_pow(4)
#' my_pow(4, pow = 3)
#'
#' @export
my_pow <- function(x, pow = 2) {
  return(x^pow)
}