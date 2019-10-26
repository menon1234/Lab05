# Test suits for county result
# Function to be tested
context("Municpality_Statistics")

# Test that function take available county name
test_that("found invalid county name", {
  expect_error(Municipality(MunicipalityInput = "Djikstra"))
  expect_error(Municipality(MunicipalityInput = ""))
})

# test that no special characters or number in address
test_that("Found special characters",{
  expect_error(Municipality(MunicipalityInput = "!@#$#%^"))
  expect_error(Municipality(MunicipalityInput = "1234567"))
}
)
