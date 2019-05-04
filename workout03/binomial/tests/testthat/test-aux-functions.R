context('check summary functions')

test_that('aux_mean produces correct value', {

  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(5, 0.4), 2)
  expect_equal(aux_mean(7, 0.5), 3.5)
  expect_equal(aux_mean(6, 0.77), 6*0.77)
})

test_that('aux_variance produces correct value', {

  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(0, 0.2), 0)
  expect_equal(aux_variance(1, 0.6), 0.24)
  expect_equal(aux_variance(5, 0.37), 5*0.37*0.63)
})

test_that('aux_mode produces correct values', {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(7, 0.5), c(3, 4))
  expect_equal(aux_mode(4, 0.33), 1)
  expect_equal(aux_mode(0, 0.6), 0)
})

test_that('aux_skewness produces correct values', {
  expect_equal(aux_skewness(10, 0.3), (1-2*0.3)/sqrt(10*0.3*0.7))
  expect_equal(aux_skewness(6, 0.5), 0)
  expect_equal(aux_skewness(5, 0.1), (1-0.2)/sqrt(5*0.1*0.9))
  expect_equal(aux_skewness(1, 0.88), (1-2*0.88)/sqrt(1*0.88*0.12))
})

test_that('aux_kurtosis produces correct values', {
  expect_equal(aux_kurtosis(10, 0.3), (1-6*0.3*0.7)/10/0.3/0.7)
  expect_equal(aux_kurtosis(4, 0.66), (1-6*0.66*0.34)/4/0.34/0.66)
  expect_equal(aux_kurtosis(0, 0.9), Inf)
  expect_equal(aux_kurtosis(2, 1), Inf)
})
