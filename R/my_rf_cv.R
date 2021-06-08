#' Random Forest with K-fold Cross Validation
#'
#' This function predicts the body mass of penguins using the bill length,
#' the bill depth, and the flipper length. It is not generalizeable.
#'
#' @param k the number of folds to use in cross-validation
#' @keywords inference
#'
#' @return the average mse of the model across all folds
#'
#' @examples
#' my_rf_cv(3)
#' my_rf_cv(5)
#'
#' @export
my_rf_cv <- function(k) {
  local_penguins <- na.omit(my_penguins)
  fold <- sample(rep(1:k, length = length(local_penguins$bill_length_mm)))
  fold_mse <- vector(mode = "numeric", length = k)

  # iterate through 1:k
  for (i in 1:k) {
    is_test <- fold == i
    is_train <- !is_test
    fold_test <- local_penguins[is_test, ]
    fold_train <- local_penguins[is_train, ]
    # record prediction to get misclassification rate
    model <- randomForest::randomForest(body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm, data = fold_train, ntree = 100)
    predictions <- predict(model, fold_test)
    fold_mse[i] <- mean((predictions - fold_test$body_mass_g)^2)
  }
  return(mean(fold_mse))
}
