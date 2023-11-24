
spotify_search_artist <- function(artist_name) {
 
  base_url <- "https://api.spotify.com/v1/search"
  
 
  query <- paste0("q=", URLencode(artist_name), "&type=artist")
  
 
  response <- httr::GET(url = base_url, query = query)
  
  
  status_code <- httr::status_code(response)
  
 
  artist_data <- httr::content(response, as = "parsed")
  
  
  artist_results <- data.frame(
    artist = artist_data$artists$items$name,
    id = artist_data$artists$items$id
  )
  
  
  output_list <- list(
    status_code = status_code,
    search_results = artist_results
  )
  
  return(output_list)
}


result <- spotify_search_artist("Frank Sinatra")
print(result)

