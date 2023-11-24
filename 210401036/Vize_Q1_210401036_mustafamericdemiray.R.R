install.packages("testthat")
rm(list = ls())
library(httr)
library(base64enc)  

spotify_token <- function() {
  
  token_url <- "https://accounts.spotify.com/api/token"
  
 
  client_id <- Sys.getenv("SPOTIFY-ID")
  client_secret <- Sys.getenv("SPOTIFY_SECRET")
  
  
  auth_header <- base64encode(charToRaw(paste0(client_id, ":", client_secret)))
  
  
  response <- POST(
    url = token_url,
    add_headers(Authorization = paste("Basic", auth_header)),
    body = list(grant_type = "client_credentials"),
    encode = "form"
  )
  
  
  status_code <- status_code(response)
  token <- content(response)$access_token
  
  
  final_token <- paste("Bearer", token)
  
 
  return(list(status_code = status_code, token = final_token))
}


sonuc <- spotify_token()
print(sonuc$status_code)  
print(sonuc$token)       

