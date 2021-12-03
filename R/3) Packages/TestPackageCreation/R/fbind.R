#'Create a function to coerce and combine two factors
#'
#'Binding Two factors
#'Create a new factor from two existing factors, where the new factor's levels
#'are the union of the levels of the input factors
#'
#' @param a factor
#' @param b factor
#'
#' @return factor
#' @export
#'
#' @examples
#' fbind(iris$Species[c(1, 51, 101)], PlantGrowth$group[c(1, 11, 21)])
#' location_a <- factor(c("Pilani", "Hyderabad"))
#' location_b <-  c("Goa", "Dubai")
#' location <- fbind(location_a, location_b)
fbind <- function(a, b) {
  factor(
    c(as.character(a),
      as.character(b)
      )
    )
}
