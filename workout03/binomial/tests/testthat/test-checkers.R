context('check checker functions')

test_that('check_prob with valid probs', {

  expect_true(check_prob(0.7))
  expect_true(check_prob(0))
  expect_true(check_prob(1))
})

test_that('check_prob fails with invalid probs', {

  expect_error(check_prob(-1))
  expect_error(check_prob(3))
  expect_error(check_prob(c(0.3, 0.6)))
  expect_error(check_prob('a'))
})

test_that('check_trials with valid trial values', {

  expect_true(check_trials(4))
  expect_true(check_trials(1))
})

test_that('check_trials fails with invalid probs', {

  expect_error(check_trials(0))
  expect_error(check_trials(-1))
  expect_error(check_trials(c(1, 2)))
  expect_error(check_trials('a'))
  expect_error(check_trials(2.3))
})

test_that('check_success with valid values', {

  expect_true(check_success(1, 5))
  expect_true(check_success(c(3, 4), 7))
  expect_true(check_success(0, 2))
})

test_that('check_success fails with invalid values', {
  expect_error(check_success(-1, 4))
  expect_error(check_success(3, 2))
  expect_error(check_success(c(-2, 6), 8))
  expect_error(check_success(c(1, 6), 4))
})
