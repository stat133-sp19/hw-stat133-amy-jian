#' @title Binomial Probability
#' @description Calculates probability of k successes in n trials with probability of success p
#' @param success vector of success values
#' @param trials number of trials
#' @param prob probability of a success
#' @return vector of probabilities of k successes for each success value
#' @export
#' @examples
#' bin_probability(1, 4, 0.6)
#'
#' bin_probability(2:4, 6, 0.8)
#'
#' bin_probability(success = 2, trials = 5, prob = 0.43)
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials, success) * prob^success * (1-prob)^(trials - success))
}

