#' @title Mean
#' @description Calculates the expected value of a binomial random variable
#' @param trials number of trials
#' @param prob probability of a success
#' @return the expected value
#' @export
#' @examples
#' bin_mean(4, 0.5)
#'
#' bin_mean(trials = 2, prob = 0.4)
#'
bin_mean <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_mean(trials, prob))
}

#' @title Variance
#' @description Calculates the variance of a binomial random variable
#' @param trials number of trials
#' @param prob probability of a success
#' @return the computed variance
#' @export
#' @examples
#' bin_variance(3, 0.7)
#'
#' bin_variance(trials = 6, prob = 0.4)
#'
bin_variance <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_variance(trials, prob))
}

#' @title Mode
#' @description Calculates the mode(s) of a binomial random variable
#' @param trials number of trials
#' @param prob probablility of a success
#' @return a vector of mode values
#' @export
#' @examples
#' bin_mode(7, 0.5)
#'
#' bin_mode(trials = 3, prob = 0.3)
#'
bin_mode <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_mode(trials, prob))
}

#' @title Skewness
#' @description Calculates the skewness of a binomial random variable
#' @param trials number of trials
#' @param prob probability of a success
#' @return the calculated skewness
#' @export
#' @examples
#' bin_skewness(5, 0.4)
#'
#' bin_skewness(trials = 2, prob = 0.9)
bin_skewness <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_skewness(trials, prob))
}

#' @title Kurtosis
#' @description Calculates the kurtosis of a binomial random variable
#' @param trials number of trials
#' @param prob probability of a success
#' @return the calculated kurtosis
#' @export
#' @examples
#' bin_kurtosis(7, 0.6)
#'
#' bin_kurtosis(trials = 5, prob = 0.25)
bin_kurtosis <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_kurtosis(trials, prob))
}
