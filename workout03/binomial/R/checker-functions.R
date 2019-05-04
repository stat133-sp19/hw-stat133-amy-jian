#private function to check probability is valid
check_prob <- function(prob) {
  if (length(prob) != 1 | !is.numeric(prob)) {
    stop('invalid prob value')
  }
  if (prob < 0 | prob > 1) {
    stop('p must be between 0 and 1')
  }
  return (TRUE)
}

#private function to check trials is valid value
check_trials <- function(trials) {
  if (length(trials) != 1) {
    stop('invalid trials value')
  }
  if (trials < 1 | !is.numeric(trials) | trials %% 1 != 0) {
    stop('trials must be a non-negative integer')
  }
  return (TRUE)
}

#private function to check success is valid value
check_success <- function(success, trials) {
  if (sum(success > trials) > 0) {
    stop('success cannot be greater than trials')
  }
  if (sum(success < 0) > 0) {
    stop('success cannot be less than zero')
  }
  if (sum(success %% 1 != 0) > 0) {
    stop('success must be integer')
  }
  return (TRUE)
}

