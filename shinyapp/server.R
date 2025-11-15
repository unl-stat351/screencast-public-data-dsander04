server <- function(input, output, session) {

    filteredDF <- reactive({
        req(input$Versions, input$Books)
        all_counted %>%
            filter(Version %in% input$Versions, Book %in% input$Books)
    })

    output$Bar <- renderPlotly({
        req(filteredDF())
        plot_ly(filteredDF(), x=~Book, y= ~total_words, type = "bar", color = ~Version, text=~paste("Words:"), total_words, hoverinfo="text") %>%
            layout(barmode="group", xaxis=list(tickangle=-90))
    })

}

shinyApp(ui, server)
