context('check main binomial functions')

test_that('bin_choose is correct with valid values', {

  expect_equal(bin_choose(10, 0), 1)
  expect_equal(bin_choose(4, 2), 6)
  expect_equal(bin_choose(5, 3), bin_choose(5, 3))
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  expect_error(bin_choose(3, 7))
  expect_error(bin_choose(0, 9))
})

test_that('bin_probability with valid inputs', {

  expect_equal(bin_probability(0, 5, 0.5), 0.03125)
  expect_equal(bin_probability(0:2, 5, 0.5), c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(55, 100, 0.45), 0.01075277)
})

test_that('bin_probability fails with invalid inputs', {

  expect_error(bin_probability(2, 1, 0.4))
  expect_error(bin_probability(1, 5.3, 0.9))
  expect_error(bin_probability(3, 5, 2))
  expect_error(bin_probability(c(3, 5), 4, 1))
})

test_that('bin_distribution with valid inputs', {

  expect_equivalent(bin_distribution(5, 0.5),
               data.frame(success = 0:5,
                          probability = c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125)))
  expect_s3_class(bin_distribution(5, 0.5), 'bindis')
  expect_s3_class(bin_distribution(5, 0.5), 'data.frame')
  expect_named(bin_distribution(5, 0.5), c('success', 'probability'))
  expect_equal(sum(bin_distribution(4, 0.2)$probability), 1)
})

test_that('bin_distribution fails with invalid inputs', {

  expect_error(bin_distribution(4.2, 0.1))
  expect_error(bin_distribution(2, 3))
  expect_error(bin_distribution(-1, 0.8))
})

test_that('bin_cumulative with valid arguments', {

  expect_equivalent(bin_cumulative(5, 0.5),
                    data.frame(success = 0:5,
                               probability = c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125),
                               cumulative = c(0.03125, 0.18750, 0.5, 0.81250, 0.96875, 1)))
  expect_s3_class(bin_cumulative(5, 0.5), 'bincum')
  expect_s3_class(bin_cumulative(5, 0.5), 'data.frame')
  expect_named(bin_cumulative(5, 0.5), c('success', 'probability', 'cumulative'))
  expect_equal(nrow(bin_cumulative(3, 0.7)), 4)
})

test_that('bin_cumulative fails with invalid arguments', {

  expect_error(bin_cumulative(3, 1.2))
  expect_error(bin_cumulative(0, 0.4))
  expect_error(bin_cumulative(2.2, 0.6))
})
