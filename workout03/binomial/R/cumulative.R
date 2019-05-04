#' @title Binomial Cumulative Distribution
#' @description Creates an object of class bincum
#' @param trials number of trials
#' @param prob probability of a success
#' @return an object of class bindis
#' @return a data frame of all possible success values and their corresponding probability P(x=k) and cumulative probability P(x≤k)
#' @export
#' @examples
#' bin_cumulative(6, 0.8)
#'
#' bin_cumulative(trials = 7, prob = 0.35)
#'
bin_cumulative <- function(trials, prob) {
  dis <- bin_distribution(trials, prob)
  dis$cumulative <- cumsum(dis$probability)
  class(dis) <- c('bincum', 'data.frame')
  return(dis)
}

#' @export
#' @import ggplot2
plot.bincum <- function(x, ...) {
  ggplot(x, aes(x = x$success, y = x$cumulative)) + geom_line() + geom_point() + labs(x='successes', y='probability')
}
