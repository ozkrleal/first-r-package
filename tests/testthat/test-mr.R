context("forint() context")

test_that("Function forint(c(1000,100000,5000000) prints c('1,000Ft', '100,000Ft', '5,000,000Ft')", {
  expect_equal(forint(1000), '1,000Ft')
  expect_equal(forint(100000), '100,000Ft')
  expect_equal(forint(5000000), '5,000,000Ft')
})

test_that("Function forint(c('test', te1 , '1') give error since they're invalid formats", {
  expect_error(forint('test'))
  expect_error(forint(te1))
  expect_error(forint('1'))
})

context("convert_currency() context")

test_that("convert_currency() is working", {
  expect_equal(ncol(convert_currency("EUR", "HUF", 15)), 2)
  expect_true(nrow(convert_currency("HUF", "MXN", 30)) > 15 &
                nrow(convert_currency("HUF", "MXN", 30)) < 31)
})

#context("get_bitcoin_price() context")

#check_api <- function() {
#  if (!nrow(binancer::binance_coins_prices()) > 0) {
#    skip("API not available")
#  }
#}
#test_that("Function get_bitcoin_price() returns a valid USD value of one Bitcoin", {
#  check_api()
#  testthese <- get_bitcoin_price()
#  expect_true(testthese > 3000.00 & testthese < 15000.00)
#})
