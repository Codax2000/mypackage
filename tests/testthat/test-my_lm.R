test_that("returns correct values on sample data", {
  local_penguins <- na.omit(my_penguins)
  result <- my_lm(local_penguins, bill_length_mm ~ body_mass_g)
  expect_true(result[1, 1] - 27.151 < 0.01)
  expect_true(result[2, 1] - 0.004 < 0.001)
})
