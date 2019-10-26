# Test suits for Municipality votes
# Function to be tested
context("Municipality")

#test for the correct municipality
test_that("invalid name entered", {
  expect_error(Municipality(MunicipalityInput = "Djikstra"))
  expect_error(Municipality(MunicipalityInput = ""))
})

#test for the special characters
test_that("Special characters found",{
  expect_error(Municipality(MunicipalityInput = "!@#$#%^"))
  expect_error(Municipality(MunicipalityInput = "1234567"))
}
)
