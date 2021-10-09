constructHomeUI <- function(input,output,session){
    output$homeUi <- renderUI(
        getHomeUi()
    )
}


observeEvent(input$handle_search,{
    handle <- input$handle_input

    api_data <- readData(handle)
    rating_api_data <- readRatingData(handle)

    check = tryCatch({
    if(api_data$status != "FAILED"){
        DATA$handle <- handle
        DATA$api_data <- api_data
        DATA$rating_api_data <- rating_api_data
        show_modal_spinner(
            spin = "atom",
            color = "#112446",
            text = "Calculating your data",
        ) 
        delay(2000, remove_modal_spinner())
        change_page("analytics")
        
    }else{
        
        shinyalert("Oops!", "Handle not found", type = "error")
        updateTextInput(session ,"handle_input",value =  "")
        
    }
}, error = function(e){
   
    print(e)
})

    
})

