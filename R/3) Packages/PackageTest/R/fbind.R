#' Binder into a Factor
#' Binds Two vectors into a Factor
#'
#' @param a factor/character
#' @param b factor/character
#'
#' @return factor
#' @export
#'
#' @examples
#'char_a <- c("male", "female", "neutral")
#'fact_b <- factor(c("Pilani", "Hyderabad", "Goa", "Dubai"))
#'fbind(char_a,fact_b)

fbind <- function(a, b) {
  factor(
    c(as.character(a), as.character(b)))
}
