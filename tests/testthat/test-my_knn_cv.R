test_that("returns correct types", {
  train <- my_penguins %>%
    select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g)
  cl <- my_penguins$species
  result <- my_knn_cv(train, cl, 1, 5)
  expect_is(result, list)
  expect_is(result$cv_error, numeric)
  expect_is(result$class, vector)
})
