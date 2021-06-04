#' K-nearest Neighbors
#'
#' This function uses k nearest neighbors to train a knn model and test it using
#' k-fold cross validation.
#'
#' @param train a matrix representing the prediction variables for the result
#' @param cl a numeric vector indicating the true result
#' @param k_nn the number of nearest neighbors to use when training the model
#' @param k_cv the number of folds to use when performing cross-validation
#' @keywords machine learning
#'
#' @return a list with the predicted values of cl and the mean squared error
#' of the cross-validation testing
#'
#' @examples
#' subset <- my_gapminder[c("year", "lifeExp", "pop")]
#' my_knn_cv(subset, my_gapminder["gdpPercap"], 2, 5)
#'
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  # assign fold variable that assigns observations to folds
  fold <- sample(rep(1:k_cv, length = length(cl)))
  mc_rate <- vector(mode = "numeric", length = k_cv)
  # iterate through 1:k
  for (i in 1:k_cv) {
    # within each interation, use knn() to predict class of penguin
    is_test <- fold == i
    is_train <- !is_test
    fold_test <- train[is_test, ]
    fold_train <- train[is_train, ]
    cl_test <- cl[is_test]
    cl_train <- cl[is_train]
    # record prediction to get misclassification rate
    class <- class::knn(fold_train, fold_test, cl = cl_train, k = k_nn)
    mc_rate[i] <- mean(class != cl_test)
  }
  return(list("cv_error" = mean(mc_rate),
              "class" = class::knn(train, train, cl, k = k_nn)))
}
