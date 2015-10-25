library(shiny)
library(BH)
library(rCharts)
require(markdown)
require(data.table)
library(dplyr)
library(DT)

shinyUI(pageWithSidebar(
  headerPanel("Control Panel"),
  
  
  sidebarPanel(

    sliderInput("timeline", 
                "Time Slider:", 
                min = 1950,
                max = 2015,
                value = c(2010, 2015)),
    sliderInput("pieces", 
                "#Pieces Slider:",
                min = -1,
                max = 10500,
                value = c(0, 1000) 
    ),

    uiOutput("themesControl"), # the id
    actionButton(inputId = "clearAll", 
                 label = "Clear All", 
                 icon = icon("square-o")),
    actionButton(inputId = "selectAll", 
                 label = "Select All", 
                 icon = icon("check-square-o"))
  ),

  mainPanel(
    h1('Data List'),
    dataTableOutput(outputId="dTable")
    
  )

))