

getHomeUi <- function() {
    tags$div(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
            tags$script(type = "text/javascript", src = "script.js")
        ),
        
       
        fluidRow(
            column(
                width = 12,
                tags$div(
                    useShinyalert(),
                    fluidRow(
                        p("Welcome to,", id = "welcome"),
                        p("Codeforces"),
                        p("Visualizer", id = "visualizer"),
                        tags$div(
                            p(id = "typewriter"),
                            id = "sub-heading"
                        ),
                        class = "heading"
                    ),
                    fluidRow(
                        textInput(
                        inputId = "handle_input",
                        label = "",
                        width = NULL,
                        placeholder = "handle"
                        ),
                        actionButton(
                            inputId = "handle_search",
                            label = "Get Started"
                        ),
                        class = "user_input"
                    ),
                    class = "left_wrapper row"
                ),
                id = "top_right_illustration"
            ),
        ),

        
         
    )
}
