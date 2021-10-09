
library(jsonlite)
library(shiny)
library(shinyWidgets)
library(tidyverse)
library(glue)
library(DT)
library(httr)
library(ggplot2)
library(plotly)
library(lubridate)
library(shinyjs)
library(shiny.router)
library(shinydashboard)
library(shinydashboardPlus)
library(shinybusy)
library(shinyalert)

source("home/ui.R")
source("analytics/ui.R")
source("utils.R")
source("analytics/rating.R")
source("analytics/question_rating.R")
source("analytics/acceptance_graph.R")
source("analytics/question_category.R")
source("analytics/rating.R")
source("analytics/hero.R")
source("analytics/performance.R")


router <- make_router(
  route("/", uiOutput("homeUi")),
  route("analytics", uiOutput("analyticsUi"))
)

ui <- tags$div(
  router$ui
)

server <- function(input, output, session) {
  router$server(input,output,session)

  DATA <- reactiveValues(
    handle = NULL,
    api_data = NULL,
    rating_api_data = NULL
  )

  source("home/observers.R", local = TRUE)
  source("analytics/observers.R", local = TRUE)

  constructHomeUI(input,output,session)
  constructAnalyticsUI(input,output,session)
  
}

shinyApp(ui, server)