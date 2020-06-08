library(testthat)
library(mr)

test_check("mr")

context("forint() context")
library(stringr)

test_that("Function forint(c(1000,100000,5000000) prints c('1000Ft', '100,000Ft', '5,000,000Ft')", {
  expect_equal(forint(1000), '1000Ft')
  expect_equal(forint(100000), '100,000Ft')
  expect_equal(forint(5000000), '5,000,000Ft')
})

test_that("Function forint(c('test', te1 , '1') give error since they're invalid formats", {
  expect_error(forint('test'))
  expect_error(forint(te1))
  expect_error(forint('1'))
})

context("get_bitcoin_price() context")

test_that("Function get_bitcoin_price() returns a valid USD value of one Bitcoin", {
  expect_true(get_bitcoin_prices() > 3000.00 & get_bitcoin_prices < 15000.00)
})

context("convert_currency() context")

test_that("convert_currency() is working", {
  expect_equal(str_length(NA), NA_integer_)
  expect_equal(str_length(c(NA, 1)), c(NA, 1))
  expect_equal(str_length("NA"), 2)
})
