test_that("returns correct types", {
  local_penguins <- na.omit(my_penguins)
  train <- local_penguins %>%
    dplyr::select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g)
  cl <- local_penguins$species
  result <- my_knn_cv(train, cl, 1, 5)
  expect_true(result$cv_error < 0.2)
})
