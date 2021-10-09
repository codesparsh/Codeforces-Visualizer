readData <- function(handle)
{
  data <- GET(
    "https://codeforces.com/api/user.status",
    query = list("handle" = handle)
  )
  
  data <- fromJSON(rawToChar(data$content)) %>%
    as_tibble()
  
  return(data)
}

readRatingData <- function(handle){

  data <- GET(
    "http://codeforces.com/api/user.rating?",
    query = list("handle" = handle)
  )
  
  data <- fromJSON(rawToChar(data$content)) %>%
    as_tibble()
  
  return(data)
}

readImage <- function(handle)
{
  data <- GET(
    "https://codeforces.com/api/user.info",
    query = list("handles" = handle)
  )
  
  data <- fromJSON(rawToChar(data$content)) %>%
    as_tibble()
  
  return(data$result$titlePhoto)
}

