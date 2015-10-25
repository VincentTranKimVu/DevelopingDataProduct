# Load required libraries
library(shiny)

# Read data
data <- fread("./data/sets.csv")
head(data)
setnames(data, "t1", "theme")
setnames(data, "descr", "description")
setnames(data, "set_id", "setId")

# Exploratory data analysis
sum(is.na(data)) # 0
length(unique(data$setId)) # 303
table(data$year) # 1965 - 2015
length(table(data$year)) # 64
years <- sort(unique(data$year))
length(table(data$theme)) # 34
themes <- sort(unique(data$theme))

#' Aggregate dataset by year, piece and theme
#' 
#' @param data data.table
#' @param minYear
#' @param maxYear
#' @param minPiece
#' @param maxPiece
#' @param themes
#' @return data.table
#'
groupByYearAll <- function(data, minYear, maxYear, minPiece,
                           maxPiece, themes) {
  result <- data %>% filter(year >= minYear, year <= maxYear,
                          pieces >= minPiece, pieces <= maxPiece,
                          theme %in% themes) 
  return(result)
}

#' Aggregate dataset by themes
#' 
#' @param data data.table
#' @param minYear
#' @param maxYear
#' @param minPiece
#' @param maxPiece
#' @param themes
#' @return result data.table
#' 
groupByTheme <- function(data, minYear, maxYear, 
                         minPiece, maxPiece, themes) {
  data <- groupByYearAll(data, minYear, maxYear, minPiece, maxPiece, themes) 
  result <- datatable(data, options = list(iDisplayLength = 50))
  return(result)
}

#short for displaying
themes <- sort(unique(data$theme))

# Shiny server
shinyServer(
  function(input, output) {
    output$setid <- renderText({input$setid})

    # Initialize reactive
    values <- reactiveValues()
    values$themes <- themes
    
    # Create event type for checkbox
    output$themesControl <- renderUI({
      checkboxGroupInput('themes', 'Themes:', 
                         themes, selected = values$themes)
    })
    
    # Add observer on select-all button
    observe({
      if(input$selectAll == 0) return()
      values$themes <- themes
    })
    
    # Add observer on clear-all button
    observe({
      if(input$clearAll == 0) return()
      values$themes <- c() # set empty
    })
    
    # Prepare dataset
    dataTable <- reactive({
      groupByTheme(data, input$timeline[1], 
                   input$timeline[2], input$pieces[1],
                   input$pieces[2], input$themes)
    })
 
    # Render data table
    output$dTable <- renderDataTable({
      dataTable()
    })
    
  } # end of function(input, output)
)