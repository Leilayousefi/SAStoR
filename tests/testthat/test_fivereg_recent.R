context("fivereg_recent works as intended")

x <- phase_date_data(regreg)

mtcars_df_slot <- mtcars
mtcars_df_slot$df <- mtcars

manual_fivereg <- "allergen, statistical-geography-unitary-authority-eng, statistical-geography-non-metropolitan-district-eng, statistical-geography-registration-district-wls, statistical-geography-registration-district-eng"

test_that("fivereg_recent runs without errors", {
  expect_silent(fivereg_recent(x))

})
## press cmd+shift+T
# stringr::str_count(fivereg_recent(x, 10))
test_that("fivereg_recent errors if input is not suitable data.frame", {
  expect_error(fivereg_recent(15))
  expect_error(fivereg_recent(mtcars_df_slot))
})

test_that("fivereg_recent equals manual sorting, with n default to 5", {
  expect_equal(fivereg_recent(x), manual_fivereg)
})

test_that("fivereg_recent with n; correct number of commas", {
  expect_equal(stringr::str_count(fivereg_recent(x, 10),
                                  ","),
               9)
})
