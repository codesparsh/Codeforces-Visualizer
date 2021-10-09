constructAnalyticsUI <- function(input,output,session){
    output$analyticsUi <- renderUI(
        getAnalyticsUi()
    )
}

observe({   
    runjs("for (var i = 1; i <=7; i++) {
        document.getElementById('b'+i).addEventListener('click', function() {
        var fired_button = this.id.substring(1);
        var elmnt = document.getElementById('ele'+fired_button);
        elmnt.scrollIntoView({behavior: 'smooth', inline: 'nearest'});
            });
        }"
    )

    handle <- DATA$handle
    data <- DATA$api_data
    rating_data <- DATA$rating_api_data

    tagsList <- strong_weak_topic(data)

    updateSelectInput(session , "heroTag" ,
      choices = tagsList
    )

    output$handle_title <- renderText(DATA$handle)

    output$question_rating_plot <- renderPlotly(
      question_rating(data)
    )
    output$hello_text <- renderText(glue("hello, {input$handle_search}"))
    
    
    output$avatar<- renderUI({
      src <- readImage(handle)
      tags$img(src=src, width = 200, height = 100)
    })
    
    output$question_category_plot <- renderPlotly(
      question_category(data)
    )
    
    output$recent_activity_table <- renderDataTable(
      recent_activity(data)
    )
    
    output$acceptance_graph_plot <- renderPlotly(
      acceptance_graph(data)
    )
    
    output$preformance_graph_plot <- renderPlotly(
      performance_graph(data)
    )
    output$user_rating_plot <- renderPlotly(
      rating_graph(rating_data)
    )
    
  }
)
  
observeEvent(input$heroTag, {

    check = tryCatch({
    str <- heroFunction(input$heroTag)
    str<-as.list(strsplit(str, " ")[[1]])
    address <- glue("www/assets/newHero/{str[1]}.png")
    output$heroTagVisible<-renderText(str[[2]][1])
    filename <- normalizePath(file.path(address))
    show_modal_spinner(
      spin = "atom",
      color = "#112446",
      text = "Calculating your data",
    ) 
    output$hero <- renderImage({
    list(
        src = filename,
        fileType = 'image/png',
        width = 400,
        height = 400,
        alt ="alternate"
    )
    }, deleteFile = F)
    delay(200, remove_modal_spinner())
}, error = function(e){
    print(e)
    print("error1")
})


    
    
  
})
  
