test_that("k=1 works properly", {
  expect_is(my_rf_cv(1), numeric)
  expect_true(sqrt(my_rf_cv(1)) < 300) # should be less than 300
})
