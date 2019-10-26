# Test suits for Municipality votes
# Function to be tested
context("Municipality")


test_that("found invalid county name", {
  expect_error(Municipality(MunicipalityInput = "Djikstra"))
  expect_error(Municipality(MunicipalityInput = ""))
})


test_that("Found special characters",{
  expect_error(Municipality(MunicipalityInput = "!@#$#%^"))
  expect_error(Municipality(MunicipalityInput = "1234567"))
}
)
