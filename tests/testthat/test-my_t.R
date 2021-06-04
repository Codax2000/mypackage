test_that("returns correct objects", {
  result <- my_t.test(my_penguins$bill_depth_mm, "two.sided", 15)
  expect_is(result, list)
  expect_equal(result$alternative, "two.sided")
})
