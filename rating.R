
recent_activity <- function(data){
  problem <-data$result$problem$name
  rating <-data$result$problem$rating
  last_10_vtm <-as.data.frame(data$result)
  last_10_vtm <-select(last_10_vtm, verdict, timeConsumedMillis ,memoryConsumedBytes )
  last_10_vtm <- mutate(last_10_vtm , memoryConsumed = floor(memoryConsumedBytes/1000000) ) %>% select( -3)
  last_10_data <- data.frame(problem, rating, last_10_vtm) 
  return (last_10_data)
}

rating_graph <- function(data){
  res_data <- data$result
  a <- c(0,1200, 1400, 1600, 1900)
  b <- c(1199,1399,1599,1899, 2399)
  graph <- plot_ly(res_data,
                   x=~as_datetime(ratingUpdateTimeSeconds),
                   y=~newRating,
                   color = "orange",
                  mode="lines+markers"
                   )

  return(graph)
}
