testthat::test_that("get_gazette works", {

  # visit API and return results
  territories <- queridodiario::territories
  territory <- sample(territories$territory_id, 1)

  # make API call for data.frame return
  results <- queridodiario::get_gazettes(
    territory_id = territory,
    since = '2021-03-01',
    until = '2021-04-01',
    size = 10
  )

  # check if results have been returned in data.frame format
  testthat::expect_s3_class(results, 'data.frame')

  # make API call for json return
  results <- queridodiario::get_gazettes(
    territory_id = territory,
    since = '2021-03-01',
    until = '2021-04-01',
    size = 10,
    returnDF = FALSE
  )

  # check if results have been returned in data.frame format
  testthat::expect_type(results, 'list')

  # check if message is printed to the console
  testthat::expect_message(
    queridodiario::get_gazettes(
      territory_id = '1234567',
      since = '2021-03-01',
      until = '2021-04-01',
      size = 10,
      returnDF = TRUE
    ),
    'query returned empty'
  )

})
