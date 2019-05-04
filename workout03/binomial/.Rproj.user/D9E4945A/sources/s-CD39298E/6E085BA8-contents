#' @title Choose
#' @description Computes the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k vector of success values
#' @return a vector of the number of combinations for each success value
#' @export
#' @examples
#' choose(8, 5)
#'
#' choose(10, 2:4)
#'
#' choose(n = 6, k = 3)
#'
bin_choose <- function(n, k) {
  if (sum(k > n) != 0) {
    stop('k cannot be greater than n')
  }
  return (factorial(n)/factorial(k)/factorial(n-k))
}
