library(shiny)
library(plotly)
library(datasets)

ui <- fluidPage(
    selectizeInput("Versions", "Select Versions", choices=unique(all_counted$Version), multiple = TRUE, options = list('plugins' = list('remove_button'))),
    selectizeInput("Books", "Select Books", choices=unique(all_counted$Book), multiple = TRUE, options = list('plugins' = list('remove_button'))),
    plotlyOutput("Bar")
)

