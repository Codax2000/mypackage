test_that("k=5 works properly", {
  # should reasonably be less than 400
  expect_true(sqrt(my_rf_cv(5)) < 400)
})
