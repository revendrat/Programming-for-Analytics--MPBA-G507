test_that("fbind: binding two vectors into a factor", {

char_a <- c("male", "female")
fact_a <- factor(char_a)
char_b <- c("other")
fact_b <- factor(char_b)

result_vec <- factor(c("male", "female", "other"))

expect_equal(fbind(char_a, char_b), result_vec)
expect_equal(fbind(char_a, fact_b), result_vec)
expect_equal(fbind(fact_a, fact_b), result_vec)
})
