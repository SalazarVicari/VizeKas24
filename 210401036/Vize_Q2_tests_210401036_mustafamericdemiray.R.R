install.packages("here")
install.packages("testthat")
library(here)
library(testthat)


relative_path <- here("Vize_Q2_210401036_mustafamericdemiray.R")
library(testthat)

# Test 2.1: Global Workspace'de spotify_search_artist adlı bir değişken olmalı
test_that("Test 2.1: Global Workspace'de spotify_search_artist adlı bir değişken olmalı", {
  expect_true(exists("spotify_search_artist", envir = .GlobalEnv))
})

# Test 2.2: spotify_search_artist adlı değişkenin tipi "function" olmalı
test_that("Test 2.2: spotify_search_artist adlı değişkenin tipi 'function' olmalı", {
  expect_is(spotify_search_artist, "function")
})

# Test 2.3: spotify_search_artist() çağrıldığında döndürdüğü çıktı bir liste olmalı
test_that("Test 2.3: spotify_search_artist() çağrıldığında döndürdüğü çıktı bir liste olmalı", {
  result <- spotify_search_artist("Billie Eilish")
  expect_is(result, "list")
})

# Test 2.4: spotify_search_artist() çağrıldığında döndürdüğü listenin iki elementi olmalı
test_that("Test 2.4: spotify_search_artist() çağrıldığında döndürdüğü listenin iki elementi olmalı", {
  result <- spotify_search_artist("Billie Eilish")
  expect_length(result, 2)
})

# Test 2.5: spotify_search_artist() çağrıldığında döndürdüğü listenin ilk elementinin ismi status_code olmalı
test_that("Test 2.5: spotify_search_artist() çağrıldığında döndürdüğü listenin ilk elementinin ismi status_code olmalı", {
  result <- spotify_search_artist("Billie Eilish")
  expect_identical(names(result)[1], "status_code")
})

# Test 2.6: spotify_search_artist() çağrıldığında döndürdüğü listenin ilk elementinin class'ı numeric olmalı
test_that("Test 2.6: spotify_search_artist() çağrıldığında döndürdüğü listenin ilk elementinin class'ı numeric olmalı", {
  result <- spotify_search_artist("Billie Eilish")
  expect_is(result$status_code, "numeric")
})

# Test 2.7: spotify_search_artist() çağrıldığında döndürdüğü listenin status_code adlı elementinin değeri 200'e eşit olmalı
test_that("Test 2.7: spotify_search_artist() çağrıldığında döndürdüğü listenin status_code adlı elementinin değeri 200'e eşit olmalı", {
  result <- spotify_search_artist("Billie Eilish")
  expect_equal(result$status_code, 200)
})

# Test 2.8: spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin ismi search_results olmalı
test_that("Test 2.8: spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin ismi search_results olmalı", {
  result <- spotify_search_artist("Billie Eilish")
  expect_identical(names(result)[2], "search_results")
})

# Test 2.9: spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin class'ı data.frame olmalı
test_that("Test 2.9: spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin class'ı data.frame olmalı", {
  result <- spotify_search_artist("Billie Eilish")
  expect_is(result$search_results, "data.frame")
})

# Test 2.10: spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin iki sütun barındırmalı
test_that("Test 2.10: spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin iki sütun barındırmalı", {
  result <- spotify_search_artist("Billie Eilish")
  expect_equal(ncol(result$search_results