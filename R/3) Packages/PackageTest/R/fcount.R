#' Make a sorted frequency table for a factor
#'
#' @param x factor
#'
#' @return A tibble
#' @export
#' @examples
#' fcount(iris$Species)
#' char_gender <- c(rep("male",2), rep("female",3), rep("others", 4))
#' fcount(char_gender)

fcount <- function(x) {
  forcats::fct_count(x, sort = TRUE)
}
