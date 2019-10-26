# Test suits for percentage results
# Function to be tested
context("PercentageCalc")

#test for correct municipality
test_that("invalid name found", {
  expect_error(PercentageCalc(PercentageInput = "GG"))
  expect_error(PercentageCalc(PercentageInput = ""))
})

#test for special charactars
test_that("Special characters Found ",{
  expect_error(PercentageCalc(PercentageInput = "!@#$$^&"))
  expect_error(PercentageCalc(PercentageInput = "12345"))
}
)
