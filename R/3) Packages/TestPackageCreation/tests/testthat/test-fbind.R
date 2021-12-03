test_that("fbind() binds factor (or character)", {
  x <- c("a", "b")
  x_fact <- factor(x) # x is converted categorical vector or a factor
  y <- c("c", "d") # y is not converted categorical vector or a factor
  y_fact <- factor(y)
  z <- factor(c("a", "b", "c", "d"))

  expect_identical(fbind(x, y), z)
  expect_identical(fbind(x_fact, y), z)
  expect_identical(fbind(x_fact, y_fact), z)
})
