
acceptance_graph <- function(data){
  
  flat_res <- data$result %>%
    group_by(verdict) %>%
    summarise(count = n())
  colour <-c("#996633","#993399","#2196f3","#9ccc65","#ab47bc","#7e57c2","#3f51b5","#ef5350")
  graph <- flat_res[order(flat_res$verdict),] %>%
    plot_ly(labels = ~verdict, values = ~count, marker = list(colors = colour), type="pie")
  
  
  return(graph)
}