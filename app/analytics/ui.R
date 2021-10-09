
getAnalyticsUi <- function(){
    dashboardPage(
        header = dashboardHeader(title = textOutput("handle_title")),
        sidebar = dashboardSidebar(
            minified = FALSE, 
            collapsed = FALSE,
            sidebarMenu(
                tags$div(
                    uiOutput("avatar"),
                    id = "avatar"
                ),
                actionButton("b1","Problem Rating graph", class = "sidebar-action"),
                actionButton("b2", "Problem category Graph", class = "sidebar-action"),
                actionButton("b3","Acceptancy Graph", class = "sidebar-action"),
                actionButton("b4", "Recent Submissions", class = "sidebar-action"),
                actionButton("b5","Tagwise Problem Rank", class = "sidebar-action"),
                actionButton("b6", "Performance Graph", class = "sidebar-action"),
                actionButton("b7","User Rating Graph", class = "sidebar-action")
            )
            
        ),
        body = dashboardBody(     
            tags$div(
            tags$head(
                tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
                tags$script(type = "text/javascript", src = "script.js"),
            ),
            id = "ele1",
            h2("Codeforces Analytics",align = 'center'),
            fluidRow(
                
                column(
                align = "center",
                offset=2,
                width = 12,
                box(
                    title="Problem Rating graph",
                    status = "primary",
                    "Rating of problem solved v/s their count",
                    solidHeader = TRUE,
                    width = 8,
                    plotlyOutput("question_rating_plot")
                )       
                ),
                
            )
            ),
            tags$div(
            id = "ele2",   
            fluidRow(

                column(
                align = "center",
                offset=2,
                width = 12,
                box(
                    title="Problem category Graph",
                    "Index of problem solved v/s their count",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 8,
                    plotlyOutput("question_category_plot")
                )
                

                )
            )
            ),

            tags$div(
            id = "ele3", 
            fluidRow(
                
                column(
                align = "center",
                offset=2,
                width = 12,
                box(
                    title="Acceptancy Graph",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 8,
                    plotlyOutput("acceptance_graph_plot")
                )
                
                )
                
            )
            ),

            tags$div(
            id = "ele4", 
            fluidRow(
                column(
                align = "center",
                offset=2,
                width = 12,
                box(
                    title="Recent Submissions",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 8,
                    DT::dataTableOutput('recent_activity_table')
                )
                
                )
            )
            ),

            br(),
            tags$div(
            id = "ele5", 
            fluidRow(
                column(
                align = "center",
                offset=2,
                
                width = 12,
                box(
                    title="Tagwise Problem Rank",
                    "shows your rank of  for selected problems",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 8,
                    selectInput("heroTag", "Select topic tags" ,
                                choices = c("sad", "dasda")
                    ),
                    imageOutput("hero"),
                    
                    textOutput("heroTagVisible")
                )
                


                ),

            )
            ),

            tags$div(
            id = "ele6", 
            fluidRow(
                column(
                align = "center",
                offset=2,
                width = 12,
                box(
                    title="Performance Graph",
                    "Yearwise average problem rating that you solve",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 8,
                    plotlyOutput("preformance_graph_plot")
                )
                
                )
            )
            ),

            tags$div(
            id = "ele7", 
            fluidRow(
                column(
                align = "center",
                offset=2,
                width = 12,
                box(
                    title="User Rating Graph",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 8,
                    plotlyOutput("user_rating_plot")
                )
                )
            ),
            ),
            useShinyjs()
        ), 
    )
}