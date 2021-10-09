

question_category <- function(data){
  
  check = tryCatch({
    
    flat_res <- data$result$problem 
    
    
    graph<- flat_res %>%
      group_by(index) %>%
      summarise(count = n()) %>%
      mutate(percent = round(count/sum(count)*100, digits = 2)) %>% plot_ly(
        x = ~index,
        y = ~count,
        color = ~index,
        colors="Paired",
        type = "bar",
        text = ~paste('</br> Count: ',count,
                      '</br> Problem Category: ', index,
                      '</br> Percent :',percent),
        hoverinfo = 'text'
        
      ) %>% layout(
        showlegend = FALSE
      )
    
    return(graph)
    
  }, error = function(e){
    print(e)
  })
 
}