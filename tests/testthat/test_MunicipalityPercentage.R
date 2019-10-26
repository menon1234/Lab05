# Test suits for county result
# Function to be tested
context("MunicipalityPercentage")

# Test that function take available county name
test_that("found invalid county name", {
  expect_error(PercentageCalc(PercentageInput = "GG"))
  expect_error(PercentageCalc(PercentageInput = ""))
})

# test that no special characters or number in address
test_that("Found special characters",{
  expect_error(PercentageCalc(PercentageInput = "!@#$$^&"))
  expect_error(PercentageCalc(PercentageInput = "12345"))
}
)
