pkgdown_yaml <- yaml::read_yaml("_pkgdown.yaml")
left <- pkgdown_yaml$navbar$left
right <- pkgdown_yaml$navbar$right

navbar <- lapply(seq_len(length(left)), function(x) { 
  dropdown <- left[[x]]$menu  
  if (is.null(dropdown)) {
    left[[x]]$href
  } else 
    lapply(dropdown, function(y) y$href) %>% unlist()
})

titles <- lapply(seq_len(length(left)), function(x) left[[x]]$text) %>% unlist()
names(navbar) <- titles

testthat::context("Testing whether navbar entries are real")

testthat::test_that("Lectures (slides)", {
  test_nav <- navbar$`Lectures (slides)` %>% 
    gsub("^lectures/", "", .)
  test_files <- dir("inst/lectures", ".Rmd$") %>% 
    gsub("Rmd$", "html", .)
  testthat::expect_true(all(test_nav %in% test_files))
})

testthat::test_that("Lectures (html)", {
  test_nav <- navbar$`Lectures (html)` %>% 
    gsub("^lectures_html/", "", .)
  test_files <- dir("inst/lectures", ".Rmd$") %>% 
    gsub("Rmd$", "html", .)
  testthat::expect_true(all(test_nav %in% test_files))
})

testthat::test_that("Practicals (html)", {
  test_nav <- navbar$`Practicals (html)` %>% 
    gsub("^tutorials/", "", .)
  test_files <- dir("inst/tutorials/", ".Rmd$", recursive = TRUE) %>% 
    gsub("Rmd$", "html", .)
  testthat::expect_true(all(test_nav %in% test_files))
})
