
question_rating <- function(data){
  
  flat_res <- data$result$problem
  
  graph_data <- flat_res %>%
    group_by(rating) %>%
    summarise(count = n()) %>%
    mutate(percent = round(count/sum(count)*100, digits = 2))
  
    
  graph <- plot_ly(
    graph_data, 
    x = ~rating, 
    y = ~count, 
    color = ~rating,
    
    type = 'bar',
    text = ~paste('</br> Count: ',count, 
                  '</br> Rating: ',rating,
                  '</br> Percent :',percent),
    hoverinfo = 'text'
    ) %>%
    layout(
      showlegend = FALSE
      # plot_bgcolor='transparent',
      # paper_bgcolor='transparent'
    )
  graph
  
  return(graph)
}

