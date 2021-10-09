performance_graph<- function(data)
{
  check = tryCatch({
    accepted_data<-data %>% filter(data$result$verdict =='OK')
    data1 <- as.data.frame(select(accepted_data$result, creationTimeSeconds))
    data2 <- as.data.frame(select(accepted_data$result$problem, rating))
    combined_data <- cbind(data1, data2) %>%mutate(year = year(as_datetime(creationTimeSeconds))) %>% group_by(year) %>% 
      summarise(meanRating = mean(rating,na.rm=T))
    graph<- plot_ly(combined_data, x = ~year, y = ~meanRating, name = 'Performance Graph', type = 'scatter', mode = 'lines+markers')
    #ggplot(combined_data,aes(year,meanRating)) + geom_line() +geom_point()
    return(graph)
  },  error = function(e){
   print(e)
  })
 
}